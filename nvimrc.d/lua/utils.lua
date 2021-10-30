-- Utility functions.
-- Sources: https://github.com/NTBBloodbath/doom-nvim/doom/utils/init.lua

local M = {}

M.version = "1.0.0"

-- get_separator will return the system paths separator, e.g. \ for Windows and / for *nix
-- @return string
local function get_separator()
  if vim.loop.os_uname().sysname == "Windows" then
    return "\\"
  end

  return "/"
end

M.sep = get_separator()

-- file_exists checks if the given file exists
-- @tparam string path The path to the file
-- @return boolean
M.file_exists = function(path)
  local fd = vim.loop.fs_open(path, "r", 438)
  if fd then
    vim.loop.fs_close(fd)
    return true
  end

  return false
end

-- Check if string is empty or if it's nil
-- @return boolean
M.is_empty = function(str)
  return str == "" or str == nil
end

-- Search if a table have the value we are looking for,
-- useful for plugins management
M.has_value = function(tabl, val)
  for _, value in ipairs(tabl) do
    if value == val then
      return true
    end
  end

  return false
end


-- read_file returns the content of the given file
-- @tparam string path The path of the file
-- @return string
M.read_file = function(path)
  local fd = vim.loop.fs_open(path, "r", 438)
  local stat = vim.loop.fs_fstat(fd)
  local data = vim.loop.fs_read(fd, stat.size, 0)
  vim.loop.fs_close(fd)

  return data
end


-- write_file writes the given string into given file
-- @tparam string path The path of the file
-- @tparam string content The content to be written in the file
-- @tparam string mode The mode for opening the file, e.g. 'w+'
M.write_file = function(path, content, mode)
  -- 644 sets read and write permissions for the owner, and it sets read-only
  -- mode for the group and others.
  vim.loop.fs_open(path, mode, tonumber("644", 8), function(err, fd)
    if not err then
      local fpipe = vim.loop.new_pipe(false)
      vim.loop.pipe_open(fpipe, fd)
      vim.loop.write(fpipe, content)
    end
  end)
end


return M
