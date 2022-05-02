local M = {}

-- reload a plugin ( will try to load even if not loaded)
-- can take a string or list ( table )
-- return true or false
M.reload_plugin = function(plugins)
    local status = true
    local function _reload_plugin(plugin)
        local loaded = package.loaded[plugin]
        if loaded then
            package.loaded[plugin] = nil
        end
        if not pcall(require, plugin) then
            print("Error: Cannot load " .. plugin .. " plugin!")
            status = false
        end
    end

    if type(plugins) == "string" then
        _reload_plugin(plugins)
    elseif type(plugins) == "table" then
        for _, plugin in ipairs(plugins) do
            _reload_plugin(plugin)
        end
    end
    return status
end

-- 1st arg - r or w
-- 2nd arg - file path
-- 3rd arg - content if 1st arg is w
-- return file data on read, nothing on write
M.file = function(mode, filepath, content)
    local data
    local fd = assert(vim.loop.fs_open(filepath, mode, 438))
    local stat = assert(vim.loop.fs_fstat(fd))
    if stat.type ~= "file" then
        data = false
    else
        if mode == "r" then
            data = assert(vim.loop.fs_read(fd, stat.size, 0))
        else
            assert(vim.loop.fs_write(fd, content, 0))
            data = true
        end
    end
    assert(vim.loop.fs_close(fd))
    return data
end

M.clear_cmdline = function()
    vim.defer_fn(
        function()
            vim.cmd("echo")
        end,
        0
    )
end

-- hide statusline
M.hide_statusline = function()
   local hidden = {
     "NvimTree",
     "terminal",
     "dashboard",
   }
   local shown = {}
   local api = vim.api
   local buftype = api.nvim_buf_get_option(0, "ft")

   -- shown table from config has the highest priority
   if vim.tbl_contains(shown, buftype) then
      api.nvim_set_option("laststatus", 3)
      return
   end

   if vim.tbl_contains(hidden, buftype) then
      api.nvim_set_option("laststatus", 0)
      return
   else
      api.nvim_set_option("laststatus", 3)
   end
 end

return M
