repeat task.wait() until game:IsLoaded()
repeat task.wait() until game:GetService("Players")
repeat task.wait() until game:GetService("Players").LocalPlayer

local lib = {}
local keybinds = {}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:WaitForChild("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local ScreenGuitwo = Instance.new("ScreenGui")
ScreenGuitwo.Parent = game:WaitForChild("CoreGui")
ScreenGuitwo.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local getasset = getsynasset or getcustomasset

syn.queue_on_teleport("loadstring(game:HttpGet(`https://raw.githubusercontent.com/KnawKx/ok/main/test.lua`, true))")

local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()

do
    local oldcharacteradded = entity.characterAdded
    entity.characterAdded = function(plr, char, localcheck)
        return oldcharacteradded(plr, char, localcheck, function() end)
    end
    entity.fullEntityRefresh()
end

if isfolder("rektsky") == false then
    makefolder("rektsky")
end

if isfolder("rektsky/sound") == false then
    makefolder("rektsky/sound")
end

if isfolder("rektsky/assets") == false then
    makefolder("rektsky/assets")
end

if isfolder("rektsky/config") == false then
    makefolder("rektsky/config")
end

function lib:ToggleLib()
    if not ScreenGui.Enabled and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
        ScreenGui.Enabled = true
    else
        if game:GetService("UserInputService"):GetFocusedTextBox() == nil then
            ScreenGui.Enabled = false
        end
    end
end
local uis = game:GetService("UserInputService")
local input = game:GetService("UserInputService")
local ms = game.Players.LocalPlayer:GetMouse()
local ts = game:GetService("TweenService")
local tweens = {Notification = function(base)
    ts:Create(base, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Position = UDim2.new(0.438, 0,0.053, 0)}):Play()
end}
local Background
local function createnotification(title, text, delay2, toggled)
    spawn(function()
        if ScreenGuitwo:FindFirstChild("Background") then ScreenGuitwo:FindFirstChild("Background"):Destroy() end
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 100, 0, 115)
        frame.Position = UDim2.new(0.5, 0, 0, -115)
        frame.BorderSizePixel = 0
        frame.AnchorPoint = Vector2.new(0.5, 0)
        frame.BackgroundTransparency = 0.5
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.Name = "Background"
        frame.Parent = ScreenGuitwo
        local frameborder = Instance.new("Frame")
        frameborder.Size = UDim2.new(1, 0, 0, 8)
        frameborder.BorderSizePixel = 0
        frameborder.BackgroundColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frameborder.Parent = frame
        local frametitle = Instance.new("TextLabel")
        frametitle.Font = Enum.Font.SourceSansLight
        frametitle.BackgroundTransparency = 1
        frametitle.Position = UDim2.new(0, 0, 0, 30)
        frametitle.TextColor3 = (toggled and Color3.fromRGB(102, 205, 67) or Color3.fromRGB(205, 64, 78))
        frametitle.Size = UDim2.new(1, 0, 0, 28)
        frametitle.Text = "          "..title
        frametitle.TextSize = 24
        frametitle.TextXAlignment = Enum.TextXAlignment.Left
        frametitle.TextYAlignment = Enum.TextYAlignment.Top
        frametitle.Parent = frame
        local frametext = Instance.new("TextLabel")
        frametext.Font = Enum.Font.SourceSansLight
        frametext.BackgroundTransparency = 1
        frametext.Position = UDim2.new(0, 0, 0, 68)
        frametext.TextColor3 = Color3.new(1, 1, 1)
        frametext.Size = UDim2.new(1, 0, 0, 28)
        frametext.Text = "          "..text
        frametext.TextSize = 24
        frametext.TextXAlignment = Enum.TextXAlignment.Left
        frametext.TextYAlignment = Enum.TextYAlignment.Top
        frametext.Parent = frame
        local textsize = game:GetService("TextService"):GetTextSize(frametitle.Text, frametitle.TextSize, frametitle.Font, Vector2.new(100000, 100000))
        local textsize2 = game:GetService("TextService"):GetTextSize(frametext.Text, frametext.TextSize, frametext.Font, Vector2.new(100000, 100000))
        if textsize2.X > textsize.X then textsize = textsize2 end
        frame.Size = UDim2.new(0, textsize.X + 38, 0, 115)
        pcall(function()
            frame:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15)
            game:GetService("Debris"):AddItem(frame, delay2 + 0.15)
        end)
    end)
end
createnotification("Loaded", "Press Right-Shift to toggle GUI", 3, true)
lib:ToggleLib()
function lib:EnableDrag(frame, parent)
    parent = parent or frame

    local dragging = false
    local dragInput, mousePos, framePos

    frame.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                mousePos = input.Position
                framePos = parent.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )

    frame.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
            then
                dragInput = input
            end
        end
    )

    input.InputChanged:Connect(
        function(input)
            if input == dragInput and dragging then
                local delta = input.Position - mousePos
                parent.Position =
                    UDim2.new(
                    framePos.X.Scale,
                    framePos.X.Offset + delta.X,
                    framePos.Y.Scale,
                    framePos.Y.Offset + delta.Y
                )
            end
        end
    )
