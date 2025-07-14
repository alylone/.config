return {
  -- Python DAP configuration
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap_python = require("dap-python")
      -- Setup debugpy adapter (will be installed via mason)
      dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      
      -- Test runner setup
      dap_python.test_runner = "pytest"
      
      -- Custom configurations for common Python debugging scenarios
      local dap = require("dap")
      
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch current file",
        program = "${file}",
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
      })
      
      table.insert(dap.configurations.python, {
        type = "python",
        request = "launch",
        name = "Launch with arguments",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " ", true)
        end,
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
      })
      
      table.insert(dap.configurations.python, {
        type = "python",
        request = "attach",
        name = "Attach to process",
        connect = {
          host = "localhost",
          port = 5678,
        },
      })
    end,
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug test method", ft = "python" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug test class", ft = "python" },
    },
  },
  
  -- Ensure debugpy is installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "debugpy" })
    end,
  },
  
  -- Enhanced DAP keymaps for Python
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
      { "<leader>dr", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    },
  },
}