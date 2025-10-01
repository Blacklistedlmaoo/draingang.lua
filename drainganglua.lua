
if not game:IsLoaded() then game.Loaded:Wait() end

local players = game:GetService("Players")
local LocalPlayer = players.LocalPlayer

local playerChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local run = game:GetService("RunService")
local RunService = cloneref(run)

local p4 = workspace.CurrentCamera
local camera = cloneref(p4)

local p5 = game:GetService("ReplicatedStorage")
local ReplicatedStorage = cloneref(p5)


local Misc = Instance.new("Folder")
Misc.Parent = ReplicatedStorage
Misc.Name = "Draingang.lua"



local draingangAssets = makefolder("Draingang.lua")
local HitSound




local hitEvent = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("ProjectileInflict")
local meleehitEvent = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("MeleeInflict")





local NameESP = false
local BoxESP = false
local HealthBarESP = false
local ChamsESP = false
local DistanceESP = false



local NameConnection
local DistanceConnection
local CornerConnection
local StatusConnection
local SkeletonConnection
local DestroyNameText
local DestroyChams
local ResetChams
local Status




local HitNoti = false
local HitSounds = false




local HitSounds = {
    randy = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/niggers_string.txt"),
    rust = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/RustHeadshot.txt"),
    jewlxx = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/jewellxx.txt"),
    mk = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/fatality.txt"),
    hentai = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/cb-base64-string.txt"),
    Error = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/cb-base64-string__1_.txt"),
    pluh = game:HttpGet("https://gitlab.com/jaydenmyers215/sigma-hook-assets/-/raw/main/cb-base64-string__2_.txt"),

}


local SoundTest = function(file)
   local sound = Instance.new("Sound")
   sound.Parent = workspace
   sound.SoundId = file
   sound.Volume = 1
   sound:Play()

   task.wait(2)
   sound:Destroy()
end





local espSettings = {
    Name = {
        Center = true,
        Size = math.ceil(13),
        Color = Color3.fromRGB(255, 255, 255),
        Font = Drawing.Fonts.Plex


    };

    Distance = {
        Center = true,
        Size = math.ceil(13),
        Color = Color3.fromRGB(255, 255, 255),
        Font = Drawing.Fonts.Plex


    };

    Box = {
        Center = true,
        Color = Color3.fromRGB(255, 255, 255),

    };

    Skeleton = {
        Visible = true,
        Color = Color3.fromRGB(255, 255, 255),


    };

    Chams = {
        Color = Color3.fromRGB(255, 255, 255)



    }

}




local CreateNameESP = function(player, char, adornee, hum, hrp, pos, TextPos, onScreen, textHeight)
    char = player.Character or player.CharacterAdded:Wait()
    adornee = char:WaitForChild("Head")
    hum = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")

    
    local ESP = {}
    ESP.Item = Drawing.new("Text")
    ESP.Item.Visible = false
    ESP.Item.Font = espSettings.Name.Font
    ESP.Item.Center = espSettings.Name.Center


    if player ~= nil and char ~= nil and hrp ~= nil and hum ~= nil and hum.Health > 0 then
        
    NameConnection = RunService.PreRender:Connect(function()
         textHeight = Vector3.new(0, 2.3, 0)
         TextPos, onScreen = camera:worldToViewportPoint(adornee.Position + textHeight)
         pos = Vector2.new(TextPos.X, TextPos.Y)
         distance = (playerChar.HumanoidRootPart.Position - hrp.Position).Magnitude

         
         if onScreen and NameESP and char ~= nil and hum ~= nil and hum.Health > 0 then
          ESP.Item.Position = pos
          ESP.Item.Text = player.Name
          ESP.Item.Visible = true

          ESP.Item.Size = espSettings.Name.Size
          ESP.Item.Color = espSettings.Name.Color

         
         
          player.AncestryChanged:Connect(function(player)
            task.wait()
            if not player:IsDescendantOf(game) then
                ESP.Item.Visible = false
                ESP.Item:Destroy(player)
                
            end
        end)


         else

            ESP.Item.Visible = false

       end
    end)
  end
end




