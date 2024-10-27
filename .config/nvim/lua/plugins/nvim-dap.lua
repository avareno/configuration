
return {
--     'mfussenegger/nvim-dap',
--
--     -- Optional for PHP debugging support:
--     dependencies = { 
--         -- Include the PHP Debug Adapter if desired
--         'xdebug/vscode-php-debug' 
--     },
--
--     lazy = true,
--     ft = "php",  -- Load this when editing PHP files
--
--     opts = {
--         adapters = {
--             php = {
--                 type = 'executable',
--                 command = 'node',
--                 args = { os.getenv("HOME") .. '/.dap/php-debug/out/phpDebug.js' }
--             }
--         },
--
--         configurations = {
--             {
--                 type = 'php',
--                 request = 'launch',
--                 name = 'Listen for Xdebug',
--                 port = 9003,  -- Default Xdebug port
--                 pathMappings = {
--                     ["/var/www/html"] = "${workspaceFolder}"  -- Adjust as needed for your setup
--                 }
--             }
--         }
--     }
}