end
local tabs = {
}
function lib:CreateTab(title, color, asset)
    table.insert(tabs, #tabs)
    local tab = Instance.new("Frame")
    local tabname = Instance.new("TextLabel")
    local assetthing = Instance.new("ImageLabel")
    tab.Name = title
    tab.ZIndex = 1
    tab.Parent = ScreenGui
    tab.BackgroundColor3 = Color3.fromRGB(14, 14, 23)
    tab.BorderSizePixel = 0
    tab.Position = UDim2.new(0,120*(#tabs+#tabs == 2 and 1 or (#tabs+#tabs-0.9)),0.0858895704, 0)
    tab.Size = UDim2.new(0, 207, 0, 40)
    tab.Active=true

    tabname.Name = title
    tabname.Parent = tab
    tabname.ZIndex = tab.ZIndex + 1
    tabname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabname.BackgroundTransparency = 1.000
    tabname.BorderSizePixel = 0
    tabname.Position = UDim2.new(0.0338164233, 0, 0.166156471, 0)
    tabname.Size = UDim2.new(0, 192, 0, 26)
    tabname.Font = Enum.Font.SourceSansLight
    tabname.Text = title
    tabname.TextColor3 = color
    tabname.TextSize = 22.000
    tabname.TextWrapped = true
    tabname.TextXAlignment = Enum.TextXAlignment.Left

    assetthing.Parent = tab
    assetthing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    assetthing.BackgroundTransparency = 1
    assetthing.Position = UDim2.new(0.811594188, 0, 0, 0)
    assetthing.Size = UDim2.new(0, 35, 0, 35)
    assetthing.Image = getasset("rektsky/assets/" .. asset .. ".png")
    local tabtable = {
        ["Toggles"]={}
    }
    function tabtable:CreateToggle(data)
    	local info = {
        ["Name"] = data["Name"],  
        ["Keybind"] = data["Keybind"], 
        ["Callback"] = (data["Callback"] or function() end)
        }
        local title,keybind,callback=info["Name"],info["Keybind"],info["Callback"]
        keybind = (keybind or {["Name"] = nil})
        keybinds[(keybind.Name or "%*")] = (keybind.Name == nil and false or true)
        local focus = {
            ["Elements"]={}
        }
        local sussyamog = {["Enabled"] = false}
        table.insert(tabtable["Toggles"],#tabtable["Toggles"])
        sussyamog["Enabled"] = false
        callback = callback or function() end
        local oldkey = keybind.Name
        local toggle = Instance.new("TextButton")
        local togname = Instance.new("TextLabel")
        local toggledtog = Instance.new("TextButton")
        local togname_2 = Instance.new("TextLabel")

        toggle.Name = "toggle_" .. title
        toggle.Parent = tab
        toggle.BackgroundColor3 = Color3.fromRGB(14, 20, 14)
        toggle.BorderSizePixel = 0
        toggle.Position = UDim2.new(0.0827946085, -17, 0.133742347, 33*#tabtable["Toggles"])
        toggle.Size = UDim2.new(0, 207, 0, 40)
        toggle.Text = ""

        togname.Name = "toggle_" .. title .. "234"
        togname.Parent = toggle
        togname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togname.BackgroundTransparency = 1.000
        togname.BorderSizePixel = 0
        togname.Position = UDim2.new(0.0338164233, 0, 0.163378686, 0)
        togname.Size = UDim2.new(0, 192, 0, 26)
        togname.Font = Enum.Font.SourceSansLight
        togname.Text = title.." ["..(keybind.Name or "...") .."]"
        togname.TextColor3 = Color3.fromRGB(255, 255, 255)
        togname.TextSize = 22.000
        togname.TextWrapped = true
        togname.TextXAlignment = Enum.TextXAlignment.Left

        if isfile("rektsky/config/"..title..".lua") then 
        else
            writefile("rektsky/config/"..title..".lua", "false") 
        end

        function sussyamog:Toggle(bool)
            bool = bool or (not sussyamog["Enabled"])
            sussyamog["Enabled"] = bool
            if not bool then
                spawn(function()
                    callback(false)
                end)
                spawn(function()
                    createnotification(title, "Disabled "..title, 4, false)
                    writefile("rektsky/config/"..title..".lua", "false")
                end)
                toggle.BackgroundColor3 = Color3.fromRGB(14, 20, 14)
                local sound = Instance.new("Sound")
                sound.Parent = workspace
                sound.SoundId = getasset("rektsky/sound/disable.mp3")
                sound:Play()
                wait(0.5)
                sound:remove()
            else
                spawn(function()
                    callback(true)
                end)
                spawn(function()
                    createnotification(title, "Enabled "..title, 4, true)
                    writefile("rektsky/config/"..title..".lua", "true")
                end)
                toggle.BackgroundColor3 = tabname.TextColor3
                local sound = Instance.new("Sound")
                sound.Parent = workspace
                sound.SoundId = getasset("rektsky/sound/enable.mp3")
                sound:Play()
                wait(0.5)
                sound:remove()
            end
        end

        function sussyamog:silentToggle(bool)
            bool = bool or (not sussyamog["Enabled"])
            if type(bool) == "boolean" then
                bool = bool
            else
                if type(bool) == "string" then
                    if bool == "true" then
                        bool = true
                    else
                        if bool == "false" then
                            bool = false
                        end
                    end
                end
            end
            sussyamog["Enabled"] = bool
            if bool == false or bool == "false" then
                spawn(function()
                    callback(false)
                end)
                writefile("rektsky/config/"..title..".lua", "false")
                toggle.BackgroundColor3 = Color3.fromRGB(14, 20, 14)
            else
                if bool == true or bool == "true" then
                    spawn(function()
                        callback(true)
                    end)
                    writefile("rektsky/config/"..title..".lua", "true")
                    toggle.BackgroundColor3 = tabname.TextColor3
                end
            end
        end
        
        toggle.MouseEnter:Connect(function()
            focus["Elements"]["toggle_"..title]=true 
        end)
        toggle.MouseLeave:Connect(function()
            focus["Elements"]["toggle_"..title]=false
        end)
        toggle.MouseButton2Click:Connect(function()
            if not focus["Elements"]["toggle_"..title]  then return end
            if isclicked == true then return end
            isclicked = true
            togname.Text = title.." [...]"
            
            uis.InputBegan:Connect(function(input)
                if input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name ~= oldkey then
                        if isclicked  == false  then return end
                        if keybinds[input.KeyCode.Name] == true then
                            togname.Text = title.." ["..oldkey.."]"
                            isclicked = false
                            return
                        end
                        if oldkey ~= nil then 
                            keybinds[oldkey] = nil
                        end
                        oldkey=input.KeyCode.Name
                        togname.Text=title.." ["..oldkey.."]"
                        writefile("rektsky/config/"..title.."keybind.lua", oldkey)
                        isclicked = false
                        cooldown = true
                        wait(0.5)
                        cooldown = false
                    end
            end)
        end)
        toggle.MouseButton1Click:Connect(function()
            sussyamog:Toggle()
        end)
        uis.InputBegan:Connect(function(input)
            if oldkey == nil then return end
            if cooldown == true then
                cooldown = false
                return
            end
            if isclicked == true then return end
            if input.KeyCode.Name == oldkey and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
                sussyamog:Toggle()
            end	
        end) 
        if readfile("rektsky/config/"..title..".lua") == "true" then
            sussyamog:silentToggle(true)
        end
        if isfile("rektsky/config/"..title.."keybind.lua") then
            local x = readfile("rektsky/config/"..title.."keybind.lua")
            if keybinds[x] == true then
                togname.Text = title.." ["..x.."]"
                isclicked = false
                return
            end
            if oldkey ~= nil then 
                keybinds[oldkey] = nil
            end
            oldkey=x
            togname.Text=title.." ["..x.."]"
            writefile("rektsky/config/"..title.."keybind.lua", oldkey)
            isclicked = false
            cooldown = true
            wait(0.5)
            cooldown = false
        end
        return sussyamog
    end
    return tabtable
end

-- CODE

uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        lib:ToggleLib()
    end
end) 

local lplr = game:GetService("Players").LocalPlayer
local char = lplr.Character
local hrp = char:FindFirstChild("HumanoidRootPart")
local hmd = char.Humanoid
local cam = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client

local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
local sprintthingy = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.sprint["sprint-controller"]).SprintController
local kbtable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemtablefunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
local itemtable = debug.getupvalue(itemtablefunc, 1)
local matchend = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.game.match["match-end-controller"]).MatchEndController
local matchstate = require(game:GetService("ReplicatedStorage").TS.match["match-state"]).MatchState
local KnitClient = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].knit.src).KnitClient
local ballooncontroller = KnitClient.Controllers.BalloonController
local queuemeta = require(game:GetService("ReplicatedStorage").TS.game["queue-meta"]).QueueMeta
local clntstorehandlr = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
local matchState = clntstorehandlr:getState().Game.matchState
local itemmeta = require(game:GetService("ReplicatedStorage").TS.item["item-meta"])

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end

