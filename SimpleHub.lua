--[[
(getgenv()).Config = {
 ["FastAttack"] = true,
 ["ClickAttack"] = true
} 

coroutine.wrap(function()
local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    for v,v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
             for v,v in pairs(debug.getupvalues(v)) do
                if typeof(v) == "table" then
                    spawn(function()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            if getgenv().Config['FastAttack'] then
                                 pcall(function()
                                     v.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                                     v.activeController.attacking = false
                                     v.activeController.increment = 4
                                     v.activeController.blocking = false   
                                     v.activeController.hitboxMagnitude = 150
    		                         v.activeController.humanoid.AutoRotate = true
    	                      	     v.activeController.focusStart = 0
    	                      	     v.activeController.currentAttackTrack = 0
                                     sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                                 end)
                             end
                         end)
                    end)
                end
            end
        end
    end
end)();

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Config['ClickAttack'] then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)
--]]

if game.PlaceId == 2753915549 then
	World1 = true
elseif game.PlaceId == 4442272183 then
	World2 = true
elseif game.PlaceId == 7449423635 then
	World3 = true
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Simple Hub ", HidePremium = false, IntroText = "Simple Hub,Simply Concise", Icon = "rbxassetid://14822183310", SaveConfig = false, ConfigFolder = "ehehhe"})

OrionLib:MakeNotification({
	Name = "Chuc Cac Ban Mot Ngay Tot Lanh",
	Content = "Wishing You A Good Day",
	Image = "rbxassetid://14822183310",
	Time = 5
})

local ATab = Window:MakeTab({
	Name = "About",
	Icon = "rbxassetid://14822183310",
	PremiumOnly = false
})

local Section = ATab:AddSection({
	Name = "About Simple Hub"
})


ATab:AddLabel("Scripter : TSadBoi")

ATab:AddLabel("Discord : 🚫")

ATab:AddLabel("Youtube : 🚫")

ATab:AddLabel("Main Script : 🚫")


local MTab = Window:MakeTab({
	Name = "Fast Atk Setting",
	Icon = "rbxassetid://14822183310",
	PremiumOnly = false
})

MTab:AddToggle({
	Name = "Fast Attack [Normal]",
	Default = false,
	Callback = function(Value)
		_G.Normal_Attack = Value
	end    
})

require(game.ReplicatedStorage.Util.CameraShaker):Stop()

xShadowFastAttackx = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

xShadowx = debug.getupvalues(xShadowFastAttackx)[2]

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.Normal_Attack then
            if typeof(xShadowx) == "table" then
                pcall(function()
                    xShadowx.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
                    xShadowx.activeController.timeToNextAttack = 0
                    xShadowx.activeController.hitboxMagnitude = 200
                xShadowx.activeController.active = false
                    xShadowx.activeController.timeToNextBlock = 0
                    xShadowx.activeController.focusStart = 0
                    xShadowx.activeController.increment = 4
                    xShadowx.activeController.blocking = false
                    xShadowx.activeController.attacking = false
                    xShadowx.activeController.humanoid.AutoRotate = 50
                end)
            end
        end
    end)
end)
               

MTab:AddToggle({
	Name = "Fast Attack [Fast]",
	Default = true,
	Callback = function(Value)
		_G.Fast_Attack = Value
	end    
})

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()
coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Fast_Attack then
        if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
            getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack = 0
            getupvalues(CombatFramework)[2]['activeController'].hitboxMagnitude = 25
            getupvalues(CombatFramework)[2]['activeController']:attack()
        end
        end
    end)
end)()

MTab:AddToggle({
	Name = "Fast Attack [Super Fast]",
	Default = false,
	Callback = function(Value)
		_G.Super_Attack = Value
	end    
})
if _G.Super_Attack then
  pcall(function()
local SuperFastMode = false -- Change to true if you want Super Super Super Fast attack (Like instant kill) but it will make the game kick you more than normal mode

local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
      
local cac
if SuperFastMode then 
	cac=task.wait
else
	cac=wait
end
while cac() do 
	AttackNoCD()
  end
end)
  end

MTab:AddToggle({
	Name = "Fast Attack [God]",
	Default = false,
	Callback = function(Value)
		_G.God_Attack = Value
	end    
})

if _G.God_Attack then
  pcall(function()
  local SuperFastMode = true -- Change to true if you want Super Super Super Fast attack (Like instant kill) but it will make the game kick you more than normal mode

local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
local cac
if SuperFastMode then 
	cac=task.wait
else
	cac=wait
end
while cac() do 
	AttackNoCD()
  end
end)
end

local FTab = Window:MakeTab({
	Name = "Farming [Beta]",
	Icon = "rbxassetid://14822183310",
	PremiumOnly = false
})

