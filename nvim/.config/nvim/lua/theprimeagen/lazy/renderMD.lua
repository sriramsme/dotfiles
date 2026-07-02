return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("render-markdown").setup({
      heading = {
        enabled = true,
        sign = true,
        icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
      },
      code = {
        enabled = true,
        style = "full",
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
    })
  end,
}