local CreateSkeletonESP = function(player, char, hum, hrp, vctr2)
    char = player.Character or player.CharacterAdded:Wait()
    hum = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")


    local ESP = {}
    ESP.Line = Drawing.new("Line")
    ESP.Line.Visible = false
    ESP.Line.Thickness = 1.2


    ESP.LeftArmLine = Drawing.new("Line")
    ESP.LeftArmLine.Visible = false
    ESP.LeftArmLine.Thickness = 1.2


    ESP.LeftHandLine = Drawing.new("Line")
    ESP.LeftHandLine.Visible = false
    ESP.LeftHandLine.Thickness = 1.2

    ESP.LeftNeckLine = Drawing.new("Line")
    ESP.LeftNeckLine.Visible = false
    ESP.LeftNeckLine.Thickness = 1.2
    
    
    ESP.RightNeckLine = Drawing.new("Line")
    ESP.RightNeckLine.Visible = false
    ESP.RightNeckLine.Thickness = 1.2
    


    ESP.RightArmline = Drawing.new("Line")
    ESP.RightArmline.Visible = false
    ESP.RightArmline.Thickness = 1.2
 
    ESP.RightHand = Drawing.new("Line")
    ESP.RightHand.Visible = false
    ESP.RightHand.Thickness = 1.2

    ESP.RightNeckLine = Drawing.new("Line")
    ESP.RightNeckLine.Visible = false
    ESP.RightNeckLine.Thickness = 1.2



    ESP.LeftUpperLegline = Drawing.new("Line")
    ESP.LeftUpperLegline.Visible = false
    ESP.LeftUpperLegline.Thickness = 1.2

    ESP.LeftLowerLeg = Drawing.new("Line")
    ESP.LeftLowerLeg.Visible = false
    ESP.LeftLowerLeg.Thickness = 1.2

    ESP.LeftFoot = Drawing.new("Line")
    ESP.LeftFoot.Visible = false
    ESP.LeftFoot.Thickness = 1.2


    ESP.RightUpperLegline = Drawing.new("Line")
    ESP.RightUpperLegline.Visible = false
    ESP.RightUpperLegline.Thickness = 1.2

    ESP.RightLowerLeg = Drawing.new("Line")
    ESP.RightLowerLeg.Visible = false
    ESP.RightLowerLeg.Thickness = 1.2

    ESP.RightFoot = Drawing.new("Line")
    ESP.RightFoot.Visible = false
    ESP.RightFoot.Thickness = 1.2


    ESP.Waistline = Drawing.new("Line")
    ESP.Waistline.Visible = false
    ESP.Waistline.Thickness = 1.2



    if player ~= nil and char ~= nil and hrp ~= nil and hum ~= nil and hum.Health > 0 then
         
        
     SkeletonConnection = RunService.PreRender:Connect(function(pos)
        local hum, onScreen = camera:WorldToViewportPoint(hrp.Position)
        
        local HeadVector = camera:worldToViewportPoint(char.Head.Position)
        local UpperTorsoVector = camera:worldToViewportPoint(char.UpperTorso.Position + Vector3.new(0, 0.5, 0))
        local WaistlineVector = camera:worldToViewportPoint(char.LowerTorso.Position + Vector3.new(0, -0.1, 0))
        

        local LeftArmVector = camera:worldToViewportPoint(char.LeftUpperArm.Position)
        local LeftLowerArmVector = camera:worldToViewportPoint(char.LeftLowerArm.Position + Vector3.new(0, -0.1, 0))
        local LeftHandVector = camera:worldToViewportPoint(char.LeftHand.Position)


        local RightArmVector = camera:worldToViewportPoint(char.RightUpperArm.Position)
        local RightLowerArmVector = camera:worldToViewportPoint(char.RightLowerArm.Position + Vector3.new(0, -0.1, 0))
        local RightHandVector = camera:worldToViewportPoint(char.RightHand.Position)
        

        local LeftUpperLegVector = camera:worldToViewportPoint(char.LeftUpperLeg.Position)
        local LeftLowerLegVector = camera:worldToViewportPoint(char.LeftLowerLeg.Position)
        local LeftFootVector = camera:worldToViewportPoint(char.LeftFoot.Position)


        local RightUpperLegVector = camera:worldToViewportPoint(char.RightUpperLeg.Position)
        local RightLowerLegVector = camera:worldToViewportPoint(char.RightLowerLeg.Position)
        local RightFootVector = camera:worldToViewportPoint(char.RightFoot.Position)


        
        if onScreen and SkeletonESP and hum ~= nil and hrp ~= nil then
          
          ESP.Line.From = Vector2.new(HeadVector.X, HeadVector.Y)
          ESP.Line.To = Vector2.new(UpperTorsoVector.X, UpperTorsoVector.Y)
          ESP.Line.Visible = true


          ESP.LeftArmLine.From = Vector2.new(LeftArmVector.X, LeftArmVector.Y)
          ESP.LeftArmLine.To = Vector2.new(LeftLowerArmVector.X, LeftLowerArmVector.Y)
          ESP.LeftArmLine.Visible = true
 
          ESP.LeftHandLine.From = Vector2.new(LeftLowerArmVector.X, LeftLowerArmVector.Y)
          ESP.LeftHandLine.To = Vector2.new(LeftHandVector.X, LeftHandVector.Y)
          ESP.LeftHandLine.Visible = true

          
          ESP.LeftNeckLine.From = Vector2.new(UpperTorsoVector.X, UpperTorsoVector.Y)
          ESP.LeftNeckLine.To = Vector2.new(LeftArmVector.X, LeftArmVector.Y)
          ESP.LeftNeckLine.Visible = true

          ESP.RightNeckLine.From = Vector2.new(UpperTorsoVector.X, UpperTorsoVector.Y)
          ESP.RightNeckLine.To = Vector2.new(RightArmVector.X, RightArmVector.Y)
          ESP.RightNeckLine.Visible = true
                   


          ESP.RightArmline.From = Vector2.new(RightArmVector.X, RightArmVector.Y)
          ESP.RightArmline.To = Vector2.new(RightLowerArmVector.X, RightLowerArmVector.Y)
          ESP.RightArmline.Visible = true
 
          ESP.RightHand.From = Vector2.new(RightLowerArmVector.X, RightLowerArmVector.Y)
          ESP.RightHand.To = Vector2.new(RightHandVector.X, RightHandVector.Y)
          ESP.RightHand.Visible = true
 
          ESP.RightNeckLine.From = Vector2.new(UpperTorsoVector.X, UpperTorsoVector.Y)
          ESP.RightNeckLine.To = Vector2.new(RightArmVector.X, RightArmVector.Y)
          ESP.RightNeckLine.Visible = true



          ESP.LeftUpperLegline.From = Vector2.new(WaistlineVector.X, WaistlineVector.Y)
          ESP.LeftUpperLegline.To = Vector2.new(LeftUpperLegVector.X, LeftUpperLegVector.Y)
          ESP.LeftUpperLegline.Visible = true

          ESP.LeftLowerLeg.From = Vector2.new(LeftUpperLegVector.X, LeftUpperLegVector.Y)
          ESP.LeftLowerLeg.To = Vector2.new(LeftLowerLegVector.X, LeftLowerLegVector.Y)
          ESP.LeftLowerLeg.Visible = true
 
          ESP.LeftFoot.From = Vector2.new(LeftLowerLegVector.X, LeftLowerLegVector.Y)
          ESP.LeftFoot.To = Vector2.new(LeftFootVector.X, LeftFootVector.Y)
          ESP.LeftFoot.Visible = true


          ESP.RightUpperLegline.From = Vector2.new(WaistlineVector.X, WaistlineVector.Y)
          ESP.RightUpperLegline.To = Vector2.new(RightUpperLegVector.X, RightUpperLegVector.Y)
          ESP.RightUpperLegline.Visible = true

          ESP.RightLowerLeg.From = Vector2.new(RightUpperLegVector.X, RightUpperLegVector.Y)
          ESP.RightLowerLeg.To = Vector2.new(RightLowerLegVector.X, RightLowerLegVector.Y)
          ESP.RightLowerLeg.Visible = true
 
          ESP.RightFoot.From = Vector2.new(RightLowerLegVector.X, RightLowerLegVector.Y)
          ESP.RightFoot.To = Vector2.new(RightFootVector.X, RightFootVector.Y)
          ESP.RightFoot.Visible = true


          ESP.Waistline.From = Vector2.new(WaistlineVector.X, WaistlineVector.Y)
          ESP.Waistline.To = Vector2.new(UpperTorsoVector.X, UpperTorsoVector.Y)
          ESP.Waistline.Visible = true

          
          
          ESP.Line.Color = espSettings.Skeleton.Color
          ESP.LeftArmLine.Color = espSettings.Skeleton.Color
          ESP.LeftHandLine.Color = espSettings.Skeleton.Color

          ESP.LeftNeckLine.Color = espSettings.Skeleton.Color
          ESP.RightNeckLine.Color = espSettings.Skeleton.Color

          ESP.RightArmline.Color = espSettings.Skeleton.Color
          ESP.RightHand.Color = espSettings.Skeleton.Color
          ESP.RightNeckLine.Color = espSettings.Skeleton.Color


          ESP.LeftUpperLegline.Color = espSettings.Skeleton.Color
          ESP.LeftLowerLeg.Color = espSettings.Skeleton.Color
          ESP.LeftFoot.Color = espSettings.Skeleton.Color


          ESP.RightUpperLegline.Color = espSettings.Skeleton.Color
          ESP.RightLowerLeg.Color = espSettings.Skeleton.Color
          ESP.RightFoot.Color = espSettings.Skeleton.Color


          ESP.Waistline.Color = espSettings.Skeleton.Color

         
         
          player.AncestryChanged:Connect(function(player)
            task.wait()
            if not player:IsDescendantOf(game) then
                ESP.Line:Destroy(player)
                ESP.LeftArmLine:Destroy(player)
                ESP.LeftHandLine:Destroy(player)

                ESP.LeftNeckLine:Destroy(player)
                ESP.RightNeckLine:Destroy(player)

                ESP.RightArmline:Destroy(player)
                ESP.RightHand:Destroy(player)
                ESP.RightNeckLine:Destroy(player)

                ESP.LeftUpperLegline:Destroy(player)
                ESP.LeftLowerLeg:Destroy(player)
                ESP.LeftFoot:Destroy(player)

                ESP.RightUpperLegline:Destroy(player)
                ESP.RightLowerLeg:Destroy(player)
                ESP.RightFoot:Destroy(player)

                ESP.Waistline:Destroy(player)
               

            end
        end)


         else

            
            ESP.Line.Visible = false
            ESP.LeftArmLine.Visible = false
            ESP.LeftHandLine.Visible = false

            ESP.LeftNeckLine.Visible = false
            ESP.RightNeckLine.Visible = false

            ESP.RightArmline.Visible = false
            ESP.RightHand.Visible = false
            ESP.RightNeckLine.Visible = false

            ESP.LeftUpperLegline.Visible = false
            ESP.LeftLowerLeg.Visible = false
            ESP.LeftFoot.Visible = false

            ESP.RightUpperLegline.Visible = false
            ESP.RightLowerLeg.Visible = false
            ESP.RightFoot.Visible = false

            ESP.Waistline.Visible = false


         end
       end)
    end
