return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      -- Hide mode
      lualine_a = {},
      -- Hide scroll progress
      lualine_y = {
        { "location", padding = { left = 0, right = 1 } },
      },
      -- Hide clock
      lualine_z = {},
    },
  },
}