function topos(Pos)
        Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
        pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/210, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
        tween:Play()
        if Distance <= 250 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
end
function GetDistance(target)
        return math.floor((target.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    end


function StopTween(target)
	if not target then
		_G.StopTween = true
		wait()
		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		wait()
		if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
		end
		_G.StopTween = false
		_G.Clip = false
	end
end
function hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
  end
    local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                           table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
  end     
function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	local File = pcall(function()
		AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
	end)
	if not File then
		table.insert(AllIDs, actualHour)
		writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = t
				SaveSetting()ostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
      for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								delfile("NotSameServers.json")
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
        end
        num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(1)
				end
			end
		end
end

function Click()
  spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
          pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end)
    end)
end
  
spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
		  	if _G.Auto_Farm_Level or _G.Auto_New_World or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.TeleportIsland or _G.Auto_Farm_Boss or _G.Autotushita or _G.Auto_Elite_Hunter or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.Auto_Rengoku or _G.Auto_Farm_Radioactive or _G.Auto_Farm_Vampire_Fang or _G.Auto_Farm_Mystic_Droplet or _G.Auto_Farm_GunPowder or 
              _G.Auto_Soul_Reaper or _G.Auto_Farm_Fish_Tail or _G.Auto_Farm_Mini_Tusk or _G.Auto_Farm_Magma_Ore or _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.d or _G.Auto_Twin_Hook or _G.Auto_Serpent_Bow or _G.AutoFarmMaterial or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.Auto_Next_Island or _G.autoraid or AutoNextIsland or _G.Auto_Farm_Sword or _G.MeleeFarm or _G.AutoFarmSelectMonster or _G.AutoFarmKenHakivor or _G.AutoObservationHakiV2 or _G.GunMastery or _G.AutoFactory or _G.Mastery or _G.Auto_Kill_Law then
              if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					local Noclip = Instance.new("BodyVelocity")
					Noclip.Name = "BodyClip"
					Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
					Noclip.MaxForce = Vector3.new(100000,100000,100000)
					Noclip.Velocity = Vector3.new(0,0,0)
			 	end
		  	else	
			 	if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
					game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
			 	end
		  	end
		end)
	end)
end)

spawn(function()
	pcall(function()
		game:GetService("RunService").Stepped:Connect(function()
			if _G.Auto_Farm_Level or _G.Auto_New_World or _G.TeleportIsland or _G.Auto_Third_World or _G.Auto_Farm_Chest or _G.Auto_Farm_Boss or _G.GunMastery or _G.Mastery or _G.AutoFarmFruitMastery or _G.AutoFarmGunMastery or _G.Auto_Elite_Hunter or _G.AutoFarmKenHaki or _G.AutoFactory or _G.AutoFarmSelectMonster or _G.Auto_Cake_Prince or _G.Auto_Farm_All_Boss or _G.Auto_Saber or _G.Auto_Pole or _G.Auto_Farm_Scrap_and_Leather or _G.Auto_Farm_Angel_Wing or _G.Auto_Factory_Farm or _G.Auto_Farm_Ectoplasm or _G.Auto_Bartilo_Quest or _G.d or _G.Auto_Rengoku or _G.Autotushita or _G.Auto_Farm_Radioactive or 
 _G.Auto_Farm_Bone or _G.Auto_Farm_Conjured_Cocoa or _G.Auto_Open_Dough_Dungeon or _G.Auto_Rainbow_Haki or _G.Auto_Musketeer_Hat or _G.Auto_Holy_Torch or _G.Auto_Canvander or _G.AutoFarmMaterial or _G.autoraid or _G.Auto_Twin_Hook or AutoNextIsland or _G.Auto_Serpent_Bow or _G.Auto_Fully_Death_Step or _G.Auto_Fully_SharkMan_Karate or _G.Teleport_to_Player or _G.Auto_Kill_Player_Melee or _G.Auto_Kill_Player_Gun or _G.Start_Tween_Island or _G.AutoObservationHakiV2 or _G.d or _G.Auto_Next_Island or _G.Auto_Farm_Sword or _G.MeleeFarm or _G.Auto_Kill_Law then
				for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false    
					end
				end
			end
		end)
	end)
end)

spawn(function()
	while wait() do
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
			if v:IsA("Tool") then
				if v:FindFirstChild("RemoteFunctionShoot") then 
					SelectToolWeaponGun = v.Name
				end
			end
		end
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
			if v:IsA("Tool") then
				if v:FindFirstChild("RemoteFunctionShoot") then 
					SelectToolWeaponGun = v.Name
				end
			end
		end
	end
end)

