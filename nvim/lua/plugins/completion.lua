return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',     -- LSP completions
        'hrsh7th/cmp-buffer',        -- Buffer words
        'hrsh7th/cmp-path',          -- File paths
        'L3MON4D3/LuaSnip',          -- Snippet engine
        'saadparwaiz1/cmp_luasnip',  -- Snippet completions
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),        -- Scroll docs up
                ['<C-f>'] = cmp.mapping.scroll_docs(4),         -- Scroll docs down
                ['<C-Space>'] = cmp.mapping.complete(),         -- Trigger completion
                ['<C-e>'] = cmp.mapping.abort(),                -- Close menu
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                ['<C-n>'] = cmp.mapping(function(fallback)      -- Ctrl+n to next item
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<C-p>'] = cmp.mapping(function(fallback)      -- Ctrl+p to prev item
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },  -- LSP completions (highest priority)
                { name = 'luasnip' },   -- Snippets
            }, {
                { name = 'buffer' },    -- Words from current buffer
                { name = 'path' },      -- File paths
            }),
        })
    end,
}
