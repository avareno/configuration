local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter", -- Path to debugpy adapter
}

dap.configurations.python = {
  {
    name = "Launch Python Script",
    type = "python",
    request = "launch",
    program = function()
      -- Default to the currently open file
      local file_path = vim.fn.expand("%:p")

      -- Debug info
      print("Checking script path: " .. file_path)

      -- Check if the file exists
      if vim.fn.filereadable(file_path) == 1 then
        print("Script found: " .. file_path) -- Print if file is found
        return file_path
      else
        -- Prompt for input if the script doesn't exist
        print("Script not found. Please provide the correct path.")
        return vim.fn.input("Path to Python script: ", file_path, "file")
      end
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    pythonPath = function()
      -- Automatically determine the Python interpreter
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
        return venv_path .. "/bin/python"
      else
        return "python" -- Use system Python if no virtual environment is active
      end
    end,
  },
}

return {}