function CheckQuest() 
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
  if World3 then
    if MyLevel == 1975 or MyLevel <= 1999 or _G.Select_Mob_Farm == "Reborn Skeleton [Lv. 1975]" then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
			SPAWNPOINT = "HauntedCastle"
		elseif MyLevel == 2000 or MyLevel <= 2024 or _G.Select_Mob_Farm == "Living Zombie [Lv. 2000]" then
			Ms = "Living Zombie [Lv. 2000]"
      NameQuest = "HauntedQuest1"
			LevelQuest = 2
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-10093.930664063, 237.38233947754, 6180.5654296875)
			SPAWNPOINT = "HauntedCastle"
		elseif MyLevel == 2025 or MyLevel <= 2049 or _G.Select_Mob_Farm == "Demonic Soul [Lv. 2025]" then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
			CFrameMon = CFrame.new(-9466.72949, 171.162918, 6132.01514)
			SPAWNPOINT = "HauntedCastle"
		elseif MyLevel == 2050 or MyLevel <= 2074 or _G.Select_Mob_Farm == "Posessed Mummy [Lv. 2050]" then
			Ms = "Posessed Mummy [Lv. 2050]" 
			NameQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
			CFrameMon = CFrame.new(-9589.93848, 4.85058546, 6190.27197)
			SPAWNPOINT = "HauntedCastle"
  elseif MyLevel == 2100 or MyLevel <= 2124 or _G.Select_Mob_Farm == "Peanut President [Lv. 2100]" then
            Ms = "Peanut President [Lv. 2100]"
            NameQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2103.9375, 38.139019012451, -10192.702148438)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
			SPAWNPOINT = "Peanut"
		elseif MyLevel == 2125 or MyLevel <= 2149 or _G.Select_Mob_Farm == "Ice Cream Chef [Lv. 2125]" then
            Ms = "Ice Cream Chef [Lv. 2125]"
    NameQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			SPAWNPOINT = "IceCream"
		elseif MyLevel == 2150 or MyLevel <= 2199 or _G.Select_Mob_Farm == "Ice Cream Commander [Lv. 2150]" then
            Ms = "Ice Cream Commander [Lv. 2150]"
            NameQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			SPAWNPOINT = "IceCream"
		elseif MyLevel == 2200 or MyLevel <= 2224 or _G.Select_Mob_Farm == "Cookie Crafter [Lv. 2200]" then
            Ms = "Cookie Crafter [Lv. 2200]"
    NameQuest = "CakeQuest1"
            LevelQuest = 1
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
            CFrameMon = CFrame.new(-2273.00244140625, 90.22590637207031, -12151.62109375)
			SPAWNPOINT = "Loaf"
		elseif MyLevel == 2225 or MyLevel <= 2249 or _G.Select_Mob_Farm == "Cake Guard [Lv. 2225]" then
            Ms = "Cake Guard [Lv. 2225]"
            NameQuest = "CakeQuest1"
            LevelQuest = 2
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
            CFrameMon = CFrame.new(-1442.373046875, 158.14111328125, -12277.37109375)
			SPAWNPOINT = "Loaf"
    elseif MyLevel == 2225 or MyLevel <= 2249 or _G.Select_Mob_Farm == "Cake Guard [Lv. 2225]" then
            Ms = "Cake Guard [Lv. 2225]"
            NameQuest = "CakeQuest1"
            LevelQuest = 2
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
            CFrameMon = CFrame.new(-1442.373046875, 158.14111328125, -12277.37109375)
			SPAWNPOINT = "Loaf"
		elseif MyLevel == 2250 or MyLevel <= 2274 or _G.Select_Mob_Farm == "Baking Staff [Lv. 2250]" then
            Ms = "Baking Staff [Lv. 2250]"
            NameQuest = "CakeQuest2"
            LevelQuest = 1
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
            CFrameMon = CFrame.new(-1837.2803955078125, 129.0594482421875, -12934.5498046875)
			SPAWNPOINT = "Loaf"
    elseif MyLevel == 2275 or MyLevel <= 2299 or _G.Select_Mob_Farm == "Head Baker [Lv. 2275]" then
            Ms = "Head Baker [Lv. 2275]"
            NameQuest = "CakeQuest2"
            LevelQuest = 2
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
            CFrameMon = CFrame.new(-2203.302490234375, 109.90937042236328, -12788.7333984375)
			SPAWNPOINT = "Loaf"
		elseif MyLevel == 2300 or MyLevel <= 2324 or _G.Select_Mob_Farm == "Cocoa Warrior [Lv. 2300]" then
            Ms = "Cocoa Warrior [Lv. 2300]"
            NameQuest = "ChocQuest1"
            LevelQuest = 1
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
            CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
			SPAWNPOINT = "Chocolate"
    elseif MyLevel == 2325 or MyLevel <= 2349 or _G.Select_Mob_Farm == "Chocolate Bar Battler [Lv. 2325]" then
            Ms = "Chocolate Bar Battler [Lv. 2325]"
            NameQuest = "ChocQuest1"
            LevelQuest = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
            CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
			SPAWNPOINT = "Chocolate"
		elseif MyLevel == 2350 or MyLevel <= 2374 or _G.Select_Mob_Farm == "Sweet Thief [Lv. 2350]" then
            Ms = "Sweet Thief [Lv. 2350]"
            NameQuest = "ChocQuest2"
            LevelQuest = 1
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
            CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
			SPAWNPOINT = "Chocolate"
    elseif MyLevel == 2375 or MyLevel <= 2400 or _G.Select_Mob_Farm == "Candy Rebel [Lv. 2375]" then
            Ms = "Candy Rebel [Lv. 2375]"
            NameQuest = "ChocQuest2"
            LevelQuest = 2
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
            CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
			SPAWNPOINT = "Chocolate"
			elseif MyLevel == 2400 or MyLevel <= 2425 or _G.Select_Mob_Farm == "Candy Pirate [Lv. 2400]" then
			Ms = "Candy Pirate [Lv. 2400]"
            NameQuest = "CandyQuest1"
            LevelQuest = 1
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1151.48987, 16.1422901, -14445.6904, -0.316594511, -6.85698254e-08, -0.948560953, -2.05343067e-08, 1, -6.54346692e-08, 0.948560953, -1.23821675e-09, -0.316594511)
            CFrameMon = CFrame.new(-1408.46521, 16.1423531, -14552.2041, 0.90175873, -8.17216943e-08, -0.432239741, 7.81264475e-08, 1, -2.60746162e-08, 0.432239741, -1.02563433e-08, 0.90175873)
			SPAWNPOINT = "Chocolate"
    elseif MyLevel >= 2425 or _G.Select_Mob_Farm == "Snow Demon [Lv. 2425]" then
			Ms = "Snow Demon [Lv. 2425]"
            NameQuest = "CandyQuest1"
            LevelQuest = 2
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1151.48987, 16.1422901, -14445.6904, -0.316594511, -6.85698254e-08, -0.948560953, -2.05343067e-08, 1, -6.54346692e-08, 0.948560953, -1.23821675e-09, -0.316594511)
            CFrameMon = CFrame.new(-777.070862, 23.5809536, -14453.0078, 0.33384338, 0, -0.942628562, 0, 1, 0, 0.942628562, 0, 0.33384338)
			SPAWNPOINT = "Chocolate"
		end
    end