local atkremote = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))  

SwordInfo = {
    [1] = {
        ["Name"] = "wood_sword",
        ["Display"] = "Wood Sword",
        ["Rank"] = 1,
    },
    [2] = {
        ["Name"] = "stone_sword",
        ["Display"] = "Stone Sword",
        ["Rank"] = 2,
    },
    [3] = {
        ["Name"] = "iron_sword",
        ["Display"] = "Iron Sword",
        ["Rank"] = 3,
    },
    [4] = {
        ["Name"] = "diamond_sword",
        ["Display"] = "Diamond Sword",
        ["Rank"] = 4,
    },
    [5] = {
        ["Name"] = "emerald_sword",
        ["Display"] = "Emerald Sword",
        ["Rank"] = 5,
    },
    [6] = {
        ["Name"] = "rageblade",
        ["Display"] = "Rage Blade",
        ["Rank"] = 6,
    },
}

function GetSwordMeta(Sword)
   for _,thing in pairs(itemmeta) do
        for _,item in pairs(debug.getupvalue(thing, 1)) do
            if item["displayName"] and item["displayName"] == Sword then
                return item
            end
        end
    end
end

function GetSwordDisplay(Sword)
    for _,SwordData in pairs(SwordInfo) do
        if SwordData["Name"] == Sword then
           return SwordData["Display"] 
        end
    end
end

function getsword()
    local bestsword = nil
    local bestrank = 0
    for i,v in pairs(game.Players.LocalPlayer.Character.InventoryFolder.Value:GetChildren()) do
        if v.Name:match("sword") or v.Name:match("blade") then
            for _,data in pairs(SwordInfo) do
                if data["Name"] == v.Name then
                    if bestrank <= data["Rank"] then
                        bestrank = data["Rank"]
                        bestsword = v
                    end
                end
            end
        end
    end
    return bestsword
end

function attackfunc(entity,target,selfpos,campos,mousray)
    atkremote:CallServer({["entityInstance"] = entity,["validate"] = {["targetPosition"] = {["value"] = target,["hash"] = hash(target)},["raycast"] = {["cursorDirection"] = {["value"] = mousray,["hash"] = hash(mousray)},["cameraPosition"] = {["value"] = campos,["hash"] = hash(campos)}},["selfPosition"] = {["value"] = selfpos,["hash"] = hash(selfpos)}},["chargedAttack"] = {["chargeRatio"] = 1000},["weapon"] = getsword()})
end

function KillauraRemote()
    local mouse = game.Players.LocalPlayer:GetMouse()
    for i,v in pairs(game.Players:GetChildren()) do
        if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
            local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if mag <= 25 and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local selfPosition = game.Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position
                local Entity = v.Character
                local cam = game.Workspace.Camera
                local target = v.Character:GetPrimaryPartCFrame().Position
                local campos = game.Workspace.Camera.CFrame.Position
                local mousray = Ray.new(cam.CFrame.p, v.Character.HumanoidRootPart.Position).Unit.Direction
                attackfunc(Entity,target,selfPosition,campos,mousray)
            end
        end
    end 
end

function getclosebed()
    for i,v in pairs(game:GetService("Workspace").Map.Blocks:GetChildren()) do
        if v.Name == "bed" and v:FindFirstChild("Covers") then
            local magcheck = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Covers.Position).Magnitude
            if magcheck <= 45 then
                return v
            end
        end
    end
end

function getanumber()
    local added = 0
    for i,v in pairs(game.Workspace.Map.Blocks:GetChildren()) do
        local target = getclosebed()
        if target ~= nil and v.Position then
            if target.Position.X == v.Position.X and target.Position.Z == v.Position.Z then
                if v.Position.Y > target.Position.Y and v.Position.Y - target.Position.Y < 16.5 then
                    added = added + 1
                end
            end
        end
    end
    return added
end

function hitblock(X,Y,Z)
    local args = {
        [1] = {
            ["blockRef"] = {
                ["blockPosition"] = Vector3.new(X/3,Y/3,Z/3)
            },
            ["hitPosition"] = Vector3.new(X/3,Y/3,Z/3),
            ["hitNormal"] = Vector3.new(X/3,Y/3,Z/3)
        }
    }

    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer(unpack(args))
end

local Tabs = {
    ["Combat"] = lib:CreateTab("Combat",Color3.fromRGB(252, 60, 68),"combat"),
    ["Movement"] = lib:CreateTab("Movement",Color3.fromRGB(255, 148, 36),"movement"),
    ["Render"] = lib:CreateTab("Render",Color3.fromRGB(59, 170, 222),"render"),
    ["Player"] = lib:CreateTab("Player",Color3.fromRGB(83, 214, 110),"player"),
    ["Exploits"] = lib:CreateTab("Exploits",Color3.fromRGB(157, 39, 41),"exploit"),
    ["Rektsky"] = lib:CreateTab("RektSky",Color3.fromRGB(64,124,252),"rektsky"),
    ["World"] = lib:CreateTab("World",Color3.fromRGB(52,28,228),"world")
}

-- COMBAT

Tabs["Combat"]:CreateToggle({
    ["Name"] = "KillAura",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local kauraval = v
        spawn(function()
            if kauraval and entity.isAlive then
                RunService.RenderStepped:Connect(function(step)
                    if not kauraval then 
                        return
                    end
                    if entity.isAlive then
                        KillauraRemote()
                    end
                end)
            else
                return
            end
        end)
    end
})
pcall(function()
local ShieldRemote = getremote(debug.getconstants(debug.getprotos(getmetatable(KnitClient.Controllers.ShieldController).raiseShield)[1]))
local connectionkaurablock
Tabs["Combat"]:CreateToggle({
    ["Name"] = "AutoBlockKillAura",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v and entity.isAlive then
            connectionkaurablock = game:GetService("RunService").Stepped:connect(function()
                spawn(function()
                    task.wait()
                    if not v then
                        connectionkaurablock:Disconnect()
                        return 
                    end
                    Client:Get(ShieldRemote):SendToServer({["raised"] = true})
                    KillauraRemote()
                end)
            end)
        else
            connectionkaurablock:Disconnect()
            return
        end
    end
})
end)

