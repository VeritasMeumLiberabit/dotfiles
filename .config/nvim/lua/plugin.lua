--------------------------------------------------------------------------------
--
--                       _             _         _
--                      | |           (_)       | |
--                 _ __ | |_   _  __ _ _ _ __   | |_   _  __ _
--                | '_ \| | | | |/ _` | | '_ \  | | | | |/ _` |
--                | |_) | | |_| | (_| | | | | |_| | |_| | (_| |
--                | .__/|_|\__,_|\__, |_|_| |_(_)_|\__,_|\__,_|
--                | |             __/ |
--                |_|            |___/
--
-- Jonathan Lowe
-- github : https://github.com/jglowe
-- figlet font : big
--
-- plugins for neovim
--------------------------------------------------------------------------------
vim.pack.add({
    {
        src = "https://github.com/wincent/base16-nvim.git",
        version = "ebee297b217eb1ae6e4fe81e39f195cf6d7d5c5c"
    }, {
        src = "https://github.com/nvim-lualine/lualine.nvim.git",
        version = "221ce6b2d999187044529f49da6554a92f740a96"
    }, {
        src = "https://github.com/edkolev/tmuxline.vim.git",
        version = "4119c553923212cc67f4e135e6f946dc3ec0a4d6"
    }, {
        src = "https://github.com/lewis6991/gitsigns.nvim.git",
        version = "dd3f588bacbeb041be6facf1742e42097f62165d"
    }, {
        src = "https://github.com/alexghergh/nvim-tmux-navigation.git",
        version = "4898c98702954439233fdaf764c39636681e2861"
    }, {
        src = "https://github.com/nvim-telescope/telescope.nvim.git",
        version = "7d324792b7943e4aa16ad007212e6acc6f9fe335"
    }, {
        src = "https://github.com/nvim-lua/plenary.nvim.git",
        version = "74b06c6c75e4eeb3108ec01852001636d85a932b"
    }, {
        src = "https://github.com/stevearc/conform.nvim.git",
        version = "619363c30309d29ffa631e67c8183f2a72caa373"
    }, {
        src = "https://github.com/hrsh7th/nvim-cmp.git",
        version = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca"
    }, {
        src = "https://github.com/hrsh7th/cmp-nvim-lsp.git",
        version = "cbc7b02bb99fae35cb42f514762b89b5126651ef"
    }, {
        src = "https://github.com/hrsh7th/cmp-buffer.git",
        version = "b74fab3656eea9de20a9b8116afa3cfc4ec09657"
    }, {
        src = "https://github.com/hrsh7th/cmp-path.git",
        version = "c642487086dbd9a93160e1679a1327be111cbc25"
    }, {
        src = "https://github.com/hrsh7th/cmp-nvim-lua.git",
        version = "e3a22cb071eb9d6508a156306b102c45cd2d573d"
    }, {
        src = "https://github.com/onsails/lspkind.nvim.git",
        version = "c7274c48137396526b59d86232eabcdc7fed8a32"
    }, {
        src = "https://github.com/neovim/nvim-lspconfig.git",
        version = "07dff35e7c95288861200b788ef32d6103f107f0"
    }, {
        src = "https://github.com/folke/trouble.nvim.git",
        version = "bd67efe408d4816e25e8491cc5ad4088e708a69a"
    }
})

--------------------------------------------------------------------------------
-- Appearence
--------------------------------------------------------------------------------
--
-- Loads the color scheme
vim.cmd.colorscheme("eighties")

-- Shows cool status bar
vim.opt.laststatus = 2
vim.opt.showmode = false

-- Adds a status line below
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {left = '|', right = '|'},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'require"lsp-status".status()'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

--------------------------------------------------------------------------------
-- tmuxline settings
--
-- Something that spits out tmux config to make it match vim theming
--------------------------------------------------------------------------------

-- Generate current theme by :Tmuxline lightline_insert
vim.g.tmuxline_powerline_separators = 0
vim.g.tmuxline_preset = {
    ["a"] = "#S",
    ["b"] = "#W",
    ["c"] = {"#(whoami)", "#H"},
    ["win"] = "#I #W",
    ["cwin"] = "#I #W",
    ["x"] = "%a",
    ["y"] = "#W %R",
    ["z"] = "#H"
}

--------------------------------------------------------------------------------
-- gitsigns.nvim settings
--
-- Shows lines modified with git
--------------------------------------------------------------------------------

require("gitsigns").setup({
    signs = {
        add = {text = "+"},
        change = {text = "~"},
        delete = {text = "-"},
        topdelete = {text = "-"},
        changedelete = {text = "~"}
    }
})

--------------------------------------------------------------------------------
-- nvim-tree settings
--
-- File explorer in vim
--------------------------------------------------------------------------------

-- yapm.load("nvim-web-devicons")
-- yapm.load("nvim-tree.lua")
--
-- require("nvim-tree").setup({})
-- vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", {})

--------------------------------------------------------------------------------
-- alpha-nvim settings
--
-- A greater for neovim
--------------------------------------------------------------------------------

-- requires nvim-web-devicons included above
-- require("alpha").setup(require("alpha.themes.startify").opts)

--------------------------------------------------------------------------------
-- nvim-tmux-navigator settings
--
-- Navigating tmux and vim panes with shortcuts
--------------------------------------------------------------------------------

local nvim_tmux_nav = require('nvim-tmux-navigation')

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft,
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown,
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp,
               {noremap = true, silent = true})
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight,
               {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- telescope.nvim settings
--
-- File navigation
--------------------------------------------------------------------------------

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>ff", builtin.find_files, {noremap = true})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {noremap = true})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {noremap = true})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {noremap = true})

--------------------------------------------------------------------------------
-- vim-smooth-scroll settings
--------------------------------------------------------------------------------

-- yapm.load("vim-smooth-scroll")
-- vim.api.nvim_set_keymap("n", "<c-u>",
--                         ":call smooth_scroll#up(&scroll, 10, 2)<CR>",
--                         {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<c-d>",
--                         ":call smooth_scroll#down(&scroll, 10, 2)<CR>",
--                         {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<c-b>",
--                         ":call smooth_scroll#up(&scroll*2, 20, 4)<CR>",
--                         {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<c-f>",
--                         ":call smooth_scroll#down(&scroll*2, 20, 4)<CR>",
--                         {noremap = true, silent = true})

-- --------------------------------------------------------------------------------
-- -- CurtineIncSw cpp-h file navigator settings
-- --------------------------------------------------------------------------------
--
-- yapm.load("CurtineIncSw.vim")
--
-- vim.keymap.set("", "<F5>", ":call CurtineIncSw()<CR>", {noremap = true})

--------------------------------------------------------------------------------
-- Languages
--
-- Support for various languages
--------------------------------------------------------------------------------

-- yapm.load("saltstack/salt-vim")
-- yapm.load("rust-lang/rust.vim")
-- yapm.load("vim-crystal/vim-crystal")
-- yapm.load("rgrinberg/vim-ocaml")
-- yapm.load("pearofducks/ansible-vim")
-- yapm.load("hashivim/vim-terraform")
-- yapm.load("martinda/Jenkinsfile-vim-syntax")
-- yapm.load("lervag/vimtex")
-- -- yapm.load("ron-rs/ron.vim")
--
-- vim.g.ocaml_folding = 1
--
-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--     pattern = {"*/playbooks/*"},
--     command = "set filetype=yaml.ansible"
-- })
--
--------------------------------------------------------------------------------
-- Comment.nvim settings
--
-- code for commenting out stuff
--------------------------------------------------------------------------------

-- yapm.load("numToStr/Comment.nvim")
--
-- require('Comment').setup({
--     ---Add a space b/w comment and the line
--     ---@type boolean
--     padding = true,
--
--     ---Whether the cursor should stay at its position
--     ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
--     ---@type boolean
--     sticky = true,
--
--     ---Lines to be ignored while comment/uncomment.
--     ---Could be a regex string or a function that returns a regex string.
--     ---Example: Use '^$' to ignore empty lines
--     ---@type string|fun():string
--     ignore = nil,
--
--     ---LHS of toggle mappings in NORMAL + VISUAL mode
--     ---@type table
--     toggler = {
--         ---Line-comment toggle keymap
--         line = 'gcc',
--         ---Block-comment toggle keymap
--         block = 'gbc'
--     },
--
--     ---LHS of operator-pending mappings in NORMAL + VISUAL mode
--     ---@type table
--     opleader = {
--         ---Line-comment keymap
--         line = 'gc',
--         ---Block-comment keymap
--         block = 'gb'
--     },
--
--     ---LHS of extra mappings
--     ---@type table
--     extra = {
--         ---Add comment on the line above
--         above = 'gcO',
--         ---Add comment on the line below
--         below = 'gco',
--         ---Add comment at the end of line
--         eol = 'gcA'
--     },
--
--     ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
--     ---@type table
--     mappings = {
--         ---Operator-pending mapping
--         ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
--         ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
--         basic = true,
--         ---Extra mapping
--         ---Includes `gco`, `gcO`, `gcA`
--         extra = true,
--         ---Extended mapping
--         ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
--         extended = false
--     },
-- })
--
--------------------------------------------------------------------------------
-- neoformat settings
--
-- Autoformats code with autoformatters
--------------------------------------------------------------------------------

require("conform").setup({
    formatters_by_ft = {
        lua = {"lua-format"},
        python = {"ruff"},
        rust = {"rustfmt", lsp_format = "fallback"},
        javascript = {"prettierd", "prettier", stop_after_first = true}
    }
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1,
                                                    args.line2, true)[1]
        range = {
            start = {args.line1, 0},
            ["end"] = {args.line2, end_line:len()}
        }
    end
    require("conform").format({
        async = true,
        lsp_format = "fallback",
        range = range
    })
end, {range = true})

vim.keymap.set("", "<leader>k",
               function() require("conform").format({async = true}) end,
               {noremap = true, silent = true})

--------------------------------------------------------------------------------
-- Autocompletion settings
--------------------------------------------------------------------------------

-- sets the wildmenu for tab completion
vim.opt.wildmenu = true

-- Removes searching through all the included files from CTRL-N completion
-- which can signifintly slow down autocompletion`
vim.opt.complete = vim.opt.complete - "i"