end
---enddddddddddd
function checkselect()
local MyLevel = game.Players.LocalPlayer.Data.Level.Value
  if World3 then
      if MyLevel == 1975 or MyLevel <= 1999 or SelectMonster == "Reborn Skeleton [Lv. 1975]" then
			Mon = "Reborn Skeleton [Lv. 1975]"
			--NameQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMon = "Reborn Skeleton"
			--CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-8761.3154296875, 164.85829162598, 6161.1567382813)
			--Spawn = "HauntedCastle"
		elseif MyLevel == 2000 or MyLevel <= 2024 or SelectMonster == "Living Zombie [Lv. 2000]" then
			Mon = "Living Zombie [Lv. 2000]"
        LevelQuest = 2
			NameMon = "Living Zombie"
			--CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-10093.930664063, 237.38233947754, 6180.5654296875)
			--Spawn = "HauntedCastle"
		elseif MyLevel == 2025 or MyLevel <= 2049 or SelectMonster == "Demonic Soul [Lv. 2025]" then
			Mon = "Demonic Soul [Lv. 2025]"
			--NameQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMon = "Demonic Soul"
			--CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
        CFrameMon = CFrame.new(-9466.72949, 171.162918, 6132.01514)
			--Spawn = "HauntedCastle"
		elseif MyLevel == 2050 or MyLevel <= 2074 or SelectMonster == "Posessed Mummy [Lv. 2050]" then
			Mon = "Posessed Mummy [Lv. 2050]" 
			--NameQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMon = "Posessed Mummy"
			--CFrameQuest = CFrame.new(-9514.78027, 171.162918, 6078.82373, 0.301918149, 7.4535027e-09, 0.953333855, -3.22802141e-09, 1, -6.79604995e-09, -0.953333855, -1.02553133e-09, 0.301918149)
			CFrameMon = CFrame.new(-9589.93848, 4.85058546, 6190.27197)
    elseif MyLevel == 2100 or MyLevel <= 2124 or SelectMonster == "Peanut President [Lv. 2100]" then
            Mon = "Peanut President [Lv. 2100]"
            --NameQuest = "NutsIslandQuest"
            LevelQuest = 2
            NameMon = "Peanut President"
            --CFrameQuest = CFrame.new(-2103.9375, 38.139019012451, -10192.702148438)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
			--Spawn = "Peanut"
		elseif MyLevel == 2125 or MyLevel <= 2149 or SelectMonster == "Ice Cream Chef [Lv. 2125]" then
            Mon = "Ice Cream Chef [Lv. 2125]"
    --NameQuest = "IceCreamIslandQuest"
            LevelQuest = 1
            NameMon = "Ice Cream Chef"
            --CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			--Spawn = "IceCream"
		elseif MyLevel == 2150 or MyLevel <= 2199 or SelectMonster == "Ice Cream Commander [Lv. 2150]" then
            Mon = "Ice Cream Commander [Lv. 2150]"
            --NameQuest = "IceCreamIslandQuest"
            LevelQuest = 2
            NameMon = "Ice Cream Commander"
    --CFrameQuest = CFrame.new(-819.84533691406, 65.845329284668, -10965.487304688)
            CFrameMon = CFrame.new(-890.55895996094, 186.34135437012, -11127.306640625)
			--Spawn = "IceCream"
		elseif MyLevel == 2200 or MyLevel <= 2224 or SelectMonster == "Cookie Crafter [Lv. 2200]" then
            Mon = "Cookie Crafter [Lv. 2200]"
            --NameQuest = "CakeQuest1"
            LevelQuest = 1
            NameMon = "Cookie Crafter"
            --CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
            CFrameMon = CFrame.new(-2273.00244140625, 90.22590637207031, -12151.62109375)
			--Spawn = "Loaf"
		elseif MyLevel == 2225 or MyLevel <= 2249 or SelectMonster == "Cake Guard [Lv. 2225]" then
    Mon = "Cake Guard [Lv. 2225]"
        print("half")
            --NameQuest = "CakeQuest1"
            LevelQuest = 2
            NameMon = "Cake Guard"
            --CFrameQuest = CFrame.new(-2021.5509033203125, 37.798221588134766, -12028.103515625)
            CFrameMon = CFrame.new(-1442.373046875, 158.14111328125, -12277.37109375)
			--Spawn = "Loaf"
		elseif MyLevel == 2250 or MyLevel <= 2274 or SelectMonster == "Baking Staff [Lv. 2250]" then
            Mon = "Baking Staff [Lv. 2250]"
            --NameQuest = "CakeQuest2"
            LevelQuest = 1
            NameMon = "Baking Staff"
            --CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
            CFrameMon = CFrame.new(-1837.2803955078125, 129.0594482421875, -12934.5498046875)
    elseif MyLevel == 2275 or MyLevel <= 2299 or SelectMonster == "Head Baker [Lv. 2275]" then
            Mon = "Head Baker [Lv. 2275]"
            --NameQuest = "CakeQuest2"
            LevelQuest = 2
            NameMon = "Head Baker"
            --CFrameQuest = CFrame.new(-1927.9107666015625, 37.79813003540039, -12843.78515625)
            CFrameMon = CFrame.new(-2203.302490234375, 109.90937042236328, -12788.7333984375)
			--Spawn = "Loaf"
		elseif MyLevel == 2300 or MyLevel <= 2324 or SelectMonster == "Cocoa Warrior [Lv. 2300]" then
            Mon = "Cocoa Warrior [Lv. 2300]"
            --NameQuest = "ChocQuest1"
            LevelQuest = 1
            NameMon = "Cocoa Warrior"
            --CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
            CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
			--Spawn = "Chocolate"
    elseif MyLevel == 2325 or MyLevel <= 2349 or SelectMonster == "Chocolate Bar Battler [Lv. 2325]" then
            Mon = "Chocolate Bar Battler [Lv. 2325]"
            --NameQuest = "ChocQuest1"
            LevelQuest = 2
            NameMon = "Chocolate Bar Battler"
            --CFrameQuest = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
            CFrameMon = CFrame.new(231.13571166992188, 24.734268188476562, -12195.1162109375)
			--Spawn = "Chocolate"
		elseif MyLevel == 2350 or MyLevel <= 2374 or SelectMonster == "Sweet Thief [Lv. 2350]" then
            Mon = "Sweet Thief [Lv. 2350]"
            --NameQuest = "ChocQuest2"
            LevelQuest = 1
            NameMon = "Sweet Thief"
            --CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
            CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
			--Spawn = "Chocolate"
    elseif MyLevel == 2375 or MyLevel <= 2400 or SelectMonster == "Candy Rebel [Lv. 2375]" then
            Mon = "Candy Rebel [Lv. 2375]"
            --NameQuest = "ChocQuest2"
            LevelQuest = 2
            NameMon = "Candy Rebel"
            --CFrameQuest = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
            CFrameMon = CFrame.new(147.52256774902344, 24.793832778930664, -12775.3583984375)
			--Spawn = "Chocolate"
