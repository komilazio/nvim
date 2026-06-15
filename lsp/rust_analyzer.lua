return {
    cmd = { "rust-analyzer" },
    root_markers = { "Cargo.toml", ".git", "*.rs" },
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                parameterHints = { enable = true },
                typeHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
            },
        },
    },
}
