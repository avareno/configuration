-- LSP Configuration Loader
return {
    {
        "nikvdp/ejs-syntax",
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "akinsho/flutter-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = function()
            local flutter = require("flutter-tools")
            flutter.setup({
              -- widget_guides = {
              --   enabled = true,
              -- },
              closing_tags = {
                highlight = "Comment",
                prefix = "// ",
                enabled = true,
              },
              dev_log = {
                enabled = true,
                open_cmd = "tabedit",
              },
            })
            vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Devices" })
            vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "Emulators" })
            vim.keymap.set("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Reload" })
            vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Restart" })
            vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Quit" })
            vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
            vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
            vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Widget Tree" })
            vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", { desc = "Dev Tools" })
            vim.keymap.set("n", "<leader>fs", "<cmd>FlutterRun<cr>", { desc = "Run" })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "ts_ls",
                    "eslint",
                    "html",
                    "cssls",
                    "tailwindcss",
                },
                auto_install = true,
            })

            -- Setup default handlers for installed servers
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lsp_configs = { "js", "rust", "dart" }
            for _, lang in ipairs(lsp_configs) do
                local ok, mod = pcall(require, "lsp." .. lang)
                if ok and type(mod.setup) == "function" then
                    mod.setup() -- call to set indentation or other lang-specific configs
                end
            end

	    vim.diagnostic.config({
	      virtual_text = true,
	      signs = true,
	      underline = true,
	      update_in_insert = false,
	      severity_sort = true,
	    })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-h>", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
        end,
    },
}
