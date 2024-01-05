--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
-- vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.wo.wrap = true
vim.wo.linebreak = true
-- general
lvim.transparent_window = true
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  -- pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[";"] = "<ESC>"
lvim.keys.visual_mode[";"] = "<ESC>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["<C-q>"] = "<ESC>"
lvim.keys.insert_mode["<C-h>"] = "<left>"
lvim.keys.insert_mode["<C-l>"] = "<right>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>lua require('dlvhdr/telescope').lsp_references()<cr>", "References" }
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "vscode"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.dap.active = true
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.telescope.extensions["recent_files"] = {
  only_cwd = true
}
-- Telescope custom Mapping
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "References" }
lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = "move_selection_next"
lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = "move_selection_previous"
lvim.builtin.which_key.mappings["r"] = {
  function()
    require('telescope').extensions.recent_files.pick()
  end,
  "Recent Files"
}
lvim.builtin.which_key.mappings["x"] = { "<cmd>quit<cr>", "Quit" }
lvim.builtin.which_key.mappings["q"] = {}
lvim.builtin.which_key.mappings["o"] = { "<cmd>RnvimrToggle<cr>", "Ranger" }
lvim.builtin.which_key.mappings["-"] = { "<cmd>split<cr>", "Split Horizontal" }
lvim.builtin.which_key.mappings["\\"] = { "<cmd>vsplit<cr>", "Split Vertical" }
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "jedi_language_server"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua" },
  {
    command = "prettier",
    extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
}
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup()
      vim.api.nvim_set_keymap("n", "<leader>t", ":TroubleToggle<CR>", {})
    end,
  },
  -- { "LunarVim/darkplus.nvim" },
  {
    "phaazon/hop.nvim",
    name = "Hop",
    -- -- keys = { "s", "S" },
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      vim.api.nvim_set_keymap("n", "<leader>j", ":HopWord<cr>", {})
      -- vim.api.nvim_set_keymap("n", "S", ":HopPattern<cr>", {})
    end,
  },
  { "Mofiqul/vscode.nvim" },
  {
    "smartpde/telescope-recent-files",
    config = function()
      require("telescope").load_extension("recent_files")
    end,
  },
  {
    -- "karb94/neoscroll.nvim",
    -- config = function()
    --   require('neoscroll').setup()
    -- end
    'declancm/cinnamon.nvim',
    config = function()
      require('cinnamon').setup({
        -- extra_keymaps = true,
        -- extended_keymaps = true,
      })
    end
  },
  {
    'christoomey/vim-tmux-navigator'
  },
  {
    'windwp/nvim-ts-autotag'
  },
  {
    'kevinhwang91/rnvimr'
  }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
