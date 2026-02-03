return {
    'github/copilot.vim',
    lazy = false,
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set('i', '<Tab>', 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false,
            desc = 'Accept Copilot suggestion',
        })

        -- Cycle through suggestions (Alt + ] / [)
        vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
        vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })
    end,
}
