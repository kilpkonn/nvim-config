local present1, lspconfig = pcall(require, "lspconfig")
local present2, mason = pcall(require, "mason-lspconfig")

if not (present1 or present2) then
  print("Lspconfig or mason-lspconfig not loaded!")
  return
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.lsp.inlay_hint.enable(true)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('v', '<space>f', function()
      vim.lsp.buf.range_formatting { async = true }
    end, opts)
  end,
})

vim.lsp.config('rust_analyzer', {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
      completion = {
        termSearch = {
          enable = true,
          fuel = 3000,
        }
      },
      assist = {
        termSearch = { fuel = 3000, borrowcheck = false, }
      }
  },
})

vim.lsp.config('kotlin_language_server', {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
    formatting = {
      ktfmt = {
        maxWidth = 140,
      }
    }
  },
})

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
        --     [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
        --     [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
        --     [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
        -- },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
        },
    },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    -- prefix = "",
    spacing = 0,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})
