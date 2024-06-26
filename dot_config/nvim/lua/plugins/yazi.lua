return {
  "mikavilpas/yazi.nvim",
  cond = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>-",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the file manager",
    },
    {
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    open_for_directories = true,
  },
}
