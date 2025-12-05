-- Mason setup
require("mason").setup()

-- Mason-LSPConfig setup
require("mason-lspconfig").setup({
    ensure_installed = { "clangd", "omnisharp_mono" }, -- add other servers if you want
    automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- on_attach: keymaps for LSP features
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
end

-- Default options for servers
local default_opts = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
}

local omnisharp_path = vim.fn.stdpath("data") .. "/mason/packages/omnisharp-mono/omnisharp-mono"

lspconfig.omnisharp.setup{
    cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()), "--stdio" },
    useModernNet = true,  -- critical: tells OmniSharp to use dotnet SDK
    filetypes = { "cs", "csharp" },
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
    on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        local keymap = vim.api.nvim_buf_set_keymap
        keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    end,
    flags = { debounce_text_changes = 150 },
}
