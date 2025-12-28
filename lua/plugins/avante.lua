return {
  {
    "yetone/avante.nvim",
    opts = function(_, opts)
      opts.provider = "zai"
      opts.providers = opts.providers or {}

      -- Perplexity
      opts.providers.perplexity = {
        __inherited_from = "openai",
        endpoint = "https://api.perplexity.ai",
        model = "sonar-pro",
        api_key_name = "PERPLEXITY_API_KEY",
        disable_tools = true,
      }

      -- Z.ai (GLM)
      opts.providers.zai = {
        __inherited_from = "openai",
        endpoint = "https://api.z.ai/api/coding/paas/v4",
        model = "glm-4.6", -- atau "glm-4.5", "glm-4.5-air"
        api_key_name = "ZAI_API_KEY",
        max_tokens = 8192,
        extra_request_body = {
          temperature = 1.0,
        },
      }

      -- Set keymap untuk normal dan visual mode
      opts.mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        toggle = "<leader>at",
      }

      return opts
    end,

    -- TAMBAHKAN INI: Set keymap manual untuk visual mode
    keys = {
      -- Normal mode keymaps
      {
        "<leader>aa",
        function()
          require("avante.api").ask()
        end,
        desc = "Avante: Ask",
        mode = "n",
      },
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        desc = "Avante: Edit",
        mode = "n",
      },
      {
        "<leader>ar",
        function()
          require("avante.api").refresh()
        end,
        desc = "Avante: Refresh",
        mode = "n",
      },
      {
        "<leader>at",
        function()
          require("avante.api").toggle()
        end,
        desc = "Avante: Toggle",
        mode = "n",
      },

      -- Visual mode keymaps (PENTING!)
      {
        "<leader>aa",
        function()
          require("avante.api").ask()
        end,
        desc = "Avante: Ask",
        mode = "v",
      },
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        desc = "Avante: Edit",
        mode = "v",
      },
      {
        "<leader>ar",
        function()
          require("avante.api").refresh()
        end,
        desc = "Avante: Refresh",
        mode = "v",
      },
    },
  },
}
