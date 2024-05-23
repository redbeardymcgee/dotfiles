return {
  {
    "wlangstroth/vim-racket",
    dependencies = {
      { "Olical/conjure" },
      { "PaterJason/cmp-conjure" },
      {
        "nvim-cmp",
        opts = function(_, opts)
          table.insert(opts.sources, 1, {
            name = "conjure",
            group_index = 1,
            priority = 100,
          })
        end,
      },
    },
  },
}
