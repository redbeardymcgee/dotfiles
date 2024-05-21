return {
  "craigmac/nvim-navigator",
  opts = {
    disable_on_zoom = true,
  },
  keys = {
    { "<C-h>", "<CMD>NavigatorLeft<CR>", mode = { "n", "t" } },
    { "<C-l>", "<CMD>NavigatorRight<CR>", mode = { "n", "t" } },
    { "<C-k>", "<CMD>NavigatorUp<CR>", mode = { "n", "t" } },
    { "<C-j>", "<CMD>NavigatorDown<CR>", mode = { "n", "t" } },
  },
}
