local M = {}

local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
-- Copied from https://github.com/simrat39/rust-tools.nvim/wiki/Debugging
-- Adapted for mason
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
-- This is the shared object for Ubuntu.. might be different on different OSes
local liblldb_path = extension_path .. "lldb/lib/liblldb"

local this_os = vim.loop.os_uname().sysname
-- The path in windows is different
if this_os:find("Windows") then
  codelldb_path = extension_path .. "adapter\\codelldb.exe"
  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

-- A bit confusing maybe, but the Rust tools lua lib has the correct settings for
-- codelldb, so we just use it here for the generic codelldb configuration.
M.codelldb = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)

return M
