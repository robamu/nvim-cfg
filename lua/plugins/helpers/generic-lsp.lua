local M = {}

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
M.on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end
  M.nmap = nmap

  -- Enable completion tirggered by <c-x><c-o>
  -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "LspRename",
    vim.lsp.buf.rename,
    { desc = "LSP Rename" }
  )
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "LspCodeAction",
    vim.lsp.buf.code_action,
    { desc = "LSP Code Actions" }
  )

  nmap("<leader>ci", vim.lsp.buf.incoming_calls, "[I]ncoming [C]alls")
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "LspInCalls",
    vim.lsp.buf.incoming_calls,
    { desc = "[I]ncoming [C]alls" }
  )
  nmap("<leader>co", vim.lsp.buf.outgoing_calls, "[O]outgoing [C]alls")
  vim.api.nvim_buf_create_user_command(
    bufnr,
    "LspOutCalls",
    vim.lsp.buf.outgoing_calls,
    { desc = "[O]utgoing [C]alls" }
  )

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
  nmap(
    "<leader>ds",
    require("telescope.builtin").lsp_document_symbols,
    "[D]ocument [S]ymbols"
  )
  nmap(
    "<leader>ws",
    require("telescope.builtin").lsp_dynamic_workspace_symbols,
    "[W]orkspace [S]ymbols"
  )

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders")

  local format_func = function()
    vim.lsp.buf.format({ async = true })
  end
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "LspFmt", function(_)
    format_func()
  end, { desc = "Format current buffer with LSP" })
  nmap("<leader>lf", format_func, "[F]ormat using the [L]SP")
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- Add folding to the default capabilities, also required for UFO plugin.
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