Tabs["Combat"]:CreateToggle({
    ["Name"] = "Velocity",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        getgenv().veloval = v
        spawn(function()
            if v then
                if not hmd then return end
                if hmd then
                    kbtable["kbDirectionStrength"] = 0
                    kbtable["kbUpwardStrength"] = 0
                end
            else
                kbtable["kbDirectionStrength"] = 100
                kbtable["kbUpwardStrength"] = 100
                return
            end
        end)
    end
})

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant

local function getEquipped()
    local typetext = ""
    local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
    if obj then
        if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
            typetext = "sword"
        end
        if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
            typetext = "block"
        end
        if obj.Name:find("bow") then
            typetext = "bow"
        end
    end
    return {["Object"] = obj, ["Type"] = typetext}
end

local ACC1
local ACC2
Tabs["Combat"]:CreateToggle({
    ["Name"] = "AutoClicker",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            local holding = false
            ACC1 = uis.InputBegan:connect(function(input, gameProcessed)
                if gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
                    holding = true
                    print(holding)
                end
            end)
            ACC2 = uis.InputEnded:connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    holding = false
                    print(holding)
                end
            end)
            spawn(function()
                repeat
                    task.wait(1/20)
                    if holding then
                        if holding == false then return end
                        if getEquipped()["Type"] == "sword" then 
                            if holding == false then return end
                            SwordCont:swingSwordAtMouse()
                        end
                    end
                until v == false
            end)
        else
            ACC1:Disconnect()
            ACC2:Disconnect()
            return
        end
    end
})

Tabs["Combat"]:CreateToggle({
    ["Name"] = "NoClickDelay",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        getgenv().funisus = v
        spawn(function()
            if v and entity.isAlive then
                for i2,v2 in pairs(itemtable) do
                    if type(v2) == "table" and rawget(v2, "sword") then
                        v2.sword.attackSpeed = 0.000000001
                    end
                    SwordCont.isClickingTooFast = function() return false end
                end
            else
            end
        end)
    end
})

Tabs["Combat"]:CreateToggle({
    ["Name"] = "Reach",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 17.4
        else
            CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
        end
    end
})

-- MOVEMENT

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

