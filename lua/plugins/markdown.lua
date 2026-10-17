-- Pengerusakan extra lang.markdown (markdownlint-cli2).
-- Render-markdown.nvim & markdown-preview tetap aktif.
return {
  -- 1) Hapus markdown dari nvim-lint (hilangkan diagnostik error di editor)
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      if opts.linters_by_ft then
        opts.linters_by_ft.markdown = nil
      end
    end,
  },
  -- 2) Hapus markdownlint-cli2 & markdown-toc dari conform (anti auto-fix saat save)
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      if not opts.formatters_by_ft then
        return
      end
      local function bersihkan(ft)
        local list = opts.formatters_by_ft[ft]
        if list then
          opts.formatters_by_ft[ft] = vim.tbl_filter(function(f)
            return f ~= "markdownlint-cli2" and f ~= "markdown-toc"
          end, list)
        end
      end
      bersihkan("markdown")
      bersihkan("markdown.mdx")
    end,
  },
}
