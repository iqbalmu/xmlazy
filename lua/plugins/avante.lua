return {
  {
    "yetone/avante.nvim",
    enabled = false,
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
        model = "glm-4.6",
        api_key_name = "ZAI_API_KEY",
        max_tokens = 8192,
        extra_request_body = {
          temperature = 1.0,
        },
      }

      -- Keymaps untuk normal dan visual mode
      opts.mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        toggle = "<leader>at",
      }

      return opts
    end,
  },
}
