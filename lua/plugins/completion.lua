return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- "fang2hou/blink-copilot",
        },

        version = '*',

        opts = {
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
                providers = {
                    markdown = {
                        name = 'RenderMarkdown',
                        module = 'render-markdown.integ.blink',
                        fallbacks = { 'lsp' },
                    },
                    -- copilot = {
                    --     name = "copilot",
                    --     module = "blink-copilot",
                    --     score_offset = -100,
                    --     async = true,
                    --     opts = {}
                    -- },
                },
            },
            completion = {
                documentation = {
                    auto_show = true,
                    window = {
                        border = 'single',
                    }
                },
                menu = {
                    auto_show = true,
                    border = 'single',
                },
            },
        },
        opts_extend = { "sources.default" }
    },

    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     opts = {
    --         suggestion = { enabled = false },
    --         panel = { enabled = false },
    --         filetypes = {
    --             markdown = true,
    --             help = true,
    --         },
    --     },
    -- }
}
