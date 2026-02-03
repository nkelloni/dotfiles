return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            view = {
                width = 30,
                number = true,
                relativenumber = true,
            },
            renderer = { group_empty = true },
            filters = { dotfiles = false },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        })

        vim.keymap.set('n', '<leader>cd', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
        vim.keymap.set('n', '<leader>cr', '<cmd>NvimTreeFindFile<cr>', { desc = 'Reveal file in tree' })
    end,
}
