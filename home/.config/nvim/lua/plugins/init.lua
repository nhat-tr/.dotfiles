local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

local my = function(file)
    require(file)
end

require("packer").init({display = {auto_clean = false}})

au("BufWritePost", "**/nvim/lua/plugins/*.lua", "lua reload()")
au("BufWritePost", "**/nvim/lua/plugins/*.lua", "PackerCompile")

local packer = {
    -- Packer can manage itself as an optional plugin
    "wbthomason/packer.nvim",
    opt = true
}

local textObjects = {
    "kana/vim-textobj-user",
    "glts/vim-textobj-comment",
    "kana/vim-textobj-indent",
    "wellle/targets.vim",
    {"chaoren/vim-wordmotion", config = require("plugins.vim-wordmotion")}
}

local core = {
    -- abbreviations, substitusion, coercion (transform case)
    "tpope/vim-abolish",
    -- add bunch of mappings like ]p ]e ]<space> etc.
    "tpope/vim-unimpaired",
    -- allows repeat via dot for some plugins like surround
    "tpope/vim-repeat",
    -- add\update\remove surround stuff like ''{}''
    -- "tpope/vim-surround",
    "machakann/vim-sandwich",
    --  shiftwidth/expandtab/etc
    "tpope/vim-sleuth",
    -- close all buffers but current
    {"schickling/vim-bufonly", config = require("plugins.vim-bufonly")},
    -- close buffer
    {"moll/vim-bbye", config = require("plugins.vim-bbye")},
    -- move to {motion}
    {"svermeulen/vim-subversive", config = require("plugins.vim-subversive")},
    -- gj gs
    {"AndrewRadev/splitjoin.vim", config = require("plugins.splitjoin")},
    "iamcco/markdown-preview.nvim"
}

local git = {
    {"tpope/vim-fugitive", config = require("plugins.vim-fugitive")},
    {"f-person/git-blame.nvim", config = require("plugins.git-blame"), requires = {"alex-popov-tech/timer.nvim"}}
}

local session = {
    -- start screen
    {"mhinz/vim-startify", config = require("plugins.vim-startify")},
    -- when navigate to previously opened files - open in last file position
    "farmergreg/vim-lastplace"
}

local tmuxAndSplits = {
    -- plugin for vim-tmux interactions
    {"numToStr/Navigator.nvim", config = require("plugins.navigator-nvim")},
    -- resizing windows
    {"talek/obvious-resize", config = require("plugins.obvious-resize")},
    -- syntax high, K docs, something else...
    "tmux-plugins/vim-tmux"
}

local term = {
    -- open terminal in floating window
    "voldikss/vim-floaterm",
    config = require("plugins.vim-floaterm")
}

local filetree = {
    -- file tree
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = require("plugins.nvim-tree")
}

local fuzzyFinder = {
    "nvim-telescope/telescope.nvim",
    requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim"},
    config = require("plugins.telescope-nvim")
}

local coding = {
    -- add commenting for different langs
    {"tpope/vim-commentary", config = require("plugins.vim-commentary")},
    -- plugin which allows vim to work with common editorconfig
    "editorconfig/editorconfig-vim",
    -- database viewer
    {
        "kristijanhusak/vim-dadbod-ui",
        config = require("plugins.vim-dadbod"),
        requires = {"tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion"}
    },
    {"tpope/vim-dotenv", config = require("plugins.vim-dotenv")}
}

local ui = {
    -- top buff line
    {"akinsho/nvim-bufferline.lua", config = require("plugins.nvim-bufferline")},
    -- statusline
    {
        "glepnir/galaxyline.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = require("plugins.galaxyline-nvim")
    },
    -- color scheme
    -- "christianchiarulli/nvcode-color-schemes.vim",
    -- "bluz71/vim-nightfly-guicolors",
    {"sainnhe/sonokai", config = require("plugins.sonokai")},
    -- "glepnir/zephyr-nvim",
    -- "sainnhe/edge",
    -- "mhartington/oceanic-next",
    -- "rktjmp/lush.nvim",
    -- "npxbr/gruvbox.nvim",
    -- "edkolev/tmuxline.vim", -- generate tmux statusline from vim statusline
    {
        "rrethy/vim-hexokinase",
        run = "make hexokinase",
        config = function()
            vim.g.Hexokinase_highlighters = {"foregroundfull"}
        end
    } -- highlight hex colors in buffer
}

local treesitter = {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate all",
    config = require("plugins.nvim-treesitter")
}

local lsp = {
    -- lsp configs placed here
    "neovim/nvim-lspconfig",
    {"kabouzeid/nvim-lspinstall", config = require("plugins.nvim-lspinstall")},
    -- just a bit better ts support
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    -- pretty hover and references/implementations/codeaction
    {"glepnir/lspsaga.nvim", config = require("plugins.lspsaga-nvim")},
    -- pretty references/codeaction
    {"RishabhRD/nvim-lsputils", requires = {"RishabhRD/popfix"}, config = require("plugins.nvim-lsputils")},
    -- plugin to add completeion possibility
    {
        "hrsh7th/nvim-compe",
        config = require("plugins.nvim-compe"),
        requires = {"kristijanhusak/vim-dadbod-completion"}
    },
    -- snippeds
    {"hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ", config = require("plugins.vim-vsnip")}
}

local development = {
    "OmniSharp/omnisharp-vim"
}

local other = {
    "dstein64/vim-startuptime",
    cmd = {"StartupTime"}
}

return require "packer".startup {
    function(use)
        use(packer)
        use(textObjects)
        use(core)
        use(git)
        use(session)
        use(tmuxAndSplits)
        use(term)
        use(filetree)
        use(fuzzyFinder)
        use(coding)
        use(ui)
        use(treesitter)
        use(lsp)
        use(development)
        use(other)
    end,
    config = {
        display = {
            open_fn = require "packer.util".float
        }
    }
}