-- Sets autocomplete tab to only complete common characters for the first tab.
-- By default it autocompletes to the first item in the list, which you can tab
-- through.
vim.opt.completeopt = "menu,menuone,preview"

local cmp = require('cmp')
local lspkind = require("lspkind")
lspkind.init()

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    window = {},
    mapping = {
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({
        {name = "nvim_lua"}, {name = 'nvim_lsp'}, {name = "luasnip"},
        {name = 'path'}, {name = 'buffer'}
    }),
    formatting = {
        -- Youtube: How to set up nice formatting for your sources.
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                nvim_lua = "[api]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                buffer = "[buf]",
                luasnip = "[snip]"
            }
        }
    }
})

--------------------------------------------------------------------------------
-- LSP Settings
--------------------------------------------------------------------------------

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = {buffer = ev.buf}
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
                       opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f',
                       function() vim.lsp.buf.format {async = true} end, opts)
    end
})

if vim.fn.executable("lua-language-server") == 1 then vim.lsp.enable('lua_ls') end

-- if vim.fn.executable("clangd") == 1 then
--     vim.lsp.config().clangd.setup(standard_lsp_options)
-- end

if vim.fn.executable("crystalline") == 1 then vim.lsp.enable('crystalline') end

if vim.fn.executable("ocamllsp") == 1 then vim.lsp.enable('ocamllsp') end

if vim.fn.executable("rust-analyzer") == 1 then vim.lsp.enable('rust_analyzer') end

-- if vim.fn.executable("pyright") == 1 then
--     vim.lsp.config().pyright.setup(standard_lsp_options)
-- end

-- if vim.fn.executable("bash-language-server") == 1 then
--     vim.lsp.config().bashls.setup(standard_lsp_options)
-- end

-- if vim.fn.executable("jedi-language-server") == 1 then
--     vim.lsp.config().jedi_language_server.setup(standard_lsp_options)
-- end

if vim.fn.executable("ansible-language-server") == 1 then
    vim.lsp.enable('ansiblels')
end

if vim.fn.executable("yaml-language-server") == 1 then vim.lsp.enable('yamlls') end

if vim.fn.executable("fsautocomplete") == 1 then vim.lsp
    .enable('fsautocomplete') end

if vim.fn.executable("terraform-ls") == 1 then vim.lsp.enable('terraformls') end

--------------------------------------------------------------------------------
-- neovim trouble settings
--
-- Trouble is a trouble/issues menu for lsp
--------------------------------------------------------------------------------

require("trouble").setup({})
