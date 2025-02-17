return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'echasnovski/mini.nvim',
        -- 'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lualine').setup {
            options = {
                -- theme = 'gruvbox-material',
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
            }
        }
    end,
}
