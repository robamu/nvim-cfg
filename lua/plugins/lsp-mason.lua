return {
  {
    "neovim/nvim-lspconfig",
    version = "2",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      local generic_cfg = require("plugins/helpers/generic-lsp")
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          generic_cfg.on_attach(ev.data.id, ev.buf)
        end,
      })

      vim.lsp.config("basedpyright", {
        on_attach = function(_, bufnr)
          generic_cfg.on_attach(_, bufnr)
        end,
        settings = {
          basedpyright = {
            analysis = {
              -- Problematic for some reason..
              reportMissingTypeStubs = false,
              typeCheckingMode = "basic",
            },
          },
        },
      })
      vim.lsp.enable("basedpyright")

      vim.lsp.config("ruff", {
        on_attach = function(client, bufnr)
          generic_cfg.on_attach(client, bufnr)
          client.server_capabilities.hoverProvider = false
        end,
      })
      vim.lsp.enable("ruff")

      local clangd_config = vim.lsp.config["clangd"].on_attach
      vim.lsp.config("clangd", {
        capabilities = generic_cfg.capabilities,
        on_attach = function(client, bufnr)
          if clangd_config ~= nil then
            clangd_config(client, bufnr)
          end
          vim.keymap.set(
            "n",
            "<leader><tab>",
            "<Cmd>LspClangdSwitchSourceHeader<CR>",
            { desc = "Switch to source or header file" }
          )
        end,
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")

      local function create_tinymist_command(command_name)
        local export_type = command_name:match("tinymist%.export(%w+)")
        local info_type = command_name:match("tinymist%.(%w+)")
        local cmd_display = export_type
          or info_type:gsub("^get", "Get"):gsub("^pin", "Pin")

        local function run_tinymist_command()
          local bufnr = vim.api.nvim_get_current_buf()
          local client = vim.lsp.get_clients({ name = "tinymist", buffer = bufnr })[1]
          if not client then
            return vim.notify(
              "No Tinymist client attached to the current buffer",
              vim.log.levels.ERROR
            )
          end

          client:exec_cmd({
            title = export_type and "Export " .. cmd_display or cmd_display,
            command = command_name,
            arguments = { vim.api.nvim_buf_get_name(bufnr) },
          }, { bufnr = bufnr }, function(err, _)
            if err then
              return vim.notify(err.code .. ": " .. err.message, vim.log.levels.ERROR)
            end
            -- vim.notify(export_type and res or vim.inspect(res), vim.log.levels.INFO)
          end)
        end

        local cmd_name = (export_type and "LspTinymistExport" or "LspTinymist")
          .. cmd_display
        local cmd_desc = (export_type and "Export to " or "Get ") .. cmd_display

        return run_tinymist_command, cmd_name, cmd_desc
      end

      local tinymist_on_attach = vim.lsp.config["tinymist"].on_attach
      vim.lsp.config("tinymist", {
        on_attach = function(client, bufnr)
          if tinymist_on_attach ~= nil then
            tinymist_on_attach(client, bufnr)
          end
          local cmd_func, cmd_name, cmd_desc =
            create_tinymist_command("tinymist.pinMain")
          vim.api.nvim_buf_create_user_command(
            bufnr,
            cmd_name,
            cmd_func,
            { nargs = 0, desc = cmd_desc }
          )
        end,
      })
      vim.lsp.enable("tinymist")
    end,
  },

  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "owallb/mason-auto-install.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      -- Optional: LSP configurations in `vim.lsp.config` needs to be loaded
      -- first to find associated filetypes automatically. If you use
      -- lspconfig for that, add it as a dependency.
      "neovim/nvim-lspconfig",
    },
    opts = {
      packages = {
        "lua-language-server",
        "stylua",
        "codelldb",
        "ruff",
        "basedpyright",
        "rust-analyzer",
      },
    },
  },
}
