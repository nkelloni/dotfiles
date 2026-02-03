return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        delay = 750,  -- milliseconds
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Show keymaps',
        },
    },
}
