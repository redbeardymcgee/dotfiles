return {
  {
    "catppuccin",
    opts = {
      transparent_background = false,
      dim_inactive = {
        enable = true,
        shade = "dark",
        percentage = 0.25,
      },
    },
    integrations = {
      noice = true,
      nvim_notify = true,
      lsp_trouble = true,
      which_key = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
