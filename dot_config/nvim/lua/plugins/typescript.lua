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
    -- {
    --   "windwp/nvim-ts-autotag",
    --   cond = false,
    -- },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        settings = {
          expose_as_code_action = "all",
          jsx_close_tag = {
            enable = true,
            filetypes = { "javascriptreact", "typescriptreact" },
          },
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
      config = function(opts)
        require("lazyvim.util.lsp").on_attach(function(client, bufnr)
          local keymap = vim.keymap.set
          if client.name == "typescript-tools" then
            keymap(
              "n",
              "<leader>la",
              "<cmd>TSToolsAddMissingImports<cr>",
              { buffer = bufnr, desc = "Add Missing Imports" }
            )
            keymap("n", "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", { buffer = bufnr, desc = "Organize Imports" })
            keymap("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>", { buffer = bufnr, desc = "Sort Imports" })
            keymap("n", "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>", { buffer = bufnr, desc = "Removed Unused" })
            keymap(
              "n",
              "<leader>lr",
              "<cmd>TSToolsRemoveUnusedImports<cr>",
              { buffer = bufnr, desc = "Removed Unused Imports" }
            )
            keymap(
              "n",
              "<leader>ld",
              "<cmd>TSToolsGoToSourceDefinition<cr>",
              { buffer = bufnr, desc = "Go To Source Definition" }
            )
            keymap("n", "<leader>lf", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
            require("twoslash-queries").attach(client, bufnr)
          end
        end)
        require("typescript-tools").setup(opts)
      end,
    },
  },
}
