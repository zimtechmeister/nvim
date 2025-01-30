return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'echasnovski/mini.icons',
        -- 'nvim-tree/nvim-web-devicons',
    },
    config = function()
        -- open multiple selected files
        local open_selected = function(prompt_bufnr)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local selected = picker:get_multi_selection()
            if vim.tbl_isempty(selected) then
                require("telescope.actions").select_default(prompt_bufnr)
            else
                require("telescope.actions").close(prompt_bufnr)
                for _, file in pairs(selected) do
                    if file.path then vim.cmd("edit" .. (file.lnum and " +" .. file.lnum or "") .. " " .. file.path) end
                end
            end
        end
        require('telescope').setup {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key",
                        ["<CR>"] = open_selected,
                    },
                    n = {
                        q = require("telescope.actions").close,
                        ["<CR>"] = open_selected,
                    },
                },
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>t', function() end, { desc = 'Telescope' })
        vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>tk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ts', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>tw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>tr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>t.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    end,
}
