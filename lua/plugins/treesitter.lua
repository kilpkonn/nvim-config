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

-- incremental_selection = {
--     enable = true,
--     keymaps = {
--         init_selection = "gnn",
--         node_incremental = "grn",
--         scope_incremental = "grc",
--         node_decremental = "grm",
--     },
-- },
