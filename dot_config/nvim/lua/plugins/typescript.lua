return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          function(server_name)
            if server_name == "tsserver" then
              return
            end
          end,
        },
      },
    },
    {
      "windwp/nvim-ts-autotag",
      cond = false,
    },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        settings = {
          expose_as_code_action = "all",
          jsx_close_tag = {
            enable = true,
            filetypes = { "javascriptreact", "typescriptreact" },
            tsserver_file_preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    },
  },
}
