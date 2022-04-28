local present, cmp = pcall(require, "cmp")

if not present then
   return
end

vim.opt.completeopt = "menu,menuone,noselect"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- nvim-cmp setup
cmp.setup {
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
      format = function(entry, vim_item)
         -- load lspkind icons
         vim_item.kind = string.format(
            "%s %s",
            require("plugins.configs.lspkind_icons").icons[vim_item.kind],
            vim_item.kind
         )

         vim_item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[BUF]",
            path = "[PTH]",
            luasnip = "[SNP]",
            calc = "[CLC]",
            cmp_matlab = "[MAT]",
         })[entry.source.name]

         return vim_item
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        elseif has_words_before() then
          cmp.confirm()
        else
            fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").expand_or_jump()
        elseif has_words_before() then
          cmp.confirm()
        else
            fallback()
        end
      end, { "i", "s" }),
   },
   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = 'calc' },
      { name = "buffer" },
      { name = "path" },
      { name = "cmp_matlab" },
   })
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