elseif MyLevel == 2400 or MyLevel <= 2424 or SelectMonster == "Candy Pirate [Lv. 2400]" then

            Mon = "Candy Pirate [Lv. 2400]"
            QuestName = "CandyQuest1"

            LevelQuest = 1
            NameMon = "Candy Pirate"

            CFrameMon = CFrame.new(-1476, 52, -14638)
            VectorMon = Vector3.new(-1476, 52, -14638)
    CFrameQuest = CFrame.new(-1149, 13, -14445)
            VectorQuest = Vector3.new(-1149, 13, -14445)
        elseif MyLevel >= 2425 or SelectMonster == "Snow Demon [Lv. 2425]" then


            Mon = "Snow Demon [Lv. 2425]"
            QuestName = "CandyQuest1"

            LevelQuest = 2
            NameMon = "Snow Demon"
            
            CFrameMon = CFrame.new(-948, 62, -14551)
            VectorMon = CFrame.new(-948, 62, -14551)

            CFrameQuest = CFrame.new(-1149, 13, -14445)
            VectorQuest = Vector3.new(-1149, 13, -14445)
		end
    end
end


function AutoHaki()
	if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
	end
end
 
function EquipWeapon(ToolSe)
	if not _G.NotAutoEquip then
		if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
			Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.1)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
		end
	end