end




local CreateDistanceESP = function(player, char, adornee, hum, hrp, pos, TextPos, onScreen, distance, playerCharHRP)
    char = player.Character or player.CharacterAdded:Wait()
    adornee = char:WaitForChild("Head")
    hum = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")
    playerCharHRP = playerChar:WaitForChild("HumanoidRootPart")

    
    local ESP = {}
    ESP.Item = Drawing.new("Text")
    ESP.Item.Visible = false
    ESP.Item.Font = espSettings.Distance.Font
    ESP.Item.Center = espSettings.Distance.Center


    if player ~= nil and char ~= nil and hrp ~= nil and hum ~= nil and hum.Health > 0 then
        
    DistanceConnection = RunService.PreRender:Connect(function()
         TextPos, onScreen = camera:worldToViewportPoint(hrp.Position + Vector3.new(0, -2.8, 0))
         distance = (playerCharHRP.Position - hrp.Position).Magnitude
         pos = Vector2.new(TextPos.X, TextPos.Y)

         
         if onScreen and DistanceESP and hum ~= nil and hum.Health > 0 then
          ESP.Item.Position = pos
          ESP.Item.Text = math.round(distance) .. "ms"
          ESP.Item.Visible = true

          ESP.Item.Size = espSettings.Distance.Size
          ESP.Item.Color = espSettings.Distance.Color

         
         
          player.AncestryChanged:Connect(function(player)
            task.wait()
            if not player:IsDescendantOf(game) then
                ESP.Item:Destroy(player)
                
            end
        end)


         else

            ESP.Item.Visible = false

       end
    end)
  end
