return {
    {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "jdtls", "clangd" }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Add cmp_nvim_lsp capabilities to lspconfig
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            --configure language servers
            -- implement the lsp servers installed from ensure installed at mason-lspconfig
            require('lspconfig').lua_ls.setup({})
            require('lspconfig').jdtls.setup({})
            require('lspconfig').clangd.setup({})

            -- Autocmd to set up LSP-specific key mappings on LSP attach
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({'n', 'x'}, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })
        end
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')

            cmp.setup({
              sources = {
                {name = 'nvim_lsp'},
              },
              snippet = {
                expand = function(args)
                  -- You need Neovim v0.10 to use vim.snippet
                  vim.snippet.expand(args.body)
                end,
              },
              mapping = cmp.mapping.preset.insert({}),
            })
        end
    },
}