function tpreal(t)
    for i,v in pairs(realchar:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
            v.Transparency = t
        elseif v:IsA("Decal") then
            v.Transparency = t
        end
    end
end

local connectionnn
local conectthing
local longjumpenabled
local floatdisab
Tabs["Movement"]:CreateToggle({
    ["Name"] = "Speed",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            spawn(function()
                if matchState == 0 then
                    createnotification("Speed", "Will enable speed when match started!", 4, true)
                end
            end)
            repeat wait() until matchState == 1
            if matchState == 1 then
                spawn(function()
                    local speed = 23
                    connectionnn = game:GetService("RunService").Heartbeat:connect(function()
                        local velo = lplr.Character.Humanoid.MoveDirection * speed
                        lplr.Character.HumanoidRootPart.Velocity = Vector3.new(velo.x, lplr.Character.HumanoidRootPart.Velocity.y, velo.z)
                    end)
                    if longjumpenabled["Enabled"] then
                        speed = 17.5
                    else
                        speed = 23
                    end
                    if floatdisab["Enabled"] then
                        conectthinghh = game:GetService("RunService").Stepped:connect(function(time, delta)
                            if entity.isAlive then
                                if (not isnetworkowner(lplr.Character.HumanoidRootPart)) then
                                    lagbacked = true
                                end
                                if (isnetworkowner(lplr.Character.HumanoidRootPart)) then
                                    lagbacked = false
                                end
                                if lplr.Character.Humanoid.MoveDirection.Magnitude > 0 and isnetworkowner(lplr.Character.HumanoidRootPart) then
                                    lplr.Character:TranslateBy(lplr.Character.Humanoid.MoveDirection * (lagbacked and 200 or 230) / 10 * delta)
                                end
                            end
                            task.wait()
                        end)
                    else
                        conectthing = game:GetService("RunService").Stepped:connect(function(time, delta)
                            if entity.isAlive then
                                if (not isnetworkowner(lplr.Character.HumanoidRootPart)) then
                                    lagbacked = true
                                end
                                if (isnetworkowner(lplr.Character.HumanoidRootPart)) then
                                    lagbacked = false
                                end
                                if lplr.Character.Humanoid.MoveDirection.Magnitude > 0 and isnetworkowner(lplr.Character.HumanoidRootPart) then
                                    lplr.Character:TranslateBy(lplr.Character.Humanoid.MoveDirection * (lagbacked and 230 or 255) / 10 * delta)
                                end
                            end
                            task.wait()
                        end)
                    end
                end)
            end
        else
            if floatdisab["Enabled"] then
                conectthinghh:Disconnect()
                connectionnn:Disconnect()
            else
                conectthing:Disconnect()
                connectionnn:Disconnect()
            end
        end
    end
})

local sprint = false
Tabs["Movement"]:CreateToggle({
    ["Name"] = "Sprint",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        sprint = v
        if sprint then
            spawn(function()
                repeat
                    wait()
                    if (not sprint) then return end
                    if sprintthingy.sprinting == false then
                        sprintthingy:startSprinting()
                    end
                until (not sprint)
            end)
        else
            sprintthingy:stopSprinting()
        end
    end
})

local highjump
highjump = Tabs["Movement"]:CreateToggle({
    ["Name"] = "HighJump",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local highjumpval = v
        if highjumpval then
            lplr.Character.Humanoid:ChangeState("Jumping")
            wait(0.00001)
            workspace.Gravity = 5
            spawn(function()
                for i = 1, 30 do
                    wait()
                    if (not highjumpval) then return end
                    lplr.Character.Humanoid:ChangeState("Jumping")
                end
            end)
            spawn(function()
                for i = 1, 1.5 do
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                end
            end)
            highjump:silentToggle()
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local longjumpval = false
longjumpenabled = Tabs["Movement"]:CreateToggle({
    ["Name"] = "LongJump",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        longjumpval = v
        if longjumpval then
            workspace.Gravity = 5
            spawn(function()
                repeat
                    wait()
                    if (not longjumpval) then return end
                    lplr.Character:FindFirstChild("HumanoidRootPart").CFrame = lplr.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0, 0.25, 0)
                until (not longjumpval)
            end)
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
                    wait(0.1)
                    lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                    wait(0.1)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

-- RENDER

function yesyesbed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        local sound = Instance.new("Sound")
        sound.Parent = workspace
        sound.SoundId = getasset("rektsky/sound/mc/bedbroken.mp3")
        sound:Play()
        wait(7)
        sound:remove()
    end
end

local gamesound = require(game:GetService("ReplicatedStorage").TS.sound["game-sound"]).GameSound
Tabs["Render"]:CreateToggle({
    ["Name"] = "MCSounds",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        getgenv().mcsounds = v
        if getgenv().mcsounds then
            spawn(function()
                lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesyesbed)
            end)
            spawn(function()
                Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                    p13:Connect(function(p14)
                        local sound = Instance.new("Sound")
                        sound.Parent = workspace
                        sound.SoundId = getasset("rektsky/sound/mc/bedbreak.mp3")
                        sound:Play()
                        wait(4)
                        sound:remove()
                    end)
                end)
            end)
            local oldsounds = gamesound
            local newsounds = gamesound
            newsounds.UI_CLICK = "rbxassetid://535716488"
            newsounds.PICKUP_ITEM_DROP = getasset("rektsky/sound/mc/pickup.mp3")
            newsounds.KILL = "rbxassetid://1053296915"
            newsounds.DAMAGE_1 = "rbxassetid://6361963422"
            newsounds.DAMAGE = "rbxassetid://6361963422"
            newsounds.DAMAGE_2 = "rbxassetid://6361963422"
            newsounds.DAMAGE_3 = "rbxassetid://6361963422"
            newsounds.SWORD_SWING_1 = ""
            newsounds.SWORD_SWING_2 = ""
            newsounds.BEDWARS_PURCHASE_ITEM = getasset("rektsky/sound/mc/buyitem.mp3")
            newsounds.STATIC_HIT = "rbxassetid://6361963422"
            newsounds.STONE_BREAK = "rbxassetid://6496157434"
            newsounds.WOOL_BREAK = getasset("rektsky/sound/mc/woolbreak.mp3")
            newsounds.WOOD_BREAK = getasset("rektsky/sound/mc/breakwood.mp3")
            newsounds.GLASS_BREAK = getasset("rektsky/sound/mc/glassbreak.mp3")
            newsounds.TNT_HISS_1 = getasset("rektsky/sound/mc/tnthiss.mp3")
            newsounds.TNT_EXPLODE_1 = getasset("rektsky/sound/mc/tntexplode.mp3")
            gamesound = newsounds
        else
            gamesound = oldsounds
        end
    end
})

local function Cape(char, texture)
	for i,v in pairs(char:GetDescendants()) do
		if v.Name == "Cape" then
			v:Remove()
		end
	end
			local hum = char:WaitForChild("Humanoid")
			local torso = nil
			if hum.RigType == Enum.HumanoidRigType.R15 then
			torso = char:WaitForChild("UpperTorso")
			else
			torso = char:WaitForChild("Torso")
			end
			local p = Instance.new("Part", torso.Parent)
			p.Name = "Cape"
			p.Anchored = false
			p.CanCollide = false
			p.TopSurface = 0
			p.BottomSurface = 0
			p.FormFactor = "Custom"
			p.Size = Vector3.new(0.2,0.2,0.2)
			p.Transparency = 1
			local decal = Instance.new("Decal", p)
			decal.Texture = texture
			decal.Face = "Back"
			local msh = Instance.new("BlockMesh", p)
			msh.Scale = Vector3.new(9,17.5,0.5)
			local motor = Instance.new("Motor", p)
			motor.Part0 = p
			motor.Part1 = torso
			motor.MaxVelocity = 0.01
			motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
			motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
			local wave = false
			repeat wait(1/44)
				decal.Transparency = torso.Transparency
				local ang = 0.1
				local oldmag = torso.Velocity.magnitude
				local mv = 0.002
				if wave then
					ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
					wave = false
				else
					wave = true
				end
				ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
				motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
				motor.DesiredAngle = -ang
				if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
					motor.MaxVelocity = 0.04
				end
				repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
				if torso.Velocity.magnitude < 0.1 then
					wait(0.1)
				end
			until not p or p.Parent ~= torso.Parent
end

Tabs["Render"]:CreateToggle({
    ["Name"] = "Cape",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v and entity.isAlive then
            Cape(game.Players.LocalPlayer.Character, getasset("rektsky/cape.png"))
        else
            Cape(game.Players.LocalPlayer.Character, nil)
        end
    end
})

local function makeRainbowText(text)
    spawn(function()
        repeat
            game:GetService("TweenService"):Create(text, TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
            task.wait(.5)
            game:GetService("TweenService"):Create(text, TweenInfo.new(.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(math.random(0,255),math.random(0,255),math.random(0,255))}):Play()
            task.wait(.5)
        until true == false
    end)
end

local surface
local players = game:GetService("Players")
local currentPlayer = nil
local lplayer = players.LocalPlayer
local espfaces = {"Front","Back","Bottom","Left","Right","Top"} 
local ENEMYCOLOR =  {255,0,0}
local ALLYCOLOR =  {0,0,255}
Tabs["Render"]:CreateToggle({
    ["Name"] = "ESP",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local espval = v
        if espval then
            function createFlex()
                players.PlayerAdded:Connect(function(p)
                    currentPlayer = p
                    p.CharacterAdded:Connect(function(character)
                        createESP(character)            
                    end)     
                end)
                function checkPart(obj)  if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then return true end end 
                function actualESP(obj) 
                    for i=0,5 do
                        surface = Instance.new("SurfaceGui",obj)
                        surface.Face = Enum.NormalId[espfaces[i+1]]
                        surface.AlwaysOnTop = true
            
                        frame = Instance.new("Frame",surface)
                        frame.Size = UDim2.new(1,0,1,0)
                        frame.BorderSizePixel = 0                                               
                        frame.BackgroundTransparency = 0
            
                        if currentPlayer.Team == players.LocalPlayer.Team then
                            frame.BackgroundColor3 = Color3.new(ALLYCOLOR[1],ALLYCOLOR[2],ALLYCOLOR[3])                                         
                        else
                            frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1],ENEMYCOLOR[2],ENEMYCOLOR[3])
                        end
                    end
                end
                function createESP(c)
                    bugfix = c:WaitForChild("Head")
                    for i,v in pairs(c:GetChildren()) do
                        if checkPart(v) then
                            actualESP(v)
                        end
                    end
                end
                for i,people in pairs(players:GetChildren())do
                    if people ~= players.LocalPlayer then
                        currentPlayer = people
                        createESP(people.Character)
                        people.CharacterAdded:Connect(function(character)
                            wait(0.3)
                            createESP(character)            
                        end)
                    end
                end
            end
            createFlex()
        else
            surface:Destroy()
            return
        end
    end
})

Tabs["Render"]:CreateToggle({
    ["Name"] = "WaterMarks",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if entity.isAlive then
            if v then
                local screngiu = Instance.new("ScreenGui")
                local Frame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local ImageLabel = Instance.new("ImageLabel")
                local TextLabel = Instance.new("TextLabel")
                screngiu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
                screngiu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                Frame.Parent = screngiu
                Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Frame.BackgroundTransparency = 0.400
                Frame.Position = UDim2.new(0.0163636357, 0, 0.0343558267, 0)
                Frame.Size = UDim2.new(0, 149, 0, 149)
                UICorner.CornerRadius = UDim.new(0, 9)
                UICorner.Parent = Frame
                ImageLabel.Parent = Frame
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1.000
                ImageLabel.Position = UDim2.new(0.137143791, 0, 0.0700296983, 0)
                ImageLabel.Size = UDim2.new(0, 108, 0, 108)
                ImageLabel.Image = getasset("rektsky/assets/icon.png")
                TextLabel.Parent = Frame
                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.BackgroundTransparency = 1.000
                TextLabel.BorderSizePixel = 0
                TextLabel.Position = UDim2.new(0.0402684584, 0, 0.798657715, 0)
                TextLabel.Size = UDim2.new(0, 132, 0, 30)
                TextLabel.Font = Enum.Font.SourceSansLight
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextScaled = true
                TextLabel.TextSize = 14.000
                TextLabel.TextWrapped = true
                TextLabel.Text = "RektSky"
                makeRainbowText(TextLabel, true)
            else
                makeRainbowText(TextLabel, false)
                screngiu:Destroy()
                return
            end
        end
    end
})

local ScreenGuie
Tabs["Render"]:CreateToggle({
    ["Name"] = "KeyStrokes",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local keystrokesval = v
        if keystrokesval then
            local ScreenGuie = Instance.new("ScreenGui")
            local WKey = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local TextLabel = Instance.new("TextLabel")
            local SKey = Instance.new("Frame")
            local UICorner_2 = Instance.new("UICorner")
            local TextLabel_2 = Instance.new("TextLabel")
            local AKey = Instance.new("Frame")
            local UICorner_3 = Instance.new("UICorner")
            local TextLabel_3 = Instance.new("TextLabel")
            local DKey = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local TextLabel_4 = Instance.new("TextLabel")
            local LMB = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local TextLabel_5 = Instance.new("TextLabel")
            local RMB = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local TextLabel_6 = Instance.new("TextLabel")
            
            --Properties:
            
            ScreenGuie.Parent = game.CoreGui
            
            WKey.Name = "WKey"
            WKey.Parent = ScreenGuie
            WKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            WKey.BackgroundTransparency = 0.300
            WKey.Position = UDim2.new(0.0412545539, 0, 0.218990266, 0)
            WKey.Size = UDim2.new(0, 58, 0, 56)
            
            UICorner.CornerRadius = UDim.new(0, 9)
            UICorner.Parent = WKey
            
            TextLabel.Parent = WKey
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(7.82310963e-08, 0, 9.87201929e-08, 0)
            TextLabel.Size = UDim2.new(0, 58, 0, 56)
            TextLabel.Font = Enum.Font.SourceSansLight
            TextLabel.Text = "W"
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextSize = 30.000
            
            SKey.Name = "SKey"
            SKey.Parent = ScreenGuie
            SKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            SKey.BackgroundTransparency = 0.300
            SKey.Position = UDim2.new(0.0408016965, 0, 0.301259696, 0)
            SKey.Selectable = true
            SKey.Size = UDim2.new(0, 61, 0, 56)
            
            UICorner_2.CornerRadius = UDim.new(0, 9)
            UICorner_2.Parent = SKey
            
            TextLabel_2.Parent = SKey
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Position = UDim2.new(0.0409834981, 0, -2.38418579e-07, 0)
            TextLabel_2.Size = UDim2.new(0, 58, 0, 56)
            TextLabel_2.Font = Enum.Font.SourceSansLight
            TextLabel_2.Text = "S"
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextSize = 30.000
            
            AKey.Name = "AKey"
            AKey.Parent = ScreenGuie
            AKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            AKey.BackgroundTransparency = 0.300
            AKey.Position = UDim2.new(0.0046426258, 0, 0.301259696, 0)
            AKey.Selectable = true
            AKey.Size = UDim2.new(0, 58, 0, 56)
            
            UICorner_3.CornerRadius = UDim.new(0, 9)
            UICorner_3.Parent = AKey
            
            TextLabel_3.Parent = AKey
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.Size = UDim2.new(0, 58, 0, 56)
            TextLabel_3.Font = Enum.Font.SourceSansLight
            TextLabel_3.Text = "A"
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextSize = 30.000
            
            DKey.Name = "DKey"
            DKey.Parent = ScreenGuie
            DKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            DKey.BackgroundTransparency = 0.300
            DKey.Position = UDim2.new(0.0777207837, 0, 0.301259696, 0)
            DKey.Selectable = true
            DKey.Size = UDim2.new(0, 58, 0, 56)
            
            UICorner_4.CornerRadius = UDim.new(0, 9)
            UICorner_4.Parent = DKey
            
            TextLabel_4.Parent = DKey
            TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.BackgroundTransparency = 1.000
            TextLabel_4.BorderSizePixel = 0
            TextLabel_4.Position = UDim2.new(-1.1920929e-07, 0, 0, 0)
            TextLabel_4.Size = UDim2.new(0, 58, 0, 56)
            TextLabel_4.Font = Enum.Font.SourceSansLight
            TextLabel_4.Text = "D"
            TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.TextSize = 30.000
            
            LMB.Name = "LMB"
            LMB.Parent = ScreenGuie
            LMB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            LMB.BackgroundTransparency = 0.300
            LMB.Position = UDim2.new(0.00477237254, 0, 0.386007428, 0)
            LMB.Selectable = true
            LMB.Size = UDim2.new(0, 90, 0, 56)
            
            UICorner_5.CornerRadius = UDim.new(0, 9)
            UICorner_5.Parent = LMB
            
            TextLabel_5.Parent = LMB
            TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.BackgroundTransparency = 1.000
            TextLabel_5.BorderSizePixel = 0
            TextLabel_5.Position = UDim2.new(0.174026534, 0, 0, 0)
            TextLabel_5.Size = UDim2.new(0, 58, 0, 56)
            TextLabel_5.Font = Enum.Font.SourceSansLight
            TextLabel_5.Text = "LMB"
            TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.TextSize = 30.000
            
            RMB.Name = "RMB"
            RMB.Parent = ScreenGuie
            RMB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            RMB.BackgroundTransparency = 0.300
            RMB.Position = UDim2.new(0.062555559, 0, 0.386007428, 0)
            RMB.Selectable = true
            RMB.Size = UDim2.new(0, 87, 0, 56)
            
            UICorner_6.CornerRadius = UDim.new(0, 9)
            UICorner_6.Parent = RMB
            
            TextLabel_6.Parent = RMB
            TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.BackgroundTransparency = 1.000
            TextLabel_6.BorderSizePixel = 0
            TextLabel_6.Position = UDim2.new(0.163681686, 0, 0, 0)
            TextLabel_6.Size = UDim2.new(0, 58, 0, 56)
            TextLabel_6.Font = Enum.Font.SourceSansLight
            TextLabel_6.Text = "RMB"
            TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.TextSize = 30.000
            spawn(function()
                repeat
                    wait()
                    if uis:IsKeyDown(Enum.KeyCode.A) then
                        AKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
                    else
                        AKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    if uis:IsKeyDown(Enum.KeyCode.D) then
                        DKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_4.TextColor3 = Color3.fromRGB(0, 0, 0)
                    else
                        DKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    if uis:IsKeyDown(Enum.KeyCode.W) then
                        WKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
                    else
                        WKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    if uis:IsKeyDown(Enum.KeyCode.S) then
                        SKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    else
                        SKey.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    uis.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            LMB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel_5.TextColor3 = Color3.fromRGB(0, 0, 0)
                        end
                        if input.UserInputType == Enum.UserInputType.MouseButton2 then
                            RMB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            TextLabel_6.TextColor3 = Color3.fromRGB(0, 0, 0)
                        end
                    end)
                    uis.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            LMB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                        if input.UserInputType == Enum.UserInputType.MouseButton2 then
                            RMB.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
                        end
                    end)
                until (not keystrokesval)
            end)
        else
            ScreenGuie:Destroy()
        end
    end
})

