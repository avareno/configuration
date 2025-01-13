-- debugger/rust.lua

local dap = require("dap")

dap.adapters.codelldb = {
  type = "server",
  port = 13000, -- Use a fixed port for simplicity
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
    args = { "--port", "13000" },
  },
}

dap.configurations.rust = {
  {
    name = "Launch Rust Program",
    type = "codelldb",
    request = "launch",
    program = function()
      -- Get the name of the current project folder
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

      -- Construct the path to the project's executable
      local executable_path = vim.fn.getcwd() .. "/target/debug/" .. project_name

      -- Debug info
      print("Checking executable path: " .. executable_path)

      -- Check if the executable exists
      if vim.fn.filereadable(executable_path) == 1 then
        print("Executable found: " .. executable_path) -- Print if executable is found
        return executable_path
      else
        -- Prompt for input if the executable doesn't exist
        print("Executable not found. Please provide the correct path.")
        return vim.fn.input("Path to executable: ", executable_path, "file")
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

return {}