end









  local CreateHighlightChams = function(player, char, hum, hrp)
    char = player.Character or player.CharacterAdded:Wait()
    hum = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")


    
    local ESP = {}
    ESP.Holder = Instance.new("Folder")
    ESP.Holder.Name = "ChamsHolder"
    ESP.Holder.Parent = char
    
    ESP.HeadChams = Instance.new("BoxHandleAdornment")
    ESP.HeadChams.Parent = ESP.Holder
    ESP.HeadChams.Adornee = char.Head
    ESP.HeadChams.Color3 = espSettings.Chams.Color
    ESP.HeadChams.ZIndex = -1
    ESP.HeadChams.AlwaysOnTop = true
    ESP.HeadChams.Size = Vector3.new(2, 1, 1)


    ESP.HRPChams = Instance.new("BoxHandleAdornment")
    ESP.HRPChams.Parent = ESP.Holder
    ESP.HRPChams.Adornee = char.HumanoidRootPart
    ESP.HRPChams.Color3 = espSettings.Chams.Color
    ESP.HRPChams.ZIndex = -1
    ESP.HRPChams.AlwaysOnTop = true
    ESP.HRPChams.Size = Vector3.new(2, 2.5, 1)

    ESP.LeftUpperArmChams = Instance.new("BoxHandleAdornment")
    ESP.LeftUpperArmChams.Parent = ESP.Holder
    ESP.LeftUpperArmChams.Adornee = char.LeftUpperArm
    ESP.LeftUpperArmChams.Color3 = espSettings.Chams.Color
    ESP.LeftUpperArmChams.ZIndex = -1
    ESP.LeftUpperArmChams.AlwaysOnTop = true
    ESP.LeftUpperArmChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.LeftUpperArmChams.Size = Vector3.new(1, 1, 1)


    ESP.LeftLowerArmChams = Instance.new("BoxHandleAdornment")
    ESP.LeftLowerArmChams.Parent = ESP.Holder
    ESP.LeftLowerArmChams.Adornee = char.LeftLowerArm
    ESP.LeftLowerArmChams.Color3 = espSettings.Chams.Color
    ESP.LeftLowerArmChams.ZIndex = -1
    ESP.LeftLowerArmChams.AlwaysOnTop = true
    ESP.LeftLowerArmChams.CFrame = CFrame.new(0, 0, 0)
    ESP.LeftLowerArmChams.Size = Vector3.new(1, 1, 1)

    ESP.LeftHandChams = Instance.new("BoxHandleAdornment")
    ESP.LeftHandChams.Parent = ESP.Holder
    ESP.LeftHandChams.Adornee = char.LeftHand
    ESP.LeftHandChams.Color3 = espSettings.Chams.Color
    ESP.LeftHandChams.ZIndex = -1
    ESP.LeftHandChams.AlwaysOnTop = true
    ESP.LeftHandChams.CFrame = CFrame.new(0, 0, 0)
    ESP.LeftHandChams.Size = Vector3.new(1, 0.4, 1)



    ESP.RightUpperArmChams = Instance.new("BoxHandleAdornment")
    ESP.RightUpperArmChams.Parent = ESP.Holder
    ESP.RightUpperArmChams.Adornee = char.RightUpperArm
    ESP.RightUpperArmChams.Color3 = espSettings.Chams.Color
    ESP.RightUpperArmChams.ZIndex = -1
    ESP.RightUpperArmChams.AlwaysOnTop = true
    ESP.RightUpperArmChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.RightUpperArmChams.Size = Vector3.new(1, 1, 1)


    ESP.RightLowerArmChams = Instance.new("BoxHandleAdornment")
    ESP.RightLowerArmChams.Parent = ESP.Holder
    ESP.RightLowerArmChams.Adornee = char.RightLowerArm
    ESP.RightLowerArmChams.Color3 = espSettings.Chams.Color
    ESP.RightLowerArmChams.ZIndex = -1
    ESP.RightLowerArmChams.AlwaysOnTop = true
    ESP.RightLowerArmChams.CFrame = CFrame.new(0, 0, 0)
    ESP.RightLowerArmChams.Size = Vector3.new(1, 1, 1)


    ESP.RightHandChams = Instance.new("BoxHandleAdornment")
    ESP.RightHandChams.Parent = ESP.Holder
    ESP.RightHandChams.Adornee = char.RightHand
    ESP.RightHandChams.Color3 = espSettings.Chams.Color
    ESP.RightHandChams.ZIndex = -1
    ESP.RightHandChams.AlwaysOnTop = true
    ESP.RightHandChams.CFrame = CFrame.new(0, 0, 0)
    ESP.RightHandChams.Size = Vector3.new(1, 0.4, 1)



    ESP.LeftUpperLegChams = Instance.new("BoxHandleAdornment")
    ESP.LeftUpperLegChams.Parent = ESP.Holder
    ESP.LeftUpperLegChams.Adornee = char.LeftUpperLeg
    ESP.LeftUpperLegChams.Color3 = espSettings.Chams.Color
    ESP.LeftUpperLegChams.ZIndex = -1
    ESP.LeftUpperLegChams.AlwaysOnTop = true
    ESP.LeftUpperLegChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.LeftUpperLegChams.Size = Vector3.new(1, 1, 1)


    ESP.LeftLowerLegChams = Instance.new("BoxHandleAdornment")
    ESP.LeftLowerLegChams.Parent = ESP.Holder
    ESP.LeftLowerLegChams.Adornee = char.LeftLowerLeg
    ESP.LeftLowerLegChams.Color3 = espSettings.Chams.Color
    ESP.LeftLowerLegChams.ZIndex = -1
    ESP.LeftLowerLegChams.AlwaysOnTop = true
    ESP.LeftLowerLegChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.LeftLowerLegChams.Size = Vector3.new(1, 1, 1)


    ESP.LeftFootChams = Instance.new("BoxHandleAdornment")
    ESP.LeftFootChams.Parent = ESP.Holder
    ESP.LeftFootChams.Adornee = char.LeftLowerLeg
    ESP.LeftFootChams.Color3 = espSettings.Chams.Color
    ESP.LeftFootChams.ZIndex = -1
    ESP.LeftFootChams.AlwaysOnTop = true
    ESP.LeftFootChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.LeftFootChams.Size = Vector3.new(1, 1, 1)





    ESP.RightUpperLegChams = Instance.new("BoxHandleAdornment")
    ESP.RightUpperLegChams.Parent = ESP.Holder
    ESP.RightUpperLegChams.Adornee = char.RightUpperLeg
    ESP.RightUpperLegChams.Color3 = espSettings.Chams.Color
    ESP.RightUpperLegChams.ZIndex = -1
    ESP.RightUpperLegChams.AlwaysOnTop = true
    ESP.RightUpperLegChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.RightUpperLegChams.Size = Vector3.new(1, 1, 1)


    ESP.RightLowerLegChams = Instance.new("BoxHandleAdornment")
    ESP.RightLowerLegChams.Parent = ESP.Holder
    ESP.RightLowerLegChams.Adornee = char.RightLowerLeg
    ESP.RightLowerLegChams.Color3 = espSettings.Chams.Color
    ESP.RightLowerLegChams.ZIndex = -1
    ESP.RightLowerLegChams.AlwaysOnTop = true
    ESP.RightLowerLegChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.RightLowerLegChams.Size = Vector3.new(1, 1, 1)


    ESP.RightFootChams = Instance.new("BoxHandleAdornment")
    ESP.RightFootChams.Parent = ESP.Holder
    ESP.RightFootChams.Adornee = char.RightLowerLeg
    ESP.RightFootChams.Color3 = espSettings.Chams.Color
    ESP.RightFootChams.ZIndex = -1
    ESP.RightFootChams.AlwaysOnTop = true
    ESP.RightFootChams.CFrame = CFrame.new(0, 0.18, 0)
    ESP.RightFootChams.Size = Vector3.new(1, 1, 1)



    for i,v in pairs(char:GetChildren()) do
        if v:IsA("MeshPart") or v:IsA("Part") and ChamsESP then
            v.Transparency = 1

        end
    end

    DestroyChams = function()
     for i,v in pairs(players:GetChildren()) do
        local ch = v.Character:FindFirstChild("ChamsHolder")
        
        if ch then
            ch:Destroy()
        end
      end
   end


    ResetChams = function()
      for i,v in pairs(players:GetChildren()) do
        local ch = v.Character or v.CharacterAdded:Wait()

        if ch then
            for i,v in pairs(ch:GetChildren()) do
              if v:IsA("MeshPart") or v:IsA("Part") then
                 v.Transparency = 0

                 if v.Name == "HeadTopHitBox" or v.Name == "FaceHitBox" or v.Name == "HumanoidRootPart" then
                    v.Transparency = 1

                  end
                end
            end
        end
    end
