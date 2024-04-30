return {
  {
    "alker0/chezmoi.vim",
    init = function()
      -- required
      vim.g["chezmoi#use_tmp_buffer"] = true
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    highlight = {
      disable = function()
        if string.find(vim.bo.filetype, "chezmoitmpl") then
          return true
        end
      end,
    },
  },
}
