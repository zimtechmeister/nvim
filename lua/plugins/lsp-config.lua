return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            require("lspconfig").lua_ls.setup { capabilities = capabilities }
            require("lspconfig").jdtls.setup { capabilities = capabilities }
            require("lspconfig").clangd.setup { capabilities = capabilities }
            require("lspconfig").eslint.setup { capabilities = capabilities }
            require("lspconfig").ts_ls.setup { capabilities = capabilities }
            require("lspconfig").nixd.setup({
                capabilities = capabilities,
                cmd = { "nixd" },
                settings = {
                    nixd = {
                        formatting = {
                            command = { "alejandra" }, -- or nixfmt
                        },
                        -- nixpkgs = {
                        --     expr = "import <nixpkgs> { }",
                        -- },
                        -- options = {
                        --     nixos = {
                        --         -- "github:zimtech/nixos" or "/home/tim/nixos/"
                        --         expr = '(builtins.getFlake "/home/tim/nixos").nixosConfigurations.default.options',
                        --     },
                        --     home_manager = {
                        --         expr = '(builtins.getFlake "/home/tim/nixos").homeConfigurations.tim.options',
                        --     },
                        -- }
                    }
                }
            })

            -- Autocmd to set up LSP-specific key mappings on LSP attach
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    vim.keymap.set({ 'n', 'x' }, '<leader>l', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
                        { desc = 'format buffer', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<cr>',
                        { desc = 'hover', buffer = event.buf })
                    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>',
                        { desc = 'definition', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
                        { desc = 'declaration', buffer = event.buf })
                    vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>',
                        { desc = 'implementation', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
                        { desc = 'type definition', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>',
                        { desc = 'references', buffer = event.buf })
                    vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
                        { desc = 'signature help', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>',
                        { desc = 'rename buffer', buffer = event.buf })
                    vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>',
                        { desc = 'code actions', buffer = event.buf })
                end,
            })
        end
    },
}
