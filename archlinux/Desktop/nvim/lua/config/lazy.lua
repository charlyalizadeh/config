local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- Oxocarbon colorscheme
        {
            "nyoom-engineering/oxocarbon.nvim",
            config = function() vim.cmd.colorscheme "oxocarbon" end,
            priotity = 1000
        },
        -- TreeSitter for highlighting
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function () 
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "html", "python" },
                    sync_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },  
                })
            end
        },
        -- Indent line
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {}
        },
        -- Buffer tab
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = "nvim-tree/nvim-web-devicons",
            opts = {}
        },
        -- Manipulation of parenthesis
        { "tpope/vim-surround", config = function() end },
        -- Commenting code
        { "tpope/vim-commentary", config = function() end },
        -- Autoclosing of (, {, [, etc
        { "m4xshen/autoclose.nvim", opts = {} },
    },
})
