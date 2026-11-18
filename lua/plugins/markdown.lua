-- Disable markdownlint-cli2 from lang.markdown extra while keeping
-- render-markdown.nvim and markdown-preview active.
return {
  -- 1) Remove markdown from nvim-lint (hide lint diagnostics in editor)
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      if opts.linters_by_ft then
        opts.linters_by_ft.markdown = nil
      end
    end,
  },
  -- 2) Remove markdownlint-cli2 and markdown-toc from conform (prevent auto-fix on save)
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      if not opts.formatters_by_ft then
        return
      end
      local function strip_markdown_formatters(ft)
        local list = opts.formatters_by_ft[ft]
        if list then
          opts.formatters_by_ft[ft] = vim.tbl_filter(function(f)
            return f ~= "markdownlint-cli2" and f ~= "markdown-toc"
          end, list)
        end
      end
      strip_markdown_formatters("markdown")
      strip_markdown_formatters("markdown.mdx")
    end,
  },
}
