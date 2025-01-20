-- nvchad ui and base46 themes --
return {
  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvchad/ui",
    config = function()
      require("nvchad")
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  { "nvchad/volt" }, -- needed for theme switcher
}
