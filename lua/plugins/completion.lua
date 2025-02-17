return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "giuxtaposition/blink-cmp-copilot",
            {
                "zbirenbaum/copilot-cmp",
                dependencies = {
                    "zbirenbaum/copilot.lua",
                    {
                        "saghen/blink.compat",
                        opts = { impersonate_nvim_cmp = true, enable_events = true },
                    },
                },
            },
        },

        version = '*',

        opts = {
            keymap = { preset = 'default' },

            completion = {
                menu = {
                    border = 'single'
                },
                documentation = { window = { border = 'single' } },
            },
            signature = { window = { border = 'single' } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'markdown' },
                providers = {
                    markdown = {
                        name = 'RenderMarkdown',
                        module = 'render-markdown.integ.blink',
                        fallbacks = { 'lsp' },
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,

                        -- Copilot kind icons
                        transform_items = function(_, items)
                            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                            local kind_idx = #CompletionItemKind + 1
                            CompletionItemKind[kind_idx] = "Copilot"
                            for _, item in ipairs(items) do
                                item.kind = kind_idx
                            end
                            return items
                        end,
                    },
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono',

                -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
                kind_icons = {
                    Copilot = '',
                    Text = '󰉿',
                    Method = '󰊕',
                    Function = '󰊕',
                    Constructor = '󰒓',

                    Field = '󰜢',
                    Variable = '󰆦',
                    Property = '󰖷',

                    Class = '󱡠',
                    Interface = '󱡠',
                    Struct = '󱡠',
                    Module = '󰅩',

                    Unit = '󰪚',
                    Value = '󰦨',
                    Enum = '󰦨',
                    EnumMember = '󰦨',

                    Keyword = '󰻾',
                    Constant = '󰏿',

                    Snippet = '󱄽',
                    Color = '󰏘',
                    File = '󰈔',
                    Reference = '󰬲',
                    Folder = '󰉋',
                    Event = '󱐋',
                    Operator = '󰪚',
                    TypeParameter = '󰬛',
                },
            },
        },
        opts_extend = { "sources.default" }
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({})
        end,
    }
}
