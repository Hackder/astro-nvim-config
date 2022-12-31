--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure plugins
  plugins = {
    init = {
      ["github/copilot.vim"] = {},
      ["iamcco/markdown-preview.nvim"] = {
        run = "cd app && yarn install",
        ft = { "markdown" },
        setup = function()
          vim.g.mkdp_filetypes = { "markdown" }
        end,
      },
      ['rose-pine/neovim'] = {
        as = 'rose-pine'
      }
    },
    telescope = {
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
    },
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      -- config.sources = {
      --   -- Set a formatter
      --   null_ls.builtins.formatting.prettier,
      -- }
      -- -- set up null-ls's on_attach function
      -- NOTE: You can remove this on attach function to disable format on save
      -- config.on_attach = function(client)
      --     if client.resolved_capabilities.document_formatting then
      --         vim.api.nvim_create_autocmd("BufWritePre", {
      --             desc = "Auto format before save",
      --             pattern = "<buffer>",
      --             callback = vim.lsp.buf.formatting_sync,
      --         })
      --     end
      -- end
      return config -- return final config table to use in require("null-ls").setup(config)
    end,
    ["neo-tree"] = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },

  lsp = {
    formatting = {
      format_on_save = false,
    },
  },


  mappings = {
    n = {
      ["<leader>lk"] = { vim.lsp.buf.hover, desc = "Hover Documentation" },
      ["<F7>"] = false,
      ["<F11>"] = { "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<cr>" },
      ["<leader>fg"] = { "<cmd>Telescope git_files<cr>", desc = "Search git files" }
    },
  },

  polish = function()
    vim.g.copilot_node_command = "~/.nvm/versions/node/v16*/bin/node"
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
    vim.api.nvim_set_keymap("i", "<C-J>", "copilot#Accept()", { silent = true, expr = true })
    vim.cmd("colorscheme rose-pine")
  end,
}


return config
