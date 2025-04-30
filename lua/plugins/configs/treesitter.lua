local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.matlab = {
    install_info = {
        url = "https://github.com/mstanciu552/tree-sitter-matlab.git",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "matlab",
}

ts_config.setup {
    ensure_installed = {
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
        "haskell"
        -- "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    matchup = {
        enable = true,
  },
}
