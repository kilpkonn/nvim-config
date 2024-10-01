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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

mason.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
    }
  end,
  -- Next, you can provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        cmd = { '/home/tavo/git/rust-analyzer/target/release/rust-analyzer' },
        settings = {
          ['rust-analyzer'] = {
            completion = {
              termSearch = {
                enable = true;
                fuel = 3000;
              }
            },
            assist = {
              termSearch = { fuel = 3000, borrowcheck = false, }
            }
          }
        },
        on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(true)
        end
      }
  end,
  ["ltex"] = function ()
    lspconfig.ltex.setup {
      filetypes = { "tex" },
      capabilities = capabilities,
      on_attach = function(client, bufnr)
          -- rest of your on_attach process.
          require("ltex_extra").setup {  }
      end,
    }
  end,
}

lspconfig.textlsp.setup {
  filetypes = { "tex", "text", "markdown", "typst" },
  capabilities = capabilities,
  settings = {
    textLSP = {
      analysers = {
          languagetool = {
              enabled = false,
              check_text = { on_open = true, on_save = true, on_change = false, }
          },
          hf_checker = {
              enabled = true,
              gpu = true,
              quantize=32,
              model='pszemraj/flan-t5-large-grammar-synthesis',
              min_length=40,
              check_text = { on_open = true, on_save = true, on_change = true, }
          },
      },
    }
  }
}

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define("DiagnosticSign" .. name,
    { text = icon, numhl = "Diagnostic" .. name, texthl = "Diagnostic" .. name })
end

lspSymbol("Error", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    prefix = "",
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

