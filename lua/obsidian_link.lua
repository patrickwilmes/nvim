local M = {}
-- Define the function to open linked files
function M.open_linked_file()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col('.')
  -- Find the [[FILE]] link around the cursor
  local start_pos = string.find(line:sub(1, col), "%[%[")
  local end_pos = string.find(line:sub(col), "%]%]")

  if start_pos and end_pos then
    start_pos = start_pos + 1
    end_pos = col + end_pos - 1
    local link = line:sub(start_pos + 1, end_pos - 1)

    -- Open the file if it exists
    local path = vim.fn.expand("%:p:h") .. "/" .. link .. ".md"
    if vim.fn.filereadable(path) == 1 then
      vim.cmd('e ' .. path)
    else
      print("File not found: " .. path)
    end
  else
    print("No valid link found under cursor")
  end
end

return M
