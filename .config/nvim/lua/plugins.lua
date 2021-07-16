-- Do not use plugins when running as root or neovim < 0.5
if require'utils'.is_root() or not require'utils'.has_neovim_v05() then
    return { sync_if_not_compiled = function() return end }
  end
  
  local execute = vim.api.nvim_command
  
  -- check if packer is installed (~/.local/share/nvim/site/pack)
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  local compile_path = install_path .. "/plugin/packer_compiled.vim"
  local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0
  local is_compiled = vim.fn.empty(vim.fn.glob(compile_path)) == 0
  
  if not is_installed then
      if vim.fn.input("Install packer.nvim? (y for yes) ") == "y" then
          execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
          execute("packadd packer.nvim")
          print("Installed packer.nvim.")
          is_installed = 1
      end
  end
  
  -- Packer commands
  vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
  vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
  vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
  vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
  vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
  vim.cmd [[command! PC PackerCompile]]
  vim.cmd [[command! PS PackerStatus]]
  vim.cmd [[command! PU PackerSync]]
  
  local packer = nil
  local function init()
      if not is_installed then return end
      if packer == nil then
          packer = require('packer')
          packer.init({
              -- we don't want the compilation file in '~/.config/nvim'
              compile_path = compile_path
          })
      end
  
      local use = packer.use
  
      -- Packer can manage itself as an optional plugin
      use { 'wbthomason/packer.nvim' }
  
      -- tpope's plugins that should be part of vim
      use { 'tpope/vim-surround' }
      use { 'tpope/vim-repeat' }
  
      -- "gc" to comment visual regions/lines
      -- use { 'tpope/vim-commentary' }
      use { 'b3nj5m1n/kommentary',
          -- uncomment for lazy loading
          keys = {'gcc', 'gc'}
      }

      -- fancy startup screen
      use { 'mhinz/vim-startify' }
  
      -- needs no introduction
      use { 'tpope/vim-fugitive',
          config = "require('plugin.fugitive')" }
  
   
      -- Add git related info in the signs columns and popups
      -- TODO: causes splash screen to flash
      use { 'lewis6991/gitsigns.nvim',
          requires = { 'nvim-lua/plenary.nvim' },
          config = "require('plugin.gitsigns')" }
  
      -- Add indentation guides even on blank lines
      use { 'lukas-reineke/indent-blankline.nvim', branch="lua",
          config = "require('plugin.indent-blankline')",
          opt = true, cmd = { 'IndentBlanklineToggle' } }
  
      -- ':source' & ':luafile' don't reload `require()` properly
      -- Use ':Reload' & ':Restart' instead, alternatively:
      -- ':lua require("nvim-reload").Reload()'
      use { 'famiu/nvim-reload',
          requires = { 'nvim-lua/plenary.nvim' },
          config = "require('plugin.nvim-reload')" }
  
      -- Neoterm (REPLs)
    --   use { 'kassio/neoterm',
    --       config = "require('plugin.neoterm')" }
  
      -- yank over ssh with ':OCSYank' or ':OSCYankReg +'
    --   use { 'ojroques/vim-oscyank',
    --       config = function()
    --           vim.g.oscyank_term = 'tmux'
    --       end
    --   }
  
   
      -- Autocompletion
      use { 'hrsh7th/nvim-compe',
          config = "require('plugin.completion')" }
  
      -- nvim-treesitter
      -- verify a compiler exists before installing
      if require'utils'.have_compiler() then
          use { 'nvim-treesitter/nvim-treesitter',
              config = "require('plugin.treesitter')",
              run = ':TSUpdate' }
        --   use { 'nvim-treesitter/nvim-treesitter-textobjects',
        --       after = { 'nvim-treesitter' } }
          -- debuging treesitter
        --   use { 'nvim-treesitter/playground',
        --       after = { 'nvim-treesitter' },
        --       cmd = { 'TSPlaygroundToggle' },
        --       opt = true }
      end
  
      -- nvim-tree
      use { 'kyazdani42/nvim-tree.lua',
          requires = { 'kyazdani42/nvim-web-devicons' },
          config = "require('plugin.nvim-tree')" }
  
      -- Telescope
      use { 'nvim-telescope/telescope.nvim',
          requires = {
              {'nvim-lua/popup.nvim'},
              {'nvim-lua/plenary.nvim'},
            --   {'nvim-telescope/telescope-fzy-native.nvim'},
          },
          config = "require('plugin.telescope')" }
  
     -- better quickfix
     use { 'kevinhwang91/nvim-bqf',
          config = "require'plugin.bqf'",
          ft = { 'qf' } }
  
      -- LSP
      use { 'neovim/nvim-lspconfig',
          'ray-x/lsp_signature.nvim',
          'kabouzeid/nvim-lspinstall' }
  
      --[[ use { 'glepnir/lspsaga.nvim',
          config = function()
            require'lspsaga'.init_lsp_saga({
              rename_prompt_prefix = 'New name ➤',
            })
          end } ]]
  
  
      -- markdown preview using `glow`
      -- use { 'npxbr/glow.nvim', run = ':GlowInstall'}
    --   use { 'previm/previm',
    --       config = function()
    --           vim.g.previm_open_cmd = 'firefox'
    --           vim.g.previm_enable_realtime = 0
    --       end,
    --       opt = true, cmd = { 'PrevimOpen' } }
  
      -- key bindings cheatsheet
      use { 'folke/which-key.nvim',
          config = "require('plugin.which_key')" }
  
      -- fancy statusline
      use { 'famiu/feline.nvim', config = "require'plugin.feline'" }
  
      -- Color scheme, requires nvim-treesitter
      use {"christianchiarulli/nvcode-color-schemes.vim",
          setup = function() vim.g.nvcode_termcolors = 256 end,
          opt = true }
  
      -- Colorizer
      use { 'norcalli/nvim-colorizer.lua',
          config = function() require'colorizer'.setup() end,
          cmd = {'ColorizerAttachToBuffer', 'ColorizerDetachFromBuffer' },
          opt = true }
      
  end

  
  -- called from 'lua/autocmd.lua' at `VimEnter`
  local function sync_if_not_compiled()
      if packer == nil then return end
      if not is_compiled then
          packer.sync()
          --execute("luafile $MYVIMRC")
      end
  end
  
  local plugins = setmetatable({}, {
      __index = function(_, key)
          init()
          -- workaround for error when packer not installed
          if packer == nil then return function() end end
          if key == "sync_if_not_compiled" then
              return sync_if_not_compiled
          else
              return packer[key]
          end
      end
  })
  
  return plugins
  
