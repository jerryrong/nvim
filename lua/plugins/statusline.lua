local function get_cwd_dir()
  local cwd = vim.fn.getcwd()
  -- local home = os.getenv("HOME")
  -- if cwd:find(home, 1, true) == 1 then
  --     cwd = "~" .. cwd:sub(#home + 1)
  -- end
  local index = cwd:find("/[^/]*$")
  return cwd:sub(index + 1)
end

-- local sep_icons = {
--   { left = "", right = " " },
-- }

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    -- theme = "solarized_dark",
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
})