end

WeaponList = {}

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if v:IsA("Tool") then
table.insert(WeaponList ,v.Name)
end
end

local SelectWeapona = FTab:AddDropdown({
	Name = "Please Choose Your Weapon To Farm",
	Default = "",
	Options = WeaponList,
	Callback = function(Value)
		_G.Select_Weapon = Value
	end    
})

FTab:AddButton({
	Name = "Refresh Weapon",
	Callback = function()
      		SelectWeapona:Refresh(WeaponList,true)
  	end    
})

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.click then
             pcall(function()
                game:GetService'VirtualUser':CaptureController()
			    game:GetService'VirtualUser':Button1Down(Vector2.new(0,1,0,1))
            end)
        end
    end)
end)

FTab:AddButton({
	Name = "Stop Tween",
	Callback = function()
      		topos(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
  _G.Clip = false
  	end    
})

local Section = FTab:AddSection({
	Name = "Farm"
})

FTab:AddDropdown({
	Name = "Please Choose Your Mode To Farm",
	Default = "",
	Options = {"Level Farm","Fast Mode","No Quest","Near Farm Mode"},
	Callback = function(Value)
		_G.Select_Mode_Farm = Value
	end    
})

FTab:AddToggle({
	Name = "Start Auto Farm [2100-2425]",
	Default = false,
	Callback = function(Value)
		_G.Auto_Farm_Level = Value
 StopTween(_G.Auto_Farm_Level)
	end    
})



function EquipWeaponSword()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end


function EquipWeaponMelee()
	pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Melee" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
			end
		end
	end)
end

function BypassTP()
local tpspeed = 100
    local who = game.Players.LocalPlayer.Character.HumanoidRootPart 
    local pos  = game.Players.LocalPlayer.Character.HumanoidRootPart --put your part you want to teleport to here
    local twn = TweenService:Create(who, TweenInfo.new((pos - who.Position).Magnitude / tpspeed, Enum.EasingStyle.Linear), {CFrame = CFrame.new(pos)})
    twn:Play()
    twn.Completed:Wait()
end

function TP2(P1)
                    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if Distance < 150 then
                        Speed = 20000
                    elseif Distance < 200 then
                        Speed = 5000
                    elseif Distance < 300 then
                        Speed = 1030
                    elseif Distance < 500 then
                        Speed = 725
                    elseif Distance < 1000 then
                        Speed = 365
                    elseif Distance >= 1000 then
                        Speed = 365
                    end
                    game:GetService("TweenService"):Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                        {CFrame = P1}
                    ):Play()
                    if _G.Stop_Tween==true then
                        game:GetService("TweenService"):Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                            {CFrame = P1}
                        ):Cancel()
                    end
                    _G.Clip = true
                    wait(Distance/Speed)
                    _G.Clip = false
                end