end


   
    player.AncestryChanged:Connect(function(player)
        task.wait()
        if not player:IsDescendantOf(game) then
           ESP.Holder:Destroy()
           
        end
    end)
  end













local hitNotification = function()
    local namecall
    namecall = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod():lower()
    if not checkcaller() and self == hitEvent and method == "fireserver" and HitNoti then
        local Distance = (playerChar.HumanoidRootPart.Position - args[1].Parent.HumanoidRootPart.Position).Magnitude

        library:SendNotification("[draingang.lua xd] Hit " .. "(" .. tostring(args[1].Parent.ClassName) .. ")" .. ", " ..  tostring(args[1].Parent) .. "(" .. tostring(args[1].Parent.Humanoid.Health) .. "/" .. tostring(args[1].Parent.Humanoid.MaxHealth) .. ")" .. ", " .. tostring(args[1]) .. ", " .. "Distance: " .. math.round(Distance) .. "ms", 4)
        return namecall(self,unpack(args))
    end
    return namecall(self,...)
end)
end





local meleeHitNotification = function()
    local namecall
    namecall = hookmetamethod(game,"__namecall",function(self,...)
    local args = {...}
    local method = getnamecallmethod():lower()
    if not checkcaller() and self == meleehitEvent and method == "fireserver" and HitNoti then
        local Distance = (playerChar.HumanoidRootPart.Position - args[1].HumanoidRootPart.Position).Magnitude

        library:SendNotification("[draingang.lua xd] Hit " .. tostring(args[1].Name) .. "(" .. tostring(args[1].Humanoid.Health) .. "/" .. tostring(args[1].Humanoid.MaxHealth) .. ")" .. ", " .. tostring(args[1]) .. ", " .. "Distance: " .. math.round(Distance) .. "ms" .. "," .. " Attack Type: " .. tostring(args[3]), 4)
        return namecall(self,unpack(args))
    end
    return namecall(self,...)
end)
end









