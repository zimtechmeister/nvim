return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- show notification when recording macro
        routes = {
            {
                view = "notify",
                filter = { event = "msg_showmode" },
            },
        },
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
    },
}
