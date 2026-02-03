return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local langs = { 'lua', 'python', 'rust', 'yaml' }

        require('nvim-treesitter').install(langs)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = langs,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
