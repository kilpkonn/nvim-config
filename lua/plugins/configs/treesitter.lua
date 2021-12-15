local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

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
    }
}
