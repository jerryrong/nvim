require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "lua",
        "python",
        "go",
        "vim"
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    }
})
