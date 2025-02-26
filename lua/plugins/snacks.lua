return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            sections = {
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                -- { pane = 2, icon = " ", title = "Sessions", section = "session", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        image = {
            enabled = true,
            doc = {
                inline = vim.g.neovim_mode == "skitty" and true or false,
            }
        },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
        },
    },
    keys = {
        { "<leader>n",  function() Snacks.notifier.hide() end,           desc = "Notification (Hide)" },
        { "<leader>nh", function() Snacks.notifier.show_history() end,   desc = "Notification History" },
        -- in combination with bufferline keymaps
        { "<leader>td", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
        { "<leader>tr", function() Snacks.rename.rename_file() end,      desc = "Rename File" },
        { "<leader>g",  function() Snacks.lazygit.open() end,            desc = "Lazygit" },
        { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
        { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",      mode = { "n", "t" } },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",      mode = { "n", "t" } },

        -- picker
        { "<leader>fp", function() Snacks.picker.pickers() end,          desc = "Pickers" },
        { "<leader>ff", function() Snacks.picker.files() end,            desc = "Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end,            desc = "Buffers" },
        -- {
        --     "<leader>fb",
        --     function()
        --         Snacks.picker.buffers({
        --             on_show = function()
        --                 vim.cmd.stopinsert()
        --             end,
        --         })
        --     end,
        --     desc = "Buffers"
        -- },
        { "<leader>f/",  function() Snacks.picker.grep() end,                 desc = "Grep" },
        { "<leader>f?",  function() Snacks.picker.grep_buffers() end,         desc = "Grep Open Buffers" },
        { "<leader>f:",  function() Snacks.picker.command_history() end,      desc = "Command History" },
        { "<leader>fn",  function() Snacks.picker.notifications() end,        desc = "Notification History" },
        { "<leader>fgb", function() Snacks.picker.git_branches() end,         desc = "Git Branches" },
        { "<leader>fk",  function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
        { "<leader>fh",  function() Snacks.picker.help() end,                 desc = "Help Pages" },
        { "<leader>fc",  function() Snacks.picker.colorschemes() end,         desc = "Colorschemes" },
        -- { "<leader>fp",  function() Snacks.picker.projects() end,             desc = "Projects" },
        { '<leader>f"',  function() Snacks.picker.registers() end,            desc = "Registers" },
        { "<leader>fj",  function() Snacks.picker.jumps() end,                desc = "Jumps" },
        { "<leader>fm",  function() Snacks.picker.marks() end,                desc = "Marks" },
        { "<leader>fd",  function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
        { "<leader>fq",  function() Snacks.picker.qflist() end,               desc = "Quickfix List" },
        { "<leader>fi",  function() Snacks.picker.icons() end,                desc = "Icons" },
        -- LSP
        { "<leader>lpd", function() Snacks.picker.lsp_definitions() end,      desc = "Picker Goto Definition" },
        { "<leader>lpD", function() Snacks.picker.lsp_declaration() end,      desc = "Picker Goto Declaration" },
        { "<leader>lpi", function() Snacks.picker.lsp_implementations() end,  desc = "Picker Goto Implementation" },
        { "<leader>lpo", function() Snacks.picker.lsp_type_definitions() end, desc = "Picker Goto T[y]pe Definition" },
        { "<leader>lpr", function() Snacks.picker.lsp_references() end,       nowait = true,                         desc = "Picker References" },
        { "<leader>lps", function() Snacks.picker.lsp_symbols() end,          desc = "Picker LSP Symbols" },
    },
}
