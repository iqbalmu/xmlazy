-- Theme follows the system dark/light preference.
--   dark  -> vaporwave (onedarkpro)
--   light -> onelight  (onedarkpro)
--
-- Source of truth: the freedesktop color-scheme setting
-- (gsettings org.gnome.desktop.interface color-scheme; DMS keeps it in sync
-- with its dark/light toggle). It is read synchronously at startup so no
-- other colorscheme can win the boot race, then tracked live via
-- `gsettings monitor` for switches while nvim is open.

local M = { applied = nil }

local function system_mode()
  -- 'prefer-dark' -> dark; 'default' / 'prefer-light' / unreadable -> light
  local ok, out = pcall(vim.fn.system, { "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" })
  if not ok or vim.v.shell_error ~= 0 then
    return nil
  end
  if out:find("prefer-dark", 1, true) then
    return "dark"
  end
  return "light"
end

function M.apply(mode)
  if M.applied == mode then
    return
  end
  M.applied = mode
  -- onedarkpro doesn't set background itself; keep it in sync so plugins
  -- reading vim.o.background agree with the active theme
  vim.o.background = mode
  if mode == "dark" then
    pcall(vim.cmd.colorscheme, "vaporwave")
  else
    pcall(vim.cmd.colorscheme, "onelight")
  end
end

local function watch()
  -- No gsettings (headless/SSH): nothing to track, initial theme stands
  if vim.fn.executable("gsettings") ~= 1 then
    return
  end
  vim.fn.jobstart({ "gsettings", "monitor", "org.gnome.desktop.interface", "color-scheme" }, {
    on_stdout = function(_, data)
      local txt = type(data) == "table" and table.concat(data, "\n") or ""
      -- monitor emits: color-scheme: 'prefer-dark' / 'default'
      if txt:find("prefer-dark", 1, true) then
        M.apply("dark")
      elseif txt:find("color-scheme", 1, true) then
        M.apply("light")
      end
    end,
  })
end

local function has_caelestia_scheme()
  local state_home = os.getenv("XDG_STATE_HOME") or ((os.getenv("HOME") or "") .. "/.local/state")
  return (vim.uv or vim.loop).fs_stat(state_home .. "/caelestia/scheme.json") ~= nil
end

return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1001,
    cond = function()
      return not has_caelestia_scheme()
    end,
    config = function()
      require("onedarkpro").setup({
        options = {
          transparency = true,
          terminal_colors = true,
          lualine_transparency = true,
        },
      })

      -- Dashboard highlights are tuned for dark backgrounds; only apply them
      -- in dark mode so they don't wash out onelight.
      local dark_hl = {
        DashboardHeader = { fg = "#c678dd", bold = true },
        DashboardFooter = { fg = "#61afef", italic = true },
        DashboardShortcut = { fg = "#e5c07b" },
        DashboardIcon = { fg = "#98c379" },
        DashboardKey = { fg = "#e06c75", bold = true },
        DashboardDesc = { fg = "#abb2bf" },
        DashboardProjectTitle = { fg = "#d19a66", bold = true },
        DashboardProjectIcon = { fg = "#56b6c2" },
        DashboardMruTitle = { fg = "#d19a66", bold = true },
        DashboardMruIcon = { fg = "#56b6c2" },
        DashboardFiles = { fg = "#abb2bf" },
      }
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          if vim.o.background ~= "dark" then
            return
          end
          for group, spec in pairs(dark_hl) do
            vim.api.nvim_set_hl(0, group, spec)
          end
        end,
      })

      -- Stay out of the way when caelestia is managing the colorscheme
      if not has_caelestia_scheme() then
        M.apply(system_mode() or "dark")
        watch()
      end
    end,
  },
}