Tabs["Render"]:CreateToggle({
    ["Name"] = "Night",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            game.Lighting.TimeOfDay = "00:00:00"
        else
            game.Lighting.TimeOfDay = "13:00:00"
        end
    end
})

Tabs["Render"]:CreateToggle({
    ["Name"] = "RektskyAmbience",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v then
            game.Lighting.Ambient = Color3.fromRGB(0, 255, 255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        else
            game.Lighting.TimeOfDay = "13:00:00"
            game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
        end
    end
})


-- EXPLOITS

function yesoksussybed()
    if lplr.leaderstats.Bed.Value ~= "✅" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Who ever broke my bed, i have your location", 'All')
    end
end

Tabs["Exploits"]:CreateToggle({
    ["Name"] = "AutoToxic",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        getgenv().autotoxicval = v
        spawn(function()  
            Client:WaitFor("EntityDeathEvent"):andThen(function(p6)
                p6:Connect(function(p7)
                    if p7.fromEntity == lplr.Character then
                        if not getgenv().autotoxicval then return end
                        if getgenv().autotoxicval then
                            local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                            local toxicmessages = {"Hey, "..susplr.Name..", you should really get RektSky, one of the best gaming chairs! thank me later!!", "Dude you're awfull at this game get better "..susplr.Name.."!", susplr.Name.." you don't get it, you nedd to TURN ON kill aura velocity speed and all that stuff you dumb", "well, "..susplr.Name..", that was the LITERAL easiest kill, RektSky got a nice gaming chair", "try harder "..susplr.Name..", you're so bad", "cope "..susplr.Name, "omg guys vbedwar haker!!!11", "get better noob "..susplr.Name, "me when the "..susplr.Name.." is sus", "me when the "..susplr.Name.." is so sussy", "RektSky is just great!", "ez "..susplr.Name, "L "..susplr.Name, "Bow to me noob, slave "..susplr.Name, "rektsky = best", "me when the rektsky", "omg!!11& bedwar haker!111 hE IS HACIGN OMG SOTP HACKING "..susplr.Name}
                            local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                            if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                thirdlast = secondlast
                                secondlast = last
                                last = randomtoxicmessage
                            else
                                local susplr = game.Players:GetPlayerFromCharacter(p7.entityInstance)
                                local toxicmessages = {"Hey, "..susplr.Name..", you should really get RektSky, one of the best gaming chairs! thank me later!!", "Dude you're awfull at this game get better "..susplr.Name.."!", susplr.Name.." you don't get it, you nedd to TURN ON kill aura velocity speed and all that stuff you dumb", "well, "..susplr.Name..", that was the LITERAL easiest kill, RektSky got a nice gaming chair", "try harder "..susplr.Name..", you're so bad", "cope "..susplr.Name, "omg guys vbedwar haker!!!11", "get better noob "..susplr.Name, "me when the "..susplr.Name.." is sus", "me when the "..susplr.Name.." is so sussy", "RektSky is just great!", "ez "..susplr.Name, "L "..susplr.Name, "Bow to me noob, slave "..susplr.Name, "rektsky = best", "me when the rektsky", "omg!!11& bedwar haker!111 hE IS HACIGN OMG SOTP HACKING "..susplr.Name}
                                local randomtoxicmessage = toxicmessages[math.random(1,#toxicmessages)]
                                if last ~= randomtoxicmessage and secondlast ~= randomtoxicmessage and thirdlast ~= randomtoxicmessage then
                                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(randomtoxicmessage, 'All')
                                    thirdlast = secondlast
                                    secondlast = last
                                    last = randomtoxicmessage
                                end
                            end
                        end
                    end
                end)        
            end)
        end)
        spawn(function()
            getgenv().valspeed = v
            if getgenv().valspeed then
                spawn(function()
                    Client:WaitFor("BedwarsBedBreak"):andThen(function(p13)
                        p13:Connect(function(p14)
                            if p14.player.UserId == lplr.UserId then
                                local team = queuemeta[clntstorehandlr:getState().Game.queueType or "bedwars_test"].teams[tonumber(p14.brokenBedTeam.id)]
                                local teamname = team and team.displayName:lower() or "white"
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("yooo cool bed "..teamname.." :)", 'All')
                            end
                        end)
                    end)
                end)
            end
        end)
        spawn(function()
            lplr.leaderstats.Bed:GetPropertyChangedSignal("Value"):Connect(yesoksussybed)
        end)
    end
})

local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
Tabs["Exploits"]:CreateToggle({
    ["Name"] = "BypassShopTiers",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        for i,v in pairs(shopthingyshopshop) do
            v.tiered = nil
            v.nextTier = nil
        end
    end
})

local BalloonController = KnitClient.Controllers.BalloonController
floatdisab = Tabs["Exploits"]:CreateToggle({
    ["Name"] = "FloatDisabler",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        local oldfunc3 = BalloonController.hookBalloon
        local oldfunc4 = BalloonController.enableBalloonPhysics
        local oldfunc5 = BalloonController.deflateBalloon
        BalloonController.inflateBalloon()
        BalloonController.enableBalloonPhysics = function() end
        BalloonController.deflateBalloon = function() end
        BalloonController.hookBalloon = function(Self, plr, attachment, balloon)
            balloon:WaitForChild("Balloon").CFrame = CFrame.new(0, -1995, 0)
            balloon.Balloon:ClearAllChildren()
            local threadidentity = syn and syn.set_thread_identity or setidentity
            threadidentity(7)
            wait(0.5)
            threadidentity(2)
            BalloonController.hookBalloon = oldfunc3
            BalloonController.enableBalloonPhysics = oldfunc4
        end
    end
})

-- PLAYER

Tabs["Player"]:CreateToggle({
    ["Name"] = "NoFall",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if entity.isAlive then
            spawn(function()
                repeat
                    if v == false then return end
                    wait()
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GroundHit:FireServer(workspace.Map.Blocks,1645488277.345853)
                until v == false
            end)
        end
    end
})

local antivoidpart
Tabs["Player"]:CreateToggle({
    ["Name"] = "AntiVoid",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v == true and entity.isAlive then
            local y = Instance.new("Part", Workspace)
            y.Name = "AntiVoid"
            y.Size = Vector3.new(2100, 0.5, 2000)
            y.Position = Vector3.new(160.5, 25, 247.5)
            y.Transparency = 0.4
            y.Anchored = true
            y.Touched:connect(function(z)
                if
                    z.Parent:WaitForChild("Humanoid") and z.Parent.Name == game.Players.LocalPlayer.Name then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                        wait(0.2)
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                        wait(0.2)
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    end
                end
            )
        else
            game.Workspace.AntiVoid:remove()
        end
    end
})

function loot()
    for _,Thing in pairs(game:GetService("Workspace"):GetChildren()) do
        if Thing.Name == "chest" and Thing:FindFirstChild("ChestFolderValue") then
            local mag = (char.PrimaryPart.Position - Thing.Position).Magnitude
            if mag <= 35 then
                for _,Item in pairs(Thing.ChestFolderValue.Value:GetChildren()) do
                    if Item.Name ~= "ChestOwner" then
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["Inventory:ChestGetItem"]:InvokeServer(Thing.ChestFolderValue.Value,Item)
                    end
                end
            end
        end
    end
end

Tabs["Player"]:CreateToggle({
    ["Name"] = "ChestStealer",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if entity.isAlive then
            repeat
                loot()
                wait()
            until v == false
        end
    end
})

-- REKTSKY

local spammer = false
Tabs["Rektsky"]:CreateToggle({
    ["Name"] = "ChatSpammer",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        spammer = v
        if v then
            spawn(function()
                repeat
                    if (not spammer) then return end
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("when the rektsky is sus", 'All')
                    wait(2)
                until (not spammer)
            end)
        end
    end
})



-- WORLD

local yes
local yestwo
local sussyfunnything
Tabs["World"]:CreateToggle({
    ["Name"] = "Scaffold",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v and entity.isAlive then
            spawn(function()
                yestwo = RunService.Heartbeat:Connect(function(step)
                    if not v then return end
                    local SpaceHeld = uis:IsKeyDown(Enum.KeyCode.Space)
                    local y = lplr.Character.HumanoidRootPart.Position.y
                    local x = lplr.Character.HumanoidRootPart.Position.x
                    local z = lplr.Character.HumanoidRootPart.Position.z
                    local blockpos = Vector3.new(math.floor(x / 3 + 1 + lplr.Character.Humanoid.MoveDirection.X), math.floor(y / 3 - 1), math.floor(z / 3 + 1 + lplr.Character.Humanoid.MoveDirection.Z))
                    local blockpostwo = Vector3.new(math.floor(x / 3 + 0.4), math.floor(y / 3 - 1), math.floor(z / 3 + 0.4))
                    local blockpostree = Vector3.new(math.floor(x / 3 + 0.5), math.floor(y / 3 - 1), math.floor(z / 3 + 0.5))
                    if SpaceHeld then
                        sussyfunnything = true
                        if sussyfunnything then
                            game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                        else
                            return
                        end
                        wait(0.1)
                        blockpos = Vector3.new(math.floor(x / 3 + 0.5 + lplr.Character.Humanoid.MoveDirection.X), math.floor(y / 3), math.floor(z / 3 + 0.5 + lplr.Character.Humanoid.MoveDirection.Z))
                        blockpostwo = Vector3.new(math.floor(x / 3 + 0.4), math.floor(y / 3), math.floor(z / 3 + 0.4))
                        blockpostree = Vector3.new(math.floor(x / 3 + 0.5), math.floor(y / 3), math.floor(z / 3 + 0.5))
                    else
                        if not v then return end
                        sussyfunnything = false
                        blockpos = Vector3.new(math.floor(x / 3 + 1 + lplr.Character.Humanoid.MoveDirection.X), math.floor(y / 3 - 1), math.floor(z / 3 + 1 + lplr.Character.Humanoid.MoveDirection.Z))
                        blockpostwo = Vector3.new(math.floor(x / 3 + 0.4), math.floor(y / 3 - 1), math.floor(z / 3 + 0.4))
                        blockpostree = Vector3.new(math.floor(x / 3 + 0.5), math.floor(y / 3 - 1), math.floor(z / 3 + 0.5))
                    end
                    local args = {
                        [1] = {
                            ["position"] = blockpos,
                            ["blockType"] = "wool_"..string.lower(lplr.Team.Name)
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.PlaceBlock:InvokeServer(unpack(args))
                    local argstwo = {
                        [1] = {
                            ["position"] = blockpostwo,
                            ["blockType"] = "wool_"..string.lower(lplr.Team.Name)
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.PlaceBlock:InvokeServer(unpack(argstwo))
                    local argstree = {
                        [1] = {
                            ["position"] = blockpostwo,
                            ["blockType"] = "wool_"..string.lower(lplr.Team.Name)
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.PlaceBlock:InvokeServer(unpack(argstree))
                end)
            end)
        else
            yestwo:Disconnect()
            game.Workspace.Gravity = 196.19999694824
        end
    end
})

Tabs["World"]:CreateToggle({
    ["Name"] = "BedRekter",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        spawn(function()
            repeat
                wait()
                if entity.isAlive then
                    repeat wait() until entity.isAlive
                    wait()
                    local target = getclosebed()
                    if target and entity.isAlive then
                        repeat wait() until entity.isAlive
                        hitblock(target.Position.X ,target.Position.Y + 2 * 3,target.Position.Z)
                        task.wait(0.25)
                        hitblock(target.Position.X ,target.Position.Y + 1 * 3,target.Position.Z)
                        task.wait(0.25)
                        hitblock(target.Position.X,target.Position.Y,target.Position.Z)
                    end
                end
            until (not v)
        end)
    end
})

Tabs["World"]:CreateToggle({
    ["Name"] = "LowGravity",
    ["Keybind"] = nil,
    ["Callback"] = function(v)
        if v == true then
            workspace.Gravity = 10
        else
            workspace.Gravity = 196.19999694824
        end
    end
})
