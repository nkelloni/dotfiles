return {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
        { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (project)' },
        { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Diagnostics (buffer)' },
        { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols' },
    },
}
