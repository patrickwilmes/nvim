local function add_luarocks_path()
    local package_path = package.path
    local home = os.getenv( "HOME" )
    local luarocks_path =  home .. "/.luarocks/share/lua/5.1/?.lua;/home/patrick/.luarocks/share/lua/5.1/?/init.lua;"
    local luarocks_cpath = home .. "/.luarocks/lib/lua/5.1/?.so;"
    local system_luarocks_path = "/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;"
    local system_luarocks_cpath = "/usr/local/lib/lua/5.1/?.so;"

    if not string.find(package_path, luarocks_path, 1, true) then
        package.path = package.path .. ";" .. luarocks_path
    end

    if not string.find(package.cpath, luarocks_cpath, 1, true) then
        package.cpath = package.cpath .. ";" .. luarocks_cpath
    end

    if not string.find(package_path, system_luarocks_path, 1, true) then
        package.path = package.path .. ";" .. system_luarocks_path
    end

    if not string.find(package.cpath, system_luarocks_cpath, 1, true) then
        package.cpath = package.cpath .. ";" .. system_luarocks_cpath
    end
end
add_luarocks_path()

local sqlite3 = require("lsqlite3")
local M = {}

function M.koogle(parameter)
    local cwd = vim.fn.getcwd()
    local db = sqlite3.open(cwd .. "/file.db")
    local stmt = db:prepare("SELECT * FROM signatures WHERE signature LIKE ?")
    stmt:bind_values("%" .. parameter .. "%")
    for row in stmt:nrows() do
        print(row.signature)
    end
    db:close()
    print("Koogle: " .. parameter)
end

vim.api.nvim_create_user_command(
    "Koogle",
    function(opts)
        M.koogle(opts.args)
    end,
    {
        nargs = 1
    }
)

return M