local AddNameESP = function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and NameESP then
          CreateNameESP(v)
    
     end
  end
end



local AddHighlightChams = function(char, hl)
    for i,v in pairs(game.Players:GetPlayers()) do
        char = v.Character or v.CharacterAdded:Wait()
        hl = v.Character:FindFirstChild("ChamsHolder")

        if v ~= LocalPlayer and ChamsESP and not hl then
            CreateHighlightChams(v)
    
     end
  end
end



local AddSkeletonESP = function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and SkeletonESP then
          CreateSkeletonESP(v)
    
     end
  end
end


local AddDistanceESP = function()
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer and DistanceESP then
          CreateDistanceESP(v)
    
     end
  end
end







local Decimals = 4
local Clock = os.clock()
local ValueText = "Value Is Now :"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "draingang.lua",
    gamename = game.PlaceId,
})

library:init()

local Window1  = library.NewWindow({
    title = "draingang.lua | Private | Halloween(Haunted Mound Special)",
    size = UDim2.new(0, 510, 0.6, 6

)})


local visuals_tab = Window1:AddTab("  Visuals  ")
local SettingsTab = library:CreateSettingsTab(Window1)

local Visuals_Section = visuals_tab:AddSection("Visuals", 1)
local HitVisuals_Section = visuals_tab:AddSection("Hit Notification", 2)






