return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ async = true })
            end,
            desc = 'Format buffer',
        },
    },
    opts = {
        formatters_by_ft = {
            python = { 'ruff_format' },
            rust = { 'rustfmt' },
            lua = { 'stylua' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            json = { 'prettier' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = 'fallback',
        },
    },
}
