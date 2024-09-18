local function get_cwd_dir()
  local cwd = vim.fn.getcwd()
  -- local home = os.getenv("HOME")
  -- if cwd:find(home, 1, true) == 1 then
  --     cwd = "~" .. cwd:sub(#home + 1)
  -- end
  local index = cwd:find("/[^/]*$")
  return cwd:sub(index + 1)
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
      },
      sections = {
        lualine_b = { get_cwd_dir, "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 1,
            shorting_target = 40,
          },
        },
      },
    },
  },
}