local NameESP = Visuals_Section:AddToggle({
    text = "Name",
    state = false,
    risky = true,
    tooltip = "Name ESP",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        if v then
        NameESP = true
        AddNameESP(v)
    else
        NameESP = false
        NameConnection:Disconnect()
      end
   end

    

}):AddColor({
    text = "Text Color",
    color = Color3.fromRGB(255, 144, 46),
    flag = "Color_1",
    callback = function(v)
        espSettings.Name.Color = v
    
    end

})







local SkeletonESP = Visuals_Section:AddToggle({
    text = "Skeleton",
    state = false,
    risky = true,
    tooltip = "Skeleton ESP",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        if v then
        SkeletonESP = true
        AddSkeletonESP(v)
    else
        SkeletonESP = false
        SkeletonConnection:Disconnect()
     end
  end

    

}):AddColor({
    text = "Text Color",
    color = Color3.fromRGB(255, 144, 46),
    flag = "Color_1",
    callback = function(v)
        espSettings.Skeleton.Color = v
    
    end

})





local DistanceESPToggle = Visuals_Section:AddToggle({
    text = "Distance",
    state = false,
    risky = true,
    tooltip = "Distance ESP",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        if v then
        DistanceESP = true
        AddDistanceESP()
    else
        DistanceESP = false
        DistanceConnection:Disconnect()
      end
   end

    

}):AddColor({
    text = "Text Color",
    color = Color3.fromRGB(255, 144, 46),
    flag = "Color_1",
    callback = function(v)
        espSettings.Distance.Color = v
    
    end

})





local ChamESP = Visuals_Section:AddToggle({
    text = "Vis Chams",
    state = false,
    risky = true,
    tooltip = "Cham ESP",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
      if v then
       ChamsESP = true
       AddHighlightChams()
    else
       ChamsESP = false
       DestroyChams()
       ResetChams()
    end
end

    

}):AddColor({
    text = "Text Color",
    color = Color3.fromRGB(255, 144, 46),
    flag = "Color_1",
    callback = function(v)
        espSettings.Skeleton.Color = v
    
    end

})










