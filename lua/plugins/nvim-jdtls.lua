return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "folke/which-key.nvim" },
  ft = { "java" },
  opts = function()
    local cmd = { vim.fn.exepath("jdtls") }
    if LazyVim.has("mason.nvim") then
      local mason_registry = require("mason-registry")
      -- Use $MASON environment variable instead of get_install_path()
      if mason_registry.has_package("jdtls") and mason_registry.is_installed("jdtls") then
        local lombok_jar = vim.fn.expand("$MASON/packages/jdtls/lombok.jar")
        table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end
    end
    return {
      root_dir = LazyVim.lsp.get_raw_config("jdtls").default_config.root_dir,
      project_name = function(root_dir)
        return root_dir and vim.fs.basename(root_dir)
      end,
      jdtls_config_dir = function(project_name)
        return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
      end,
      jdtls_workspace_dir = function(project_name)
        return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
      end,
      cmd = cmd,
      full_cmd = function(opts)
        local fname = vim.api.nvim_buf_get_name(0)
        local root_dir = opts.root_dir(fname)
        local project_name = opts.project_name(root_dir)
        local cmd = vim.deepcopy(opts.cmd)
        if project_name then
          vim.list_extend(cmd, {
            "-configuration",
            opts.jdtls_config_dir(project_name),
            "-data",
            opts.jdtls_workspace_dir(project_name),
          })
        end
        return cmd
      end,
      dap = { hotcodereplace = "auto", config_overrides = {} },
      dap_main = {},
      test = true,
      settings = {
        java = {
          inlayHints = {
            parameterNames = {
              enabled = "all",
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local java_filetypes = { "java" }

    local function extend_or_override(config, override)
      return vim.tbl_deep_extend("force", config, override or {})
    end

    local bundles = {}
    if LazyVim.has("mason.nvim") then
      local mason_registry = require("mason-registry")
      if opts.dap and LazyVim.has("nvim-dap") and mason_registry.is_installed("java-debug-adapter") then
        -- Use $MASON environment variable instead of get_install_path()
        local java_dbg_path = vim.fn.expand("$MASON/packages/java-debug-adapter")
        local jar_patterns = {
          java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
        }
        if opts.test and mason_registry.is_installed("java-test") then
          local java_test_path = vim.fn.expand("$MASON/packages/java-test")
          vim.list_extend(jar_patterns, {
            java_test_path .. "/extension/server/*.jar",
          })
        end
        for _, jar_pattern in ipairs(jar_patterns) do
          for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
            table.insert(bundles, bundle)
          end
        end
      end
    end

    local function attach_jdtls()
      local fname = vim.api.nvim_buf_get_name(0)
      local config = extend_or_override({
        cmd = opts.full_cmd(opts),
        root_dir = opts.root_dir(fname),
        init_options = {
          bundles = bundles,
        },
        settings = opts.settings,
        capabilities = LazyVim.has("cmp-nvim-lsp") and require("cmp_nvim_lsp").default_capabilities() or nil,
      }, opts.jdtls)

      require("jdtls").start_or_attach(config)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = java_filetypes,
      callback = attach_jdtls,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "jdtls" then
          local wk = require("which-key")
          wk.add({
            {
              mode = "n",
              buffer = args.buf,
              { "<leader>cx", group = "extract" },
              { "<leader>cxv", require("jdtls").extract_variable_all, desc = "Extract Variable" },
              { "<leader>cxc", require("jdtls").extract_constant, desc = "Extract Constant" },
              { "<leader>cgs", require("jdtls").super_implementation, desc = "Goto Super" },
              { "<leader>cgS", require("jdtls.tests").goto_subjects, desc = "Goto Subjects" },
              { "<leader>co", require("jdtls").organize_imports, desc = "Organize Imports" },
            },
          })
          wk.add({
            {
              mode = "v",
              buffer = args.buf,
              { "<leader>cx", group = "extract" },
              {
                "<leader>cxm",
                [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
                desc = "Extract Method",
              },
              {
                "<leader>cxv",
                [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
                desc = "Extract Variable",
              },
              {
                "<leader>cxc",
                [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
                desc = "Extract Constant",
              },
            },
          })

          if LazyVim.has("mason.nvim") then
            local mason_registry = require("mason-registry")
            if opts.dap and LazyVim.has("nvim-dap") and mason_registry.is_installed("java-debug-adapter") then
              require("jdtls").setup_dap(opts.dap)
              if opts.dap_main then
                require("jdtls.dap").setup_dap_main_class_configs(opts.dap_main)
              end

              if opts.test and mason_registry.is_installed("java-test") then
                wk.add({
                  {
                    mode = "n",
                    buffer = args.buf,
                    { "<leader>t", group = "test" },
                    {
                      "<leader>tt",
                      function()
                        require("jdtls.dap").test_class({
                          config_overrides = type(opts.test) ~= "boolean" and opts.test.config_overrides or nil,
                        })
                      end,
                      desc = "Run All Test",
                    },
                    {
                      "<leader>tr",
                      function()
                        require("jdtls.dap").test_nearest_method({
                          config_overrides = type(opts.test) ~= "boolean" and opts.test.config_overrides or nil,
                        })
                      end,
                      desc = "Run Nearest Test",
                    },
                    { "<leader>tT", require("jdtls.dap").pick_test, desc = "Run Test" },
                  },
                })
              end
            end
          end

          if opts.on_attach then
            opts.on_attach(args)
          end
        end
      end,
    })

    attach_jdtls()
  end,
}
