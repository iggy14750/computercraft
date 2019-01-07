filename = "miner.lua"
branch = "master"
-- Basically makes it easy to keep
-- grabbing files off of github
-- Edit the above parameters to change
-- the behavior of the script.

fs.delete(filename)
res = http.get("http://github.com/iggy14750/computercraft/raw/"..branch.."/"..filename)
file = io.open(filename, "w")
file:write(res.readAll())
file:close()
