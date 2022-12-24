local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd[[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerCompile
    augroup end
]])

local function config(name)
    return string.format('require("plugins.%s")', name)
end

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"

    -- completion engine
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = config("cmp")
    }

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "onsails/lspkind.nvim"

    -- manager of LSP servers, DAP servers, linters, and formatters
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    }

    -- colorscheme
    use "lifepillar/vim-solarized8"
    use "sainnhe/gruvbox-material"
    use {
        "sainnhe/edge",
        config = config("colorscheme")
    }

    -- statusline
    use {
        "nvim-lualine/lualine.nvim",
        requires = { 'nvim-tree/nvim-web-devicons', opt = true},
        config = config("statusline")
    }

    -- bufferline
    use {
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        requires = "nvim-tree/nvim-web-devicons",
        config = config("bufferline")
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',
        config = config("treesitter")

    }

    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = config("autopairs")
    }

    -- comment
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    -- fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = "nvim-lua/plenary.nvim",
        config = config("telescope")
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