local NameText_Slider = Visuals_Section:AddSlider({
    enabled = true,
    text = "Name Size",
    tooltip = "changes the size of a players name ESP",
    flag = "Slider_1",
    suffix = "",
    dragging = true,
    focused = false,
    min = 1,
    max = 100,
    increment = 1,
    risky = false,
    callback = function(v)
        espSettings.Name.Size = math.round(v)
    
    end
})




players.PlayerAdded:Connect(function(plr)
    if NameESP then
        AddNameESP(plr)
    else
        NameConnection:Disconnect()
    end

    
    if SkeletonESP then
        AddSkeletonESP(plr)
    else
        SkeletonConnection:Disconnect()
    end

     if DistanceESP then
        AddDistanceESP(plr)
    else
       DistanceConnection:Disconnect()
    end

   
    if ChamsESP then
        AddHighlightChams()
    else
        ResetChams()
    end


end)




-- hit stuff




local HitNotificationToggle = HitVisuals_Section:AddToggle({
    text = "Hit Notification",
    state = false,
    risky = true,
    tooltip = "tells you the stats of someone you hit",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        if v then
        HitNoti = true
        hitNotification()
        meleeHitNotification()
    else
         HitNoti = false
      end
    end

})


local HitSoundsToggle = HitVisuals_Section:AddToggle({
    text = "Hit Sounds",
    state = false,
    risky = true,
    tooltip = "plays a sound when you hit a target",
    flag = "Toggle_1",
    risky = false,
    callback = function(v)
        if v then
        HitSoundsEnabled = true
        hitSoundFunction()
    else
         HitSoundsEnabled = false
      end
    end

})



local HitSoundsDropdown = HitVisuals_Section:AddList({
    enabled = true,
    text = "HitSounds", 
    tooltip = "different hit sounds when you shoot/knife someone",
    selected = "",
    multi = false,
    open = false,
    max = 4,
    values = {"Randy", "Rust", "Jewellxx", "Mortal Kombat", "Hentai", "Error", "Pluh"},
    risky = false,
    callback = function(v)
        if v == "Randy" then
            writefile("Randy.mp3", crypt.base64decode(HitSounds.randy))    
            HitSound = getcustomasset("Randy.mp3")
        
            library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
            SoundTest(HitSound)
           
       
        else
            
        if v == "Rust" then
            writefile("Rust.mp3", crypt.base64decode(HitSounds.rust))    
            HitSound = getcustomasset("Rust.mp3")
        
            library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
            SoundTest(HitSound)

    else

        if v == "Jewellxx" then
        writefile("Jewellxx.mp3", crypt.base64decode(HitSounds.jewlxx))    
        HitSound = getcustomasset("Jewellxx.mp3")
        
        library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
        SoundTest(HitSound)
        

    else

        if v == "Mortal Kombat" then
        writefile("MortalKombat.mp3", crypt.base64decode(HitSounds.mk))    
        HitSound = getcustomasset("MortalKombat.mp3")
        
        library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
        SoundTest(HitSound)
        
    else

            
        if v == "Hentai" then
        writefile("Hentai.mp3", crypt.base64decode(HitSounds.hentai))    
        HitSound = getcustomasset("Hentai.mp3")
        
        library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
        SoundTest(HitSound)

    else

        if v == "Error" then
        writefile("Error.mp3", crypt.base64decode(HitSounds.Error))
        HitSound = getcustomasset("Error.mp3")
        
         library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
        SoundTest(HitSound)

    else

        if v == "Pluh" then
        writefile("Pluh.mp3", crypt.base64decode(HitSounds.pluh))    
        HitSound = getcustomasset("Pluh.mp3")
        
         library:SendNotification("[draingang.lua xd] HitSound: " .. HitSound , 2)
        SoundTest(HitSound)

         
        end
     end
   end
end
  end
    end
  end
end

})






players.PlayerAdded:Connect(function(playerAdded)
    library:SendNotification("[draingang.lua xd] " .. tostring(playerAdded) .. " Joined", 4)
    print(playerAdded, "Joined")
end)

players.PlayerRemoving:Connect(function(playerLeft)
    library:SendNotification("[draingang.lua xd] " .. tostring(playerLeft) .. " Left", 4)
    print(playerLeft, "Left")
end)