spawn(function()
    while wait() do
        if _G.Auto_Farm_Level then
			if _G.Select_Mode_Farm == "Level Farm" then
				pcall(function()
					if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
						StartMagnet = false
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                if TP2 then
                   if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 2000 then
                    TP2(CFrameQuest)
              elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 2000 then
    topos(CFrameQuest)
                  end
                else
                  topos(CFrameQuest)
                end
              if (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
                end

                 elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
 for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                   if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
 if v.Name == Ms then
                      repeat game:GetService("RunService").Heartbeat:wait()
                      EquipWeapon(_G.Select_Weapon)
                        topos(v.HumanoidRootPart.CFrame * MethodFarm)
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
 v.HumanoidRootPart.Transparency = 1
 v.Humanoid.JumpPower = 0
 v.Humanoid.WalkSpeed = 0
 v.HumanoidRootPart.CanCollide = false
v.Humanoid:ChangeState(11)
v.Humanoid:ChangeState(14)
 FarmPos = v.HumanoidRootPart.CFrame
 MonFarm = v.Name
 Click()
                        if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
 v.Humanoid.Animator:Destroy()
                        end
                        until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                    end
                  end
                end
                topos(CFrameMon)
                 for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
 if string.find(v.Name,NameMon) then
 if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
 topos(v.CFrame * MethodFarm)
 topos(CFrameMon)
 end
 end
 end
 end
 end)
          elseif _G.Select_Mode_Farm == "No Quest" then
pcall(function()
              if TP2 then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude > 2000 then
 BTP(CFrameMon)
 wait(3)
 elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameMon.Position).Magnitude < 2000 then
 topos(CFrameMon)
                  end
 else
   Tween(CFrameMon)
              end
              						CheckQuest()
              if game.Workspace.Enemies:FindFirstChild(Ms) then
 for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
 if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
 if v.Name == Ms then
                      repeat game:GetService("RunService").Heartbeat:wait()
                        EquipWeapon(_G.Select_Weapon)
                        topos(v.HumanoidRootPart.CFrame * Farm_Mode)
 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
 v.HumanoidRootPart.Transparency = 1
 v.Humanoid.JumpPower = 0
 v.Humanoid.WalkSpeed = 0
 v.HumanoidRootPart.CanCollide = false
v.Humanoid:ChangeState(11)
v.Humanoid:ChangeState(14)
 FarmPos = v.HumanoidRootPart.CFrame
 MonFarm = v.Name
 Click()
                         if v.Humanoid.Health <= 0 and v.Humanoid:FindFirstChild("Animator") then
 v.Humanoid.Animator:Destroy()
 end
 until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
 end
                  end
                  end
 else
   for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
 if string.find(v.Name, NameMon) then
 if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude >= 10 then
 topos(v.CFrame * MethodFarm)
 end
 end
 end
 end
 end)
          elseif _G.Select_Mode_Farm == "Near Farm Mode" then
pcall(function()
 for i,v in pairs (game.Workspace.Enemies:GetChildren()) do
 if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
 if v.Name then
 if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 1000 then
 repeat task.wait(0.0001)
                        EquipWeapon(_G.Select_Weapon)
                        Tween(v.HumanoidRootPart.CFrame * CFrame.new(X, Y, Z))
                          print("c")
 v.HumanoidRootPart.Size = Vector3.new(60,60,60)
 v.HumanoidRootPart.Transparency = 1
 v.Humanoid.JumpPower = 0
 v.Humanoid.WalkSpeed = 0
 v.HumanoidRootPart.CanCollide = false
v.Humanoid:ChangeState(11)
v.Humanoid:ChangeState(14)
 FarmPos = v.HumanoidRootPart.CFrame
 MonFarm = v.Name
 Click()
 until not _G.Auto_Farm_Level or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
                    end
                    end
 end
 end
 end)
end
end
end
end)
				
    

local Section = FTab:AddSection({
	Name = "Bones"
})

FTab:AddToggle({
	Name = "Auto Farm Bones",
	Default = false,
	Callback = function(Value)
		_G.Auto_Farm_Bone = Value
 StopTween(_G.Auto_Farm_Bone)
	end    
})
FTab:AddToggle({
	Name = "Auto Trade Bones",
	Default = false,
	Callback = function(Value)
		_G.Auto_Trade_Bone = Value
    end
})

spawn(function()
 while wait(.1) do
 if _G.Auto_Trade_Bone then
 local args = {
  [1] = "Bones",
  [2] = "Buy",
  [3] = 1,
  [4] = 1
 }

 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 end
 end
 end)

