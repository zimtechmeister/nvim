return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                -- suggestion = { enabled = false },
                -- panel = { enabled = false },
            })
        end,
    },
    {
        "giuxtaposition/blink-cmp-copilot",
    },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end,
    -- }
}
