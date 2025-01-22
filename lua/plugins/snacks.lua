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
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        picker = { enabled = true },
    },
    keys = {
        { "<leader>n",       function() Snacks.notifier.hide() end,                                  desc = "Notification (Hide)" },
        { "<leader>nh",      function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
        { "<leader>b",       function() end,                                                         desc = "Buffer" },
        { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
        { "<leader>br",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
        { "<leader>g",       function() Snacks.lazygit() end,                                        desc = "Lazygit" },
        { "<leader>gf",      function() Snacks.lazygit.log_file() end,                               desc = "Lazygit Current File History" },
        { "<leader>gl",      function() Snacks.lazygit.log() end,                                    desc = "Lazygit Log (cwd)" },
        { "<leader>gb",      function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
        { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",             mode = { "n", "t" } },
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",              mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",              mode = { "n", "t" } },



        -- experimental
        -- picker
        { "<leader>f,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>f/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>f:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>f<space>", function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>ffr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- git
        { "<leader>fgc",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>fgs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        -- Grep
        { "<leader>fsb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>fsB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>fsg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>fsw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",    mode = { "n", "x" } },
        -- search
        { '<leader>fs"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
        { "<leader>fsa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
        { "<leader>fsc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>fsC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
        { "<leader>fsd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>fsh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
        { "<leader>fsH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
        { "<leader>fsj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
        { "<leader>fsk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>fsl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
        { "<leader>fsM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
        { "<leader>fsm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
        { "<leader>fsR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
        { "<leader>fsq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
        { "<leader>fuC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
        { "<leader>fqp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
        -- LSP
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                        desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>fss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    },
}
