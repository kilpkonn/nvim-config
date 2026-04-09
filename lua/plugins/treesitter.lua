vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

require("nvim-treesitter").install {
        "css",
        "html",
        "bash",
        "lua",
        "json",
        "python",
        "rust",
        "cpp",
        "c",
        "toml",
        "haskell",
        "svelte",
        "typescript"
        -- "go"
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)

    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo[0][0].foldmethod = 'expr'

    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