FTab:AddButton({
	Name = "Check Bones!",
	Callback = function()
local Section = FTab:AddSection({
	Name = "Bones : "..(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Check"))""
        })
    end
  })

spawn(function()
 game:GetService("RunService").Heartbeat:Connect(function()
  pcall(function()
   for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   if _G.Auto_Farm_Bone and StartMagnetBoneMon and (v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]") and (v.HumanoidRootPart.Position - PosMonBone.Position).magnitude <= 350 then
   v.HumanoidRootPart.CFrame = PosMonBone
   v.HumanoidRootPart.CanCollide = false
   v.HumanoidRootPart.Size = Vector3.new(50,50,50)
   if v.Humanoid:FindFirstChild("Animator") then
   v.Humanoid.Animator:Destroy()
   end
   sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
   end
   end
   end)
  end)
 end)

spawn(function()
 while wait() do
 if _G.Auto_Farm_Bone and World3 then
 pcall(function()
  if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
  for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
  if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
  if v.Humanoid.Health > 0 then
  repeat wait()
  AutoHaki()
                      EquipWeapon(_G.Select_Weapon)
  StartMagnetBoneMon = true
  v.HumanoidRootPart.CanCollide = false
                        print("b")
  v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
  PosMonBone = v.HumanoidRootPart.CFrame
  topos(PosMonBone)
  game:GetService'VirtualUser':CaptureController()
  game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
  until _G.Auto_Farm_Bone == false or not v.Parent or v.Humanoid.Health <= 0
  end
  end
              end
              else
   StartMagnetBoneMon = false
  for i,v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
  if v.Name == "Reborn Skeleton [Lv. 1975]" then
  topos(v.HumanoidRootPart.CFrame)
  elseif v.Name == "Living Zombie [Lv. 2000]" then
  topos(v.HumanoidRootPart.CFrame)
  elseif v.Name == "Demonic Soul [Lv. 2025]" then
  topos(v.HumanoidRootPart.CFrame * MethodFarm)
                    print("a")
  elseif v.Name == "Posessed Mummy [Lv. 2050]" then
  topos(v.HumanoidRootPart.CFrame * MethodFarm)
  end
  end
  topos(CFrame.new(-9466.72949, 171.162918, 6132.01514))
  end
  end)
 end
 end
 end)

local STab = Window:MakeTab({
	Name = "Setting",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = STab:AddSection({
	Name = "Chu Script Da Thanh Sad Boi"
})

STab:AddButton({
	Name = "If u like this script click here!!!",
	Callback = function()
      		setclipboard("dumamay")
  	end    
})

local Section = STab:AddSection({
	Name = "Setting"
})

STab:AddToggle({
	Name = "Auto Set Spawn",
	Default = false,
	Callback = function(Value)
		_G.AutoSetSpawn = Value
	end    
})

spawn(function()
 pcall(function()
  while wait() do
  if _G.AutoSetSpawn then
  if game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
  end
  end
  end
  end)
 end)

local Section = STab:AddSection({
	Name = "Do not choose method farm default is upper"
})
STab:AddDropdown({
	Name = "Choose Method Farm",
	Default = "Upper",
	Options = {"Behind", "Below", "Upper"},
	Callback = function(Value)
_G.Method = Value
	end    
})

spawn(function()
 while wait() do
 pcall(function()
  if _G.Method == "Upper" then
MethodFarm = CFrame.new(0,_G.DistanceMob,0) * CFrame.Angles(math.rad(-90),0,0)
  else
   MethodFarm = CFrame.new(0,_G.DistanceMob,0)
  end
  end)
    end
  end)

STab:AddToggle({
	Name = "Bring Mobs [Normal]",
	Default = true,
	Callback = function(Value)
		_G.BringNormal = Value
	end    
})

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
		pcall(function()
			if _G.BringNormal then
				for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.Auto_Farm_Level and StartMagnet and v.Name == Ms and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 350 then
						v.HumanoidRootPart.CFrame = PosMon
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(50,50,50)
						if v.Humanoid:FindFirstChild("Animator") then
                    v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
					end
				end
			end
		end)
    end)
	end)


STab:AddToggle({
	Name = "Bring Mobs [Extra + Lag]",
	Default = false,
	Callback = function(Value)
		_G.BringExtra = Value
	end    
})

spawn(function()
 game:GetService("RunService").Heartbeat:Connect(function() CheckQuest()
  pcall(function()
   if _G.BringExtra then
   for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
   if _G.Auto_Farm_Level and StartMagnet and v.Name ~= "Ice Admiral [Lv. 700] [Boss]" and v.Name ~= "Don Swan [Lv. 3000] [Boss]" and v.Name ~= "Saber Expert [Lv. 200] [Boss]" and v.Name ~= "Longma [Lv. 2000] [Boss]" and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 350 then
   v.HumanoidRootPart.CFrame = PosMon
   v.HumanoidRootPart.CanCollide = false
   v.HumanoidRootPart.Size = Vector3.new(60,60,60)
   if v.Humanoid:FindFirstChild("Animator") then
   v.Humanoid.Animator:Destroy()
   end
   sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
   end
   end
   end
   end)
   end)
end)

local Section = STab:AddSection({
	Name = "Mastery Setting"
})

STab:AddLabel("Wait For update")

OrionLib:Init()





