-- Add servers here (one place only)
local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { 'vim' } },
            },
        },
    },
    pyright = {},
    ruff = {},
    rust_analyzer = {},
    yamlls = {},
}

return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = vim.tbl_keys(servers),
            })
        end,
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local opts = { buffer = args.buf }

                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                    vim.keymap.set('n', '<leader>e', function()
                        vim.diagnostic.open_float({ focus = false })
                    end, opts)
                end,
            })

            -- Setup all servers using the new vim.lsp.config API (nvim 0.11+)
            for server, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server, config)
            end
            vim.lsp.enable(vim.tbl_keys(servers))
        end,
    },
}
