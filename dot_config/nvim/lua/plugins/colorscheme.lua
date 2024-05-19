return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = false,
      dim_inactive = {
        enable = true,
        shade = "dark",
        percentage = 0.25,
      },
      term_colors = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
