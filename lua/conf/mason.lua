-- Mason setup
require("mason").setup()

-- Mason-LSPConfig setup (new shit)
require("mason-lspconfig").setup({
    ensure_installed = { "clangd" }, -- make sure clangd is installed
    automatic_installation = true,
    automatic_enable = true,
})

-- Keymaps & attach logic
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

-- Default setup options
local default_opts = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

-- Final LSP setup per server
local lspconfig = require("lspconfig")
for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {}, default_opts))
end
