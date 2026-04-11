return {
  "IogaMaster/neocord",
  -- enabled = false,
  event = "VeryLazy",
  config = function()
    require("neocord").setup({
      editing = "Editing %s",
      file_path = true,
      workspace = "Workspace: %s",
    })
  end,
}
