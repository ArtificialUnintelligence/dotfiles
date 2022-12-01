local vnoremap = require("keymap").vnoremap
local nnoremap = require("keymap").nnoremap
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local dap = require("dap")
local dapui = require("dapui")
local wk = require("which-key")


dap.configurations.java = {
  {
    type = "java";
    name =  "Tomcat";
    request = "attach";
    hostName = "localhost";
    port = 8000;
  },
  {
    type = "java";
    name = "Wildfly";
    request = "attach";
    hostName = "localhost";
    port = 8787;
  },
  {
    type = "java";
    name = "Autotests";
    request = "attach";
    hostName = "localhost";
    port = 5005;
  }
}

dapui.setup({
  icons = { expanded = "", collapsed = ""},
  layouts = {
    {
        elements = {
            { id = "scopes", size = 0.25 }
        },
        size = 40,
        position = "left",
    }
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local workspace_dir = 'C:\\Users\\FeketeA\\nvim-workspace\\' .. project_name

local on_attach = function(client,bufnr)
  require('jdtls').setup_dap()

  vnoremap("<leader>ev", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
  vnoremap("<leader>ec", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
  vnoremap("<leader>em", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
  nnoremap('<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  nnoremap('<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  nnoremap('<leader>gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>')
  nnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- Debugger remaps
  nnoremap('<leader>dt', "<cmd>lua require('dapui').toggle()<CR>")
  nnoremap('<leader>db', "<cmd>lua require('dap').toggle_breakpoint()<CR>")
  nnoremap('<Up>', "<cmd>lua require('dap').continue()<CR>")
  nnoremap('<Down>', "<cmd>lua require('dap').step_over()<CR>")
  nnoremap('<Right>', "<cmd>lua require('dap').step_into()<CR>")
  nnoremap('<Left>', "<cmd>lua require('dap').step_out()<CR>")
  nnoremap('<leader>dd', "<cmd>lua require('dap').terminate()<CR>")

  wk.register({
    ["<leader>ev"] = "extract variable",
    ["<leader>ec"] = "extract constant",
    ["<leader>em"] = "extract method",
    ["<leader>gd"] = "go to definition",
    ["<leader>gi"] = "go to implementation",
    ["<leader>gr"] = "go to references",
    ["<leader>rn"] = "rename",
    ["<leader>dt"] = "debugger toggle",
    ["<leader>db"] = "debugger breakpoint",
    ["<leader>dd"] = "debugger deattach",
  })
end

local bundles = {
  vim.fn.glob("C:\\Users\\FeketeA\\AppData\\Local\\nvim-data\\java-debug\\com.microsoft.java.debug.plugin\\target\\com.microsoft.java.debug.plugin-*.jar", 1),
};

vim.list_extend(bundles, vim.split(vim.fn.glob("C:\\Users\\FeketeA\\AppData\\Local\\nvim-data\\vscode-java-test\\server\\*.jar", 1), "\n"))

local capabilities = {
    workspace = {
        configuration = true
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true
            }
        }
    }
}

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'C:\\Program Files\\Java\\jdk-17.0.5\\bin\\java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-javaagent:C:\\Users\\FeketeA\\AppData\\Local\\nvim-data\\jdtls\\lombok.jar',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    '-jar', 'C:\\Users\\FeketeA\\AppData\\Local\\nvim-data\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    '-configuration', 'C:\\Users\\FeketeA\\AppData\\Local\\nvim-data\\jdtls\\config_win',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  capabilities = capabilities,
  on_attach = on_attach,
  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
        configuration = {
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- And search for `interface RuntimeOption`
        -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
        runtimes = {
          {
            name = "JavaSE-11",
            path = "C:\\Program Files\\Amazon Corretto\\jdk11.0.14_10",
          },
          {
            name = "JavaSE-17",
            path = "C:\\Program Files\\Java\\jdk-17.0.5",
          }
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
