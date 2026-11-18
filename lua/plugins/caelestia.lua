-- Applies the caelestia colorscheme under lazy.nvim.
-- Not using lazy.nvim? Put colors/caelestia.lua on your runtimepath and call
-- vim.cmd.colorscheme("caelestia") yourself.
--
-- vim.g.caelestia_transparent = false  -- opaque background, default true
--
-- Only claims the colorscheme when a caelestia scheme.json actually exists
-- (caelestia-dots systems). Elsewhere (e.g. DankMaterialShell, which writes
-- its matugen output elsewhere) this stays out of the way so the theme
-- follower in plugins/color-schemes.lua is in charge.

local state_home = os.getenv("XDG_STATE_HOME") or ((os.getenv("HOME") or "") .. "/.local/state")
local scheme_path = state_home .. "/caelestia/scheme.json"

local function has_scheme()
  local f = io.open(scheme_path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

if not has_scheme() then
  return {}
end

-- VimEnter so plugins shipping highlight groups have loaded first
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  group = vim.api.nvim_create_augroup("caelestia_colorscheme", { clear = true }),
  callback = function()
    pcall(vim.cmd.colorscheme, "caelestia")
  end,
})

-- optional = true so this only applies if LazyVim is already installed
return {
  { "LazyVim/LazyVim", optional = true, opts = { colorscheme = "caelestia" } },
}
