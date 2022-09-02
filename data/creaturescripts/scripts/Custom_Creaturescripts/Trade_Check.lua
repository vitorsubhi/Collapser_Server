local servers = {[0] = 'server1', [1] = 'server2', [2] = 'server3'}
 
local function getType(item)
    return (item.type > 0) and item.type or 1
end
 
Log = {}
Log.__index = Log
 
function Log.create()
    local t = {}
    setmetatable(t, Log)
    t.file = servers[getConfigValue("worldId")] .. "-" .. os.date("%B-%d-%Y", os.time()) .. ".txt"
    t.str, t.cstr, t.con = '', '', 0
    return t
end
 
function Log:write()
    local f = io.open("Data/Logs/Trades/" .. self.file, "a+")
    if not f then return false end
    f:write(self.str)
    f:close()
end
 
function Log:containerString()
    self.cstr = ''
    for i = 1, self.con do
        self.cstr = self.cstr .. '-> '
    end
end
 
function Log:addContainer()
    self.con = self.con + 1
    self:containerString()
end
 
function Log:closeContainer()
    self.con = self.con - 1
    self:containerString()
end
 
function Log:setLine(txt)
    self.str = self.str .. self.cstr .. txt .. '\n'
end
 
function Log:kill()
    self.file, self.cstr, self.str, self.con = "", "", "", -1
end
 
function onTradeAccept(cid, target, item, targetItem)
	doBroadcastMessage("oi")
    local this = Log.create()
    local name, tname = getCreatureName(cid), getCreatureName(target)
 
    this:setLine("Trade between " .. name .. " and " .. tname .. " || [" .. os.date("%d/%m/%Y %H:%M:%S") .. "]")
 
    local function logging(cid, item)
        this:setLine(getCreatureName(cid) .. " traded:")
        local function scanContainer(cid, uid)
            for k = (getContainerSize(uid) - 1), 0, -1 do
                local tmp = getContainerItem(uid, k)
                this:setLine(getItemNameById(tmp.itemid) .. " x " .. getType(tmp) .. " || itemid: " .. tmp.itemid)
                if isContainer(tmp.uid) then
                    this:addContainer()
                    scanContainer(cid, tmp.uid)
                    this:closeContainer()
                end
            end
        end
 
        this:setLine(getItemNameById(item.itemid) .. " x " .. getType(item) .. " || itemid: " .. item.itemid) 
        if isContainer(item.uid) then
            --this:addContainer()
		    --scanContainer(cid, item.uid)
            --this:closeContainer()
        end
    end
 
    logging(cid, item)
    logging(target, targetItem)
    this:setLine("END OF THIS TRADE --------------\n")
    this:write()
    this:kill()
    return true
end