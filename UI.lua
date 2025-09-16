-- Plus button click (+1)vDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}]]end function a.j()

local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj,ak)
ah=ah or"Primary"
local al=not ak and 10 or 99
local am
if af and af~=""then
am=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local an=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 1
}),

ab.NewRoundFrame(al,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1
}),

ab.NewRoundFrame(al,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not ak
}),

ab.NewRoundFrame(al,not ak and"SquircleOutline"or"SquircleOutline2",{
ThemeTag={
ImageColor3=ah~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ah=="Primary"and.95 or.85,
Name="SquircleOutline",
},{
ac("UIGradient",{
Rotation=70,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),

ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil
},
ImageColor3=ah=="--repeat task.wait() until game:IsLoaded()
local library = {}
local ToggleUI = false
library.currentTab = nil
library.flags = {}

local services = setmetatable({}, {
  __index = function(t, k)
    return game.GetService(game, k)
  end
})

local mouse = services.Players.LocalPlayer:GetMouse()

function Tween(obj, t, data)
	services.TweenService:Create(obj, TweenInfo.new(t[1], Enum.EasingStyle[t[2]], Enum.EasingDirection[t[3]]), data):Play()
	return true
end

function Ripple(obj)
      local png = math.random(1,2)
      local png1 = ''
      local png2 = ''
      
      if png ==1 then
        png_r = png1
      end
      if png ==2 then
        png_r = png2
      end
      
	spawn(function()
		if obj.ClipsDescendants ~= true then
			obj.ClipsDescendants = true
		end
		local Ripple = Instance.new("ImageLabel")
		Ripple.Name = "Ripple"
		Ripple.Parent = obj
		Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.BackgroundTransparency = 1.000
		Ripple.ZIndex = 8
		Ripple.Image = ""..png_r
		Ripple.ImageTransparency = 0.800
		Ripple.ScaleType = Enum.ScaleType.Fit
		Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Ripple.Position = UDim2.new((mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X, 0, (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y, 0)
		Tween(Ripple, {.3, 'Linear', 'InOut'}, {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)})
		wait(0.15)
		Tween(Ripple, {.3, 'Linear', 'InOut'}, {ImageTransparency = 1})
		wait(.3)
		Ripple:Destroy()
	end)
end

local toggled = false

-- # Switch Tabs # --
local switchingTabs = false
function switchTab(new)
  if switchingTabs then return end
  local old = library.currentTab
  if old == nil then
    new[2].Visible = true
    library.currentTab = new
    services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
    services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
    return
  end
  
  if old[1] == new[1] then return end
  switchingTabs = true
  library.currentTab = new

  services.TweenService:Create(old[1], TweenInfo.new(0.1), {ImageTransparency = 0.2}):Play()
  services.TweenService:Create(new[1], TweenInfo.new(0.1), {ImageTransparency = 0}):Play()
  services.TweenService:Create(old[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0.2}):Play()
  services.TweenService:Create(new[1].TabText, TweenInfo.new(0.1), {TextTransparency = 0}):Play()

  old[2].Visible = false
  new[2].Visible = true
  
  task.wait(0.1)

  switchingTabs = false
end

-- # Drag, Stolen from Kiriot or Wally # --
function drag(frame, hold)
	if not hold then
		hold = frame
	end
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	hold.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	services.UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function library.new(library, name,theme)
    for _, v in next, services.CoreGui:GetChildren() do
        if v.Name == "frosty" then
          v:Destroy()
        end
      end
if theme == 'dark' then
    MainColor = Color3.fromRGB(25, 25, 25)
    Background = Color3.fromRGB(25, 25, 25)
    zyColor= Color3.fromRGB(25, 25, 25)
    beijingColor = Color3.fromRGB(25, 25, 25)
    DTTransparency = 1.0
    else
    MainColor = Color3.fromRGB(25, 25, 25)
    Background = Color3.fromRGB(25, 25, 25)
    zyColor= Color3.fromRGB(25, 25, 25)
    beijingColor = Color3.fromRGB(255, 255, 255)
    DTTransparency = 1.0
end
      local dogent = Instance.new("ScreenGui")
      local Main = Instance.new("Frame")
      local TabMain = Instance.new("Frame")
      local MainC = Instance.new("UICorner")
      local SB = Instance.new("Frame")
      local SBC = Instance.new("UICorner")
      local Side = Instance.new("Frame")
      local SideG = Instance.new("UIGradient")
      local TabBtns = Instance.new("ScrollingFrame")
      local TabBtnsL = Instance.new("UIListLayout")
      local ScriptTitle = Instance.new("TextLabel")
      local SBG = Instance.new("UIGradient") 
      local Open = Instance.new("ImageButton")
      local REN = Instance.new("UICorner")
      local UIG=Instance.new("UIGradient")
      local DropShadowHolder = Instance.new("Frame")
      local DropShadow = Instance.new("ImageLabel")
      local UICornerMain = Instance.new("UICorner")
      local UIGradient=Instance.new("UIGradient")
      local UIGradientTitle=Instance.new("UIGradient")
      
      if syn and syn.protect_gui then syn.protect_gui(dogent) end
    
      dogent.Name = "frosty"
      dogent.Parent = services.CoreGui
      
      function UiDestroy()
          dogent:Destroy()
      end
      
          function ToggleUILib()
            if not ToggleUI then
                dogent.Enabled = false
                ToggleUI = true
                else
                ToggleUI = false
                dogent.Enabled = true
            end
        end
      
      Main.Name = "Main"
      Main.Parent = dogent
      Main.AnchorPoint = Vector2.new(0.5, 0.5)
      Main.BackgroundColor3 = Background
      Main.BorderColor3 = MainColor
      Main.Position = UDim2.new(0.5, 0, 0.5, 0)
      Main.Size = UDim2.new(0, 572, 0, 353)
      Main.ZIndex = 1
      Main.Active = true
      Main.Draggable = true
      Main.Transparency = 1.0
      services.UserInputService.InputEnded:Connect(function(input)
      if input.KeyCode == Enum.KeyCode.LeftControl then
      if Main.Visible == true then
      Main.Visible = false else
      Main.Visible = true
      end
      end
      end)
      drag(Main)
      
      UICornerMain.Parent = Main
      UICornerMain.CornerRadius = UDim.new(0,3)
      
      DropShadowHolder.Name = "DropShadowHolder"
      DropShadowHolder.Parent = Main
      DropShadowHolder.BackgroundTransparency = 1.000
      DropShadowHolder.BorderSizePixel = 0
      DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
      DropShadowHolder.BorderColor3 = Color3.fromRGB(255,255,255)
      DropShadowHolder.ZIndex = 0

      DropShadow.Name = "DropShadow"
      DropShadow.Parent = DropShadowHolder
      DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
      DropShadow.BackgroundTransparency = 1.000
      DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
      DropShadow.Size = UDim2.new(1, 10, 1, 10)
      DropShadow.Image = "rbxassetid://16060333448"
      DropShadow.ImageColor3 = Color3.fromRGB(255,255,255)
      DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)


      UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))}

      local TweenService = game:GetService("TweenService")
      local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
      local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
      tween:Play()

          function toggleui()
            toggled = not toggled
            spawn(function()
                if toggled then wait(0.3) end
            end)
            Tween(Main, {0.3, 'Sine', 'InOut'}, {
                Size = UDim2.new(0, 609, 0, (toggled and 505 or 0))
            })
        end
      
      TabMain.Name = "TabMain"
      TabMain.Parent = Main
      TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabMain.BackgroundTransparency = 1.000
      TabMain.Position = UDim2.new(0.217000037, 0, 0, 3)
      TabMain.Size = UDim2.new(0, 448, 0, 353)
      TabMain.Transparency = 1.0
      
      MainC.CornerRadius = UDim.new(0, 5.5)
      MainC.Name = "MainC"
      MainC.Parent = Frame
      
      
      SB.Name = "SB"
      SB.Parent = Main
      SB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      SB.BorderColor3 = MainColor
      SB.Size = UDim2.new(0, 8, 0, 353)
      SB.Transparency = 1.0
      
      SBC.CornerRadius = UDim.new(0, 6)
      SBC.Name = "SBC"
      SBC.Parent = SB
      
      Side.Name = "Side"
      Side.Parent = SB
      Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Side.BorderColor3 = Color3.fromRGB(255, 255, 255)
      Side.BorderSizePixel = 0
      Side.ClipsDescendants = true
      Side.Position = UDim2.new(1, 0, 0, 0)
      Side.Size = UDim2.new(0, 110, 0, 353)
      Side.Transparency = 1.0
      
      SideG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
      SideG.Rotation = 90
      SideG.Name = "SideG"
      SideG.Parent = Side
      
      TabBtns.Name = "TabBtns"
      TabBtns.Parent = Side
      TabBtns.Active = true
      TabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TabBtns.BackgroundTransparency = 1.000
      TabBtns.BorderSizePixel = 0
      TabBtns.Position = UDim2.new(0, 0, 0.0973535776, 0)
      TabBtns.Size = UDim2.new(0, 110, 0, 318)
      TabBtns.CanvasSize = UDim2.new(0, 0, 1, 0)
      TabBtns.ScrollBarThickness = 0
      
      TabBtnsL.Name = "TabBtnsL"
      TabBtnsL.Parent = TabBtns
      TabBtnsL.SortOrder = Enum.SortOrder.LayoutOrder
      TabBtnsL.Padding = UDim.new(0, 12)
      
      ScriptTitle.Name = "ScriptTitle"
      ScriptTitle.Parent = Side
      ScriptTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ScriptTitle.BackgroundTransparency = 1.000
      ScriptTitle.Position = UDim2.new(0, 0, 0.00953488424, 0)
      ScriptTitle.Size = UDim2.new(0, 102, 0, 20)
      ScriptTitle.Font = Enum.Font.GothamSemibold
      ScriptTitle.Text = name
      ScriptTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
      ScriptTitle.TextSize = 14.000
      ScriptTitle.TextScaled = true
      ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
      
      UIGradientTitle.Parent = ScriptTitle
     
      local function NPLHKB_fake_script() 
        local script = Instance.new('LocalScript', ScriptTitle)
     
        local button = script.Parent
        local gradient = button.UIGradient
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local offset = {Offset = Vector2.new(1, 0)}
        local create = ts:Create(gradient, ti, offset)
        local startingPos = Vector2.new(-1, 0)
        local list = {} 
        local s, kpt = ColorSequence.new, ColorSequenceKeypoint.new
        local counter = 0
        local status = "down" 
        gradient.Offset = startingPos
        local function rainbowColors()
            local sat, val = 255, 255 
            for i = 1, 10 do 
                local hue = i * 17 
                table.insert(list, Color3.fromHSV(hue / 255, sat / 255, val / 255))
            end
        end
        rainbowColors()
        gradient.Color = s({
            kpt(0, list[#list]),
            kpt(0.5, list[#list - 1]),
            kpt(1, list[#list - 2])
        })
        counter = #list
        local function animate()
            create:Play()
            create.Completed:Wait() 
            gradient.Offset = startingPos 
            gradient.Rotation = 180
            if counter == #list - 1 and status == "down" then
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[#list]), 
                    kpt(1, list[1]) 
                })
                counter = 1
                status = "up" 
            elseif counter == #list and status == "down" then 
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[1]),
                    kpt(1, list[2])
                })
                counter = 2
                status = "up"
            elseif counter <= #list - 2 and status == "down" then 
                gradient.Color = s({
                    kpt(0, gradient.Color.Keypoints[1].Value),
                    kpt(0.5, list[counter + 1]), 
                    kpt(1, list[counter + 2])
                })
                counter = counter + 2
                status = "up"
            end
            create:Play()
            create.Completed:Wait()
            gradient.Offset = startingPos
            gradient.Rotation = 0 
            if counter == #list - 1 and status == "up" then
                gradient.Color = s({ 
     
                    kpt(0, list[1]), 
                    kpt(0.5, list[#list]), 
                    kpt(1, gradient.Color.Keypoints[3].Value)
                })
                counter = 1
                status = "down"
            elseif counter == #list and status == "up" then
                gradient.Color = s({
                    kpt(0, list[2]),
                    kpt(0.5, list[1]), 
                    kpt(1, gradient.Color.Keypoints[3].Value)
                })
                counter = 2
                status = "down"
            elseif counter <= #list - 2 and status == "up" then
                gradient.Color = s({
                    kpt(0, list[counter + 2]), 
                    kpt(0.5, list[counter + 1]), 
                    kpt(1, gradient.Color.Keypoints[3].Value) 	
                })
                counter = counter + 2
                status = "down"
            end
            animate()
        end
        animate()
     
    end
    coroutine.wrap(NPLHKB_fake_script)()
      
      SBG.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, zyColor), ColorSequenceKeypoint.new(1.00, zyColor)}
      SBG.Rotation = 90
      SBG.Name = "SBG"
      SBG.Parent = SB
    
      TabBtnsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabBtns.CanvasSize = UDim2.new(0, 0, 0, TabBtnsL.AbsoluteContentSize.Y + 18)
      end)

      local r = math.random(1,6)
      local r1 = 'rbxassetid://16060333448'
      local r2 = 'rbxassetid://16060333448'
      local r3 = 'rbxassetid://16060333448'
      local r4 = 'rbxassetid://16060333448'
      local r5 = 'rbxassetid://16060333448'
      local r6 = 'rbxassetid://16060333448'
      
      if r ==1 then
        Imagr = r1
      end
      if r ==2 then
        Imagr = r2
      end
      if r ==3 then
        Imagr = r3
      end
      if r ==4 then
        Imagr = r4
      end
      if r ==5 then
        Imagr = r5
      end
      if r ==6 then
        Imagr = r6
      end   

      

      Open.Name = "Open"
      Open.Parent = dogent
      Open.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Open.Position = UDim2.new(0.00829315186, 0, 0.31107837, 0)
      Open.Size = UDim2.new(0, 40, 0, 40)
      Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
      Open.Image = Imagr
      Open.Active = true
      Open.Draggable = true
      Open.MouseButton1Click:Connect(function()
      Main.Visible = not Main.Visible
      end)

      
        REN.CornerRadius = UDim.new(0, 360)
        REN.Parent = Open
      
      
      local window = {}
      function window.Tab(window, name, icon)
        local Tab = Instance.new("ScrollingFrame")
        local TabIco = Instance.new("ImageLabel")
        local TabText = Instance.new("TextLabel")
        local TabBtn = Instance.new("TextButton")
        local TabL = Instance.new("UIListLayout")
    
        Tab.Name = "Tab"
        Tab.Parent = TabMain
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Size = UDim2.new(1, 0, 1, 0)
        Tab.ScrollBarThickness = 2
        Tab.Visible = false
        
        TabIco.Name = "TabIco"
        TabIco.Parent = TabBtns
        TabIco.BackgroundTransparency = 1.000
        TabIco.BorderSizePixel = 0
        TabIco.Size = UDim2.new(0, 24, 0, 24)
        TabIco.Image = ("rbxassetid://%s"):format((icon or 16060333448))
        TabIco.ImageTransparency = 0.2
        
        TabText.Name = "TabText"
        TabText.Parent = TabIco
        TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabText.BackgroundTransparency = 1.000
        TabText.Position = UDim2.new(1.41666663, 0, 0, 0)
        TabText.Size = UDim2.new(0, 76, 0, 24)
        TabText.Font = Enum.Font.GothamSemibold
        TabText.Text = name
        TabText.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabText.TextSize = 14.000
        TabText.TextXAlignment = Enum.TextXAlignment.Left
        TabText.TextTransparency = 0.2
        
        TabBtn.Name = "TabBtn"
        TabBtn.Parent = TabIco
        TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabBtn.BackgroundTransparency = 1.000
        TabBtn.BorderSizePixel = 0
        TabBtn.Size = UDim2.new(0, 110, 0, 24)
        TabBtn.AutoButtonColor = false
        TabBtn.Font = Enum.Font.SourceSans
        TabBtn.Text = ""
        TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabBtn.TextSize = 14.000
        
        TabL.Name = "TabL"
        TabL.Parent = Tab
        TabL.SortOrder = Enum.SortOrder.LayoutOrder
        TabL.Padding = UDim.new(0, 4)  
    
        TabBtn.MouseButton1Click:Connect(function()
            spawn(function()
                Ripple(TabBtn)
            end)
          switchTab({TabIco, Tab})
        end)
    
        if library.currentTab == nil then switchTab({TabIco, Tab}) end
    
        TabL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
          Tab.CanvasSize = UDim2.new(0, 0, 0, TabL.AbsoluteContentSize.Y + 8)
        end)
    
        local tab = {}
        function tab.section(tab, name, TabVal)
          local Section = Instance.new("Frame")
          local SectionC = Instance.new("UICorner")
          local SectionText = Instance.new("TextLabel")
          local SectionOpen = Instance.new("ImageLabel")
          local SectionOpened = Instance.new("ImageLabel")
          local SectionToggle = Instance.new("ImageButton")
          local Objs = Instance.new("Frame")
          local ObjsL = Instance.new("UIListLayout")
    
          Section.Name = "Section"
          Section.Parent = Tab
          Section.BackgroundColor3 = zyColor
          Section.BackgroundTransparency = 1.000
          Section.BorderSizePixel = 0
          Section.ClipsDescendants = true
          Section.Size = UDim2.new(0.981000006, 0, 0, 36)
          
          SectionC.CornerRadius = UDim.new(0, 6)
          SectionC.Name = "SectionC"
          SectionC.Parent = Section
          
          SectionText.Name = "SectionText"
          SectionText.Parent = Section
          SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          SectionText.BackgroundTransparency = 1.000
          SectionText.Position = UDim2.new(0.0887396261, 0, 0, 0)
          SectionText.Size = UDim2.new(0, 401, 0, 36)
          SectionText.Font = Enum.Font.GothamSemibold
          SectionText.Text = name
          SectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
          SectionText.TextSize = 16.000
          SectionText.TextXAlignment = Enum.TextXAlignment.Left
          
          SectionOpen.Name = "SectionOpen"
          SectionOpen.Parent = SectionText
          SectionOpen.BackgroundTransparency = 1
          SectionOpen.BorderSizePixel = 0
          SectionOpen.Position = UDim2.new(0, -33, 0, 5)
          SectionOpen.Size = UDim2.new(0, 26, 0, 26)
          SectionOpen.Image = "http://www.roblox.com/asset/?id=6031302934"
          
          SectionOpened.Name = "SectionOpened"
          SectionOpened.Parent = SectionOpen
          SectionOpened.BackgroundTransparency = 1.000
          SectionOpened.BorderSizePixel = 0
          SectionOpened.Size = UDim2.new(0, 26, 0, 26)
          SectionOpened.Image = "http://www.roblox.com/asset/?id=6031302932"
          SectionOpened.ImageTransparency = 1.000
    
          SectionToggle.Name = "SectionToggle"
          SectionToggle.Parent = SectionOpen
          SectionToggle.BackgroundTransparency = 1
          SectionToggle.BorderSizePixel = 0
          SectionToggle.Size = UDim2.new(0, 26, 0, 26)
          
          Objs.Name = "Objs"
          Objs.Parent = Section
          Objs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          Objs.BackgroundTransparency = 1
          Objs.BorderSizePixel = 0
          Objs.Position = UDim2.new(0, 6, 0, 36)
          Objs.Size = UDim2.new(0.986347735, 0, 0, 0)
    
          ObjsL.Name = "ObjsL"
          ObjsL.Parent = Objs
          ObjsL.SortOrder = Enum.SortOrder.LayoutOrder
          ObjsL.Padding = UDim.new(0, 8) 
          
          local open = TabVal
          if TabVal ~= false then
            Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
            SectionOpened.ImageTransparency = (open and 0 or 1)
            SectionOpen.ImageTransparency = (open and 1 or 0)
          end
          
          SectionToggle.MouseButton1Click:Connect(function()
            open = not open
            Section.Size = UDim2.new(0.981000006, 0, 0, open and 36 + ObjsL.AbsoluteContentSize.Y + 8 or 36)
            SectionOpened.ImageTransparency = (open and 0 or 1)
            SectionOpen.ImageTransparency = (open and 1 or 0)
          end)
    
          ObjsL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            if not open then return end
            Section.Size = UDim2.new(0.981000006, 0, 0, 36 + ObjsL.AbsoluteContentSize.Y + 8)
          end)
    
          local section = {}
          function section.Button(section, text, callback)
            local callback = callback or function() end
    
            local BtnModule = Instance.new("Frame")
            local Btn = Instance.new("TextButton")
            local BtnC = Instance.new("UICorner")    
            
            BtnModule.Name = "BtnModule"
            BtnModule.Parent = Objs
            BtnModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BtnModule.BackgroundTransparency = 1.000
            BtnModule.BorderSizePixel = 0
            BtnModule.Position = UDim2.new(0, 0, 0, 0)
            BtnModule.Size = UDim2.new(0, 428, 0, 38)
            
            Btn.Name = "Btn"
            Btn.Parent = BtnModule
            Btn.BackgroundColor3 = zyColor
            Btn.BorderSizePixel = 0
            Btn.BackgroundTransparency = 1.0
            Btn.Size = UDim2.new(0, 428, 0, 38)
            Btn.AutoButtonColor = false
            Btn.Font = Enum.Font.GothamSemibold
            Btn.Text = "   " .. text
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextSize = 16.000
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            
            BtnC.CornerRadius = UDim.new(0, 6)
            BtnC.Name = "BtnC"
            BtnC.Parent = Btn
    
            Btn.MouseButton1Click:Connect(function()
                spawn(function()
                    Ripple(Btn)
                end)
                    spawn(callback)                  
                end)
            end
        
        function section:Label(text)
          local LabelModule = Instance.new("Frame")
          local TextLabel = Instance.new("TextLabel")
          local LabelC = Instance.new("UICorner")
          
          LabelModule.Name = "LabelModule"
          LabelModule.Parent = Objs
          LabelModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
          LabelModule.BackgroundTransparency = 1.000
          LabelModule.BorderSizePixel = 0
          LabelModule.Position = UDim2.new(0, 0, NAN, 0)
          LabelModule.Size = UDim2.new(0, 428, 0, 19)
          TextLabel.Parent = LabelModule
          TextLabel.BackgroundColor3 = zyColor
          TextLabel.Size = UDim2.new(0, 428, 0, 22)
          TextLabel.Font = Enum.Font.GothamSemibold
          TextLabel.Text = text
          TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
          TextLabel.BackgroundTransparency = DTTransparency
          TextLabel.TextSize = 14.000
    
          LabelC.CornerRadius = UDim.new(0, 6)
          LabelC.Name = "LabelC"
          LabelC.Parent = TextLabel
          return TextLabel
        end
    
          function section.Toggle(section, text, flag, enabled, callback)
            local callback = callback or function() end
            local enabled = enabled or false
            assert(text, "No text provided")
            assert(flag, "No flag provided")
    
            library.flags[flag] = enabled
    
            local ToggleModule = Instance.new("Frame")
            local ToggleBtn = Instance.new("TextButton")
            local ToggleBtnC = Instance.new("UICorner")
            local ToggleDisable = Instance.new("Frame")
            local ToggleSwitch = Instance.new("Frame")
            local ToggleSwitchC = Instance.new("UICorner")
            local ToggleDisableC = Instance.new("UICorner")
            
            ToggleModule.Name = "ToggleModule"
            ToggleModule.Parent = Objs
            ToggleModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleModule.BackgroundTransparency = 1.000
            ToggleModule.BorderSizePixel = 0
            ToggleModule.Position = UDim2.new(0, 0, 0, 0)
            ToggleModule.Size = UDim2.new(0, 428, 0, 38)
            
            ToggleBtn.Name = "ToggleBtn"
            ToggleBtn.Parent = ToggleModule
            ToggleBtn.BackgroundColor3 = zyColor
            ToggleBtn.BackgroundTransparency = DTTransparency
            ToggleBtn.BorderSizePixel = 0
            ToggleBtn.Size = UDim2.new(0, 428, 0, 38)
            ToggleBtn.AutoButtonColor = false
            ToggleBtn.Font = Enum.Font.GothamSemibold
            ToggleBtn.Text = "   " .. text
            ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleBtn.TextSize = 16.000
            ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            ToggleBtnC.CornerRadius = UDim.new(0, 6)
            ToggleBtnC.Name = "ToggleBtnC"
            ToggleBtnC.Parent = ToggleBtn
            
            ToggleDisable.Name = "ToggleDisable"
            ToggleDisable.Parent = ToggleBtn
            ToggleDisable.BackgroundColor3 = Background
            ToggleDisable.BackgroundTransparency = 0.5
            ToggleDisable.BorderSizePixel = 0
            ToggleDisable.Position = UDim2.new(0.901869178, 0, 0.208881587, 0)
            ToggleDisable.Size = UDim2.new(0, 36, 0, 22)
            
            ToggleSwitch.Name = "ToggleSwitch"
            ToggleSwitch.Parent = ToggleDisable
            ToggleSwitch.BackgroundColor3 = beijingColor
            ToggleSwitch.Size = UDim2.new(0, 24, 0, 22)
            
            ToggleSwitchC.CornerRadius = UDim.new(0, 6)
            ToggleSwitchC.Name = "ToggleSwitchC"
            ToggleSwitchC.Parent = ToggleSwitch
            
            ToggleDisableC.CornerRadius = UDim.new(0, 6)
            ToggleDisableC.Name = "ToggleDisableC"
            ToggleDisableC.Parent = ToggleDisable        
    
            local funcs = {
              SetState = function(self, state)
                if state == nil then state = not library.flags[flag] end
                if library.flags[flag] == state then return end
                services.TweenService:Create(ToggleSwitch, TweenInfo.new(0.2), {Position = UDim2.new(0, (state and ToggleSwitch.Size.X.Offset / 2 or 0), 0, 0), BackgroundColor3 = (state and Color3.fromRGB(255, 255, 255) or beijingColor)}):Play()
                library.flags[flag] = state
                callback(state)
              end,
              Module = ToggleModule
            }
            
            if enabled ~= false then
                funcs:SetState(flag,true)
            end
    
            ToggleBtn.MouseButton1Click:Connect(function()
              funcs:SetState()
            end)
            return funcs
          end
    
          function section.Keybind(section, text, default, callback)
            local callback = callback or function() end
            assert(text, "No text provided")
            assert(default, "No default key provided")
    
            local default = (typeof(default) == "string" and Enum.KeyCode[default] or default)
            local banned = {
              Return = true;
              Space = true;
              Tab = true;
              Backquote = true;
              CapsLock = true;
              Escape = true;
              Unknown = true;
            }
            local shortNames = {
              RightControl = 'Right Ctrl',
              LeftControl = 'Left Ctrl',
              LeftShift = 'Left Shift',
              RightShift = 'Right Shift',
              Semicolon = ";",
              Quote = '"',
              LeftBracket = '[',
              RightBracket = ']',
              Equals = '=',
              Minus = '-',
              RightAlt = 'Right Alt',
              LeftAlt = 'Left Alt'
            }
    
            local bindKey = default
            local keyTxt = (default and (shortNames[default.Name] or default.Name) or "None")
    
            local KeybindModule = Instance.new("Frame")
            local KeybindBtn = Instance.new("TextButton")
            local KeybindBtnC = Instance.new("UICorner")
            local KeybindValue = Instance.new("TextButton")
            local KeybindValueC = Instance.new("UICorner")
            local KeybindL = Instance.new("UIListLayout")
            local UIPadding = Instance.new("UIPadding")
    
            KeybindModule.Name = "KeybindModule"
            KeybindModule.Parent = Objs
            KeybindModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            KeybindModule.BackgroundTransparency = 1.000
            KeybindModule.BorderSizePixel = 0
            KeybindModule.Position = UDim2.new(0, 0, 0, 0)
            KeybindModule.Size = UDim2.new(0, 428, 0, 38)
            
            KeybindBtn.Name = "KeybindBtn"
            KeybindBtn.Parent = KeybindModule
            KeybindBtn.BackgroundColor3 = zyColor
            KeybindBtn.BorderSizePixel = 0
            KeybindBtn.Size = UDim2.new(0, 428, 0, 38)
            KeybindBtn.AutoButtonColor = false
            KeybindBtn.Font = Enum.Font.GothamSemibold
            KeybindBtn.Text = "   " .. text
            KeybindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindBtn.TextSize = 16.000
            KeybindBtn.TextXAlignment = Enum.TextXAlignment.Left
            
            KeybindBtnC.CornerRadius = UDim.new(0, 6)
            KeybindBtnC.Name = "KeybindBtnC"
            KeybindBtnC.Parent = KeybindBtn
            
            KeybindValue.Name = "KeybindValue"
            KeybindValue.Parent = KeybindBtn
            KeybindValue.BackgroundColor3 = Background
            KeybindValue.BorderSizePixel = 0
            KeybindValue.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
            KeybindValue.Size = UDim2.new(0, 100, 0, 28)
            KeybindValue.AutoButtonColor = false
            KeybindValue.Font = Enum.Font.Gotham
            KeybindValue.Text = keyTxt
            KeybindValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindValue.TextSize = 14.000
            
            KeybindValueC.CornerRadius = UDim.new(0, 6)
            KeybindValueC.Name = "KeybindValueC"
            KeybindValueC.Parent = KeybindValue
            
            KeybindL.Name = "KeybindL"
            KeybindL.Parent = KeybindBtn
            KeybindL.HorizontalAlignment = Enum.HorizontalAlignment.Right
            KeybindL.SortOrder = Enum.SortOrder.LayoutOrder
            KeybindL.VerticalAlignment = Enum.VerticalAlignment.Center
            
            UIPadding.Parent = KeybindBtn
            UIPadding.PaddingRight = UDim.new(0, 6)   
            
            services.UserInputService.InputBegan:Connect(function(inp, gpe)
              if gpe then return end
              if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
              if inp.KeyCode ~= bindKey then return end
              callback(bindKey.Name)
            end)
            
            KeybindValue.MouseButton1Click:Connect(function()
              KeybindValue.Text = "..."
              wait()
              local key, uwu = services.UserInputService.InputEnded:Wait()
              local keyName = tostring(key.KeyCode.Name)
              if key.UserInputType ~= Enum.UserInputType.Keyboard then
                KeybindValue.Text = keyTxt
                return
              end
              if banned[keyName] then
                KeybindValue.Text = keyTxt
                return
              end
              wait()
              bindKey = Enum.KeyCode[keyName]
              KeybindValue.Text = shortNames[keyName] or keyName
            end)
    
            KeybindValue:GetPropertyChangedSignal("TextBounds"):Connect(function()
              KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
            end)
            KeybindValue.Size = UDim2.new(0, KeybindValue.TextBounds.X + 30, 0, 28)
          end
    
          function section.Textbox(section, text, flag, default, callback)
            local callback = callback or function() end
            assert(text, "No text provided")
            assert(flag, "No flag provided")
            assert(default, "No default text provided")
    
            library.flags[flag] = default
    
            local TextboxModule = Instance.new("Frame")
            local TextboxBack = Instance.new("TextButton")
            local TextboxBackC = Instance.new("UICorner")
            local BoxBG = Instance.new("TextButton")
            local BoxBGC = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
            local TextboxBackL = Instance.new("UIListLayout")
            local TextboxBackP = Instance.new("UIPadding")  
    
            TextboxModule.Name = "TextboxModule"
            TextboxModule.Parent = Objs
            TextboxModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextboxModule.BackgroundTransparency = 1.000
            TextboxModule.BorderSizePixel = 0
            TextboxModule.Position = UDim2.new(0, 0, 0, 0)
            TextboxModule.Size = UDim2.new(0, 428, 0, 38)
            
            TextboxBack.Name = "TextboxBack"
            TextboxBack.Parent = TextboxModule
            TextboxBack.BackgroundColor3 = zyColor
            TextboxBack.BackgroundTransparency = DTTransparency
            TextboxBack.BorderSizePixel = 0
            TextboxBack.Size = UDim2.new(0, 428, 0, 38)
            TextboxBack.AutoButtonColor = false
            TextboxBack.Font = Enum.Font.GothamSemibold
            TextboxBack.Text = "   " .. text
            TextboxBack.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxBack.TextSize = 16.000
            TextboxBack.TextXAlignment = Enum.TextXAlignment.Left
            
            TextboxBackC.CornerRadius = UDim.new(0, 6)
            TextboxBackC.Name = "TextboxBackC"
            TextboxBackC.Parent = TextboxBack
            
            BoxBG.Name = "BoxBG"
            BoxBG.Parent = TextboxBack
            BoxBG.BackgroundColor3 = Background
            BoxBG.BorderSizePixel = 0
            BoxBG.Position = UDim2.new(0.763033211, 0, 0.289473683, 0)
            BoxBG.Size = UDim2.new(0, 100, 0, 28)
            BoxBG.AutoButtonColor = false
            BoxBG.Font = Enum.Font.Gotham
            BoxBG.Text = ""
            BoxBG.TextColor3 = Color3.fromRGB(255, 255, 255)
            BoxBG.TextSize = 14.000
            
            BoxBGC.CornerRadius = UDim.new(0, 6)
            BoxBGC.Name = "BoxBGC"
            BoxBGC.Parent = BoxBG
            
            TextBox.Parent = BoxBG
            TextBox.BackgroundTransparency = DTTransparency
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 1.000
            TextBox.BorderSizePixel = 0
            TextBox.Size = UDim2.new(1, 0, 1, 0)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = default
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14.000
            
            TextboxBackL.Name = "TextboxBackL"
            TextboxBackL.Parent = TextboxBack
            TextboxBackL.HorizontalAlignment = Enum.HorizontalAlignment.Right
            TextboxBackL.SortOrder = Enum.SortOrder.LayoutOrder
            TextboxBackL.VerticalAlignment = Enum.VerticalAlignment.Center
            
            TextboxBackP.Name = "TextboxBackP"
            TextboxBackP.Parent = TextboxBack
            TextboxBackP.PaddingRight = UDim.new(0, 6)
    
            TextBox.FocusLost:Connect(function()
              if TextBox.Text == "" then
                TextBox.Text = default
              end
              library.flags[flag] = TextBox.Text
              callback(TextBox.Text)
            end)
    
            TextBox:GetPropertyChangedSignal("TextBounds"):Connect(function()
              BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
            end)
            BoxBG.Size = UDim2.new(0, TextBox.TextBounds.X + 30, 0, 28)
          end
    
          function section.Slider(section, text, flag, default, min, max, precise, callback)
            local callback = callback or function() end
            local min = min or 1
            local max = max or 10
            local default = default or min
            local precise = precise or false
    
            library.flags[flag] = default
    
            assert(text, "No text provided")
            assert(flag, "No flag provided")
            assert(default, "No default value provided")
            
            local SliderModule = Instance.new("Frame")
            local SliderBack = Instance.new("TextButton")
            local SliderBackC = Instance.new("UICorner")
            local SliderBar = Instance.new("Frame")
            local SliderBarC = Instance.new("UICorner")
            local SliderPart = Instance.new("Frame")
            local SliderPartC = Instance.new("UICorner")
            local SliderValBG = Instance.new("TextButton")
            local SliderValBGC = Instance.new("UICorner")
            local SliderValue = Instance.new("TextBox")
            local MinSlider = Instance.new("TextButton")
            local AddSlider = Instance.new("TextButton")   
            
            SliderModule.Name = "SliderModule"
            SliderModule.Parent = Objs
            SliderModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderModule.BackgroundTransparency = 1.000
            SliderModule.BorderSizePixel = 0
            SliderModule.Position = UDim2.new(0, 0, 0, 0)
            SliderModule.Size = UDim2.new(0, 428, 0, 38)
            
            SliderBack.Name = "SliderBack"
            SliderBack.Parent = SliderModule
            SliderBack.BackgroundColor3 = zyColor
            SliderBack.BackgroundTransparency = DTTransparency
            SliderBack.BorderSizePixel = 0
            SliderBack.Size = UDim2.new(0, 428, 0, 38)
            SliderBack.AutoButtonColor = false
            SliderBack.Font = Enum.Font.GothamSemibold
            SliderBack.Text = "   " .. text
            SliderBack.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderBack.TextSize = 16.000
            SliderBack.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderBackC.CornerRadius = UDim.new(0, 6)
            SliderBackC.Name = "SliderBackC"
            SliderBackC.Parent = SliderBack
            
            SliderBar.Name = "SliderBar"
            SliderBar.Parent = SliderBack
            SliderBar.AnchorPoint = Vector2.new(0, 0.5)
            SliderBar.BackgroundColor3 = Background
            SliderBar.BackgroundTransparency = DTTransparency
            SliderBar.BorderSizePixel = 0
            SliderBar.Position = UDim2.new(0.369000018, 40, 0.5, 0)
            SliderBar.Size = UDim2.new(0, 140, 0, 12)
            
            SliderBarC.CornerRadius = UDim.new(0, 4)
            SliderBarC.Name = "SliderBarC"
            SliderBarC.Parent = SliderBar
            
            SliderPart.Name = "SliderPart"
            SliderPart.Parent = SliderBar
            SliderPart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderPart.BorderSizePixel = 0
            SliderPart.Size = UDim2.new(0, 54, 0, 13)
            
            SliderPartC.CornerRadius = UDim.new(0, 4)
            SliderPartC.Name = "SliderPartC"
            SliderPartC.Parent = SliderPart
            
            SliderValBG.Name = "SliderValBG"
            SliderValBG.Parent = SliderBack
            SliderValBG.BackgroundColor3 = Background
            SliderValBG.BackgroundTransparency = DTTransparency
            SliderValBG.BorderSizePixel = 0
            SliderValBG.Position = UDim2.new(0.883177578, 0, 0.131578952, 0)
            SliderValBG.Size = UDim2.new(0, 44, 0, 28)
            SliderValBG.AutoButtonColor = false
            SliderValBG.Font = Enum.Font.Gotham
            SliderValBG.Text = ""
            SliderValBG.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValBG.TextSize = 14.000
            
            SliderValBGC.CornerRadius = UDim.new(0, 6)
            SliderValBGC.Name = "SliderValBGC"
            SliderValBGC.Parent = SliderValBG
            
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = SliderValBG
            SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.BorderSizePixel = 0
            SliderValue.Size = UDim2.new(1, 0, 1, 0)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = "1000"
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 14.000
            
            MinSlider.Name = "MinSlider"
            MinSlider.Parent = SliderModule
            MinSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MinSlider.BackgroundTransparency = 1.000
            MinSlider.BorderSizePixel = 0
            MinSlider.Position = UDim2.new(0.296728969, 40, 0.236842096, 0)
            MinSlider.Size = UDim2.new(0, 20, 0, 20)
            MinSlider.Font = Enum.Font.Gotham
            MinSlider.Text = "-"
            MinSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
            MinSlider.TextSize = 24.000
            MinSlider.TextWrapped = true
            
            AddSlider.Name = "AddSlider"
            AddSlider.Parent = SliderModule
            AddSlider.AnchorPoint = Vector2.new(0, 0.5)
            AddSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            AddSlider.BackgroundTransparency = 1.000
            AddSlider.BorderSizePixel = 0
            AddSlider.Position = UDim2.new(0.810906529, 0, 0.5, 0)
            AddSlider.Size = UDim2.new(0, 20, 0, 20)
            AddSlider.Font = Enum.Font.Gotham
            AddSlider.Text = "+"
            AddSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
            AddSlider.TextSize = 24.000
            AddSlider.TextWrapped = true
            
            local funcs = {
              SetValue = function(self, value)
                local percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
                if value then
                  percent = (value - min) / (max - min)
                end
                percent = math.clamp(percent, 0, 1)
                if precise then
                  value = value or tonumber(string.format("%.1f", tostring(min + (max - min) * percent)))
                else
                  value = value or math.floor(min + (max - min) * percent)
                end
                library.flags[flag] = tonumber(value)
                SliderValue.Text = tostring(value)
                SliderPart.Size = UDim2.new(percent, 0, 1, 0)
                callback(tonumber(value))
              end
            }
    
            MinSlider.MouseButton1Click:Connect(function()
              local currentValue = library.flags[flag]
              currentValue = math.clamp(currentValue - 1, min, max)
              funcs:SetValue(currentValue)
            end)
    
            AddSlider.MouseButton1Click:Connect(function()
              local currentValue = library.flags[flag]
              currentValue = math.clamp(currentValue + 1, min, max)
              funcs:SetValue(currentValue)
            end)
            
            funcs:SetValue(default)
    
            local dragging, boxFocused, allowed = false, false, {
              [""] = true,
              ["-"] = true
            }
    
            SliderBar.InputBegan:Connect(function(input)
              if input.UserInputType == Enum.UserInputType.MouseButton1 then
                funcs:SetValue()
                dragging = true
              end
            end)
    
            services.UserInputService.InputEnded:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
              end
            end)
    
            services.UserInputService.InputChanged:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                funcs:SetValue()
              end
            end)

            SliderBar.InputBegan:Connect(function(input)
              if input.UserInputType == Enum.UserInputType.Touch then
                funcs:SetValue()
                dragging = true
              end
            end)
    
            services.UserInputService.InputEnded:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
              end
            end)
    
            services.UserInputService.InputChanged:Connect(function(input)
              if dragging and input.UserInputType == Enum.UserInputType.Touch then
                funcs:SetValue()
              end
            end)
    
            SliderValue.Focused:Connect(function()
              boxFocused = true
            end)
    
            SliderValue.FocusLost:Connect(function()
              boxFocused = false
              if SliderValue.Text == "" then
                funcs:SetValue(default)
              end
            end)
    
            SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
              if not boxFocused then return end
              SliderValue.Text = SliderValue.Text:gsub("%D+", "")
              
              local text = SliderValue.Text
              
              if not tonumber(text) then
                SliderValue.Text = SliderValue.Text:gsub('%D+', '')
              elseif not allowed[text] then
                if tonumber(text) > max then
                  text = max
                  SliderValue.Text = tostring(max)
                end
                funcs:SetValue(tonumber(text))
              end
            end)
    
            return funcs
          end
          function section.Dropdown(section, text, flag, options, callback)
            local callback = callback or function() end
            local options = options or {}
            assert(text, "No text provided")
            assert(flag, "No flag provided")
    
            library.flags[flag] = nil
            
            local DropdownModule = Instance.new("Frame")
            local DropdownTop = Instance.new("TextButton")
            local DropdownTopC = Instance.new("UICorner")
            local DropdownOpen = Instance.new("TextButton")
            local DropdownText = Instance.new("TextBox")
            local DropdownModuleL = Instance.new("UIListLayout")
            local Option = Instance.new("TextButton")
            local OptionC = Instance.new("UICorner")        

            DropdownModule.Name = "DropdownModule"
            DropdownModule.BackgroundTransparency = DTTransparency
            DropdownModule.Parent = Objs
            DropdownModule.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownModule.BackgroundTransparency = 1.000
            
            DropdownModule.BorderSizePixel = 0
            DropdownModule.ClipsDescendants = true
            DropdownModule.Position = UDim2.new(0, 0, 0, 0)
            DropdownModule.Size = UDim2.new(0, 428, 0, 38)
            
            DropdownTop.Name = "DropdownTop"
            DropdownTop.Parent = DropdownModule
            DropdownTop.BackgroundColor3 = zyColor
            DropdownTop.BackgroundTransparency = DTTransparency
            DropdownTop.BorderSizePixel = 0
            DropdownTop.Size = UDim2.new(0, 428, 0, 38)
            DropdownTop.AutoButtonColor = false
            DropdownTop.Font = Enum.Font.GothamSemibold
            DropdownTop.Text = ""
            DropdownTop.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTop.TextSize = 16.000
            DropdownTop.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownTopC.CornerRadius = UDim.new(0, 6)
            DropdownTopC.Name = "DropdownTopC"
            DropdownTopC.Parent = DropdownTop
            
            DropdownOpen.Name = "DropdownOpen"
            DropdownOpen.Parent = DropdownTop
            DropdownOpen.AnchorPoint = Vector2.new(0, 0.5)
            DropdownOpen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownOpen.BackgroundTransparency = 1.000
            DropdownOpen.BorderSizePixel = 0
            DropdownOpen.Position = UDim2.new(0.918383181, 0, 0.5, 0)
            DropdownOpen.Size = UDim2.new(0, 20, 0, 20)
            DropdownOpen.Font = Enum.Font.Gotham
            DropdownOpen.Text = "+"
            DropdownOpen.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownOpen.TextSize = 24.000
            DropdownOpen.TextWrapped = true
            
            DropdownText.Name = "DropdownText"
            DropdownText.Parent = DropdownTop
            DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.BackgroundTransparency = 1.000
            DropdownText.BorderSizePixel = 0
            DropdownText.Position = UDim2.new(0.0373831764, 0, 0, 0)
            DropdownText.Size = UDim2.new(0, 184, 0, 38)
            DropdownText.Font = Enum.Font.GothamSemibold
            DropdownText.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.PlaceholderText = text
            DropdownText.BackgroundTransparency = DTTransparency
            DropdownText.Text = ""
            DropdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownText.TextSize = 16.000
            DropdownText.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownModuleL.Name = "DropdownModuleL"
            DropdownModuleL.Parent = DropdownModule
            DropdownModuleL.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownModuleL.Padding = UDim.new(0, 4)
    
            local setAllVisible = function()
              local options = DropdownModule:GetChildren() 
              for i=1, #options do
                local option = options[i]
                if option:IsA("TextButton") and option.Name:match("Option_") then
                  option.Visible = true
                end
              end
            end
    
            local searchDropdown = function(text)
              local options = DropdownModule:GetChildren()
              for i=1, #options do
                local option = options[i]
                if text == "" then
                  setAllVisible()
                else
                  if option:IsA("TextButton") and option.Name:match("Option_") then
                    if option.Text:lower():match(text:lower()) then
                      option.Visible = true
                    else
                      option.Visible = false
                    end
                  end
                end
              end
            end
    
            local open = false
            local ToggleDropVis = function()
              open = not open
              if open then setAllVisible() end
              DropdownOpen.Text = (open and "-" or "+")
              DropdownModule.Size = UDim2.new(0, 428, 0, (open and DropdownModuleL.AbsoluteContentSize.Y + 4 or 38))
            end
    
            DropdownOpen.MouseButton1Click:Connect(ToggleDropVis)
            DropdownText.Focused:Connect(function()
              if open then return end
              ToggleDropVis()
            end)
    
            DropdownText:GetPropertyChangedSignal("Text"):Connect(function()
              if not open then return end
              searchDropdown(DropdownText.Text)
            end)
    
            DropdownModuleL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
              if not open then return end
              DropdownModule.Size = UDim2.new(0, 428, 0, (DropdownModuleL.AbsoluteContentSize.Y + 4))
            end)
            
            local funcs = {}
            funcs.AddOption = function(self, option)
              local Option = Instance.new("TextButton")
              local OptionC = Instance.new("UICorner")     
    
              Option.Name = "Option_" .. option
              Option.Parent = DropdownModule
              Option.BackgroundColor3 = zyColor
              Option.BorderSizePixel = 0
              Option.Position = UDim2.new(0, 0, 0.328125, 0)
              Option.Size = UDim2.new(0, 428, 0, 26)
              Option.AutoButtonColor = false
              Option.Font = Enum.Font.Gotham
              Option.BackgroundTransparency = DTTransparency
              Option.Text = option
              Option.TextColor3 = Color3.fromRGB(255, 255, 255)
              Option.TextSize = 14.000
              
              OptionC.CornerRadius = UDim.new(0, 6)
              OptionC.Name = "OptionC"
              OptionC.Parent = Option
    
              Option.MouseButton1Click:Connect(function()
                ToggleDropVis()
                callback(Option.Text)
                DropdownText.Text = Option.Text
                library.flags[flag] = Option.Text
              end)
            end
    
            funcs.RemoveOption = function(self, option)
              local option = DropdownModule:FindFirstChild("Option_" .. option)
              if option then option:Destroy() end
            end
    
            funcs.SetOptions = function(self, options)
              for _, v in next, DropdownModule:GetChildren() do
                if v.Name:match("Option_") then
                  v:Destroy()
                end
              end
              for _,v in next, options do
                funcs:AddOption(v)
              end
            end
    
            funcs:SetOptions(options)
    
            return funcs
          end
          return section
        end
        return tab
      end
      return window

    end
return library
extXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,ak and-af.IconSize-14 or 0,0,0)
})

local am=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
ak,al
})

local an=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





am,
})

local ao
if af.Content and af.Content~=""then
ao=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=af.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ap=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local aq
if af.Thumbnail and af.Thumbnail.Image then
local ar
if af.Thumbnail.Title then
ar=ac("TextLabel",{
Text=af.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
aq=ac("ImageLabel",{
Image=af.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ai,1,0),
Parent=ah.UIElements.Main,
ScaleType="Crop"
},{
ar,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,aq and-ai or 0,1,0),
Position=UDim2.new(0,aq and ai or 0,0,0),
BackgroundTransparency=1,
Parent=ah.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
an,
ao,
ap,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local ar=a.load'j'.New

for as,at in next,af.Buttons do
ar(at.Title,at.Icon,at.Callback,at.Variant,ap,ah)
end

ah:Open()


return af
end

return aa end function a.s()
local aa={}

local ab=a.load'a'
local ac=ab.New local ad=
ab.Tween


function aa.New(ae,af,ag)
local ah=10
local ai
if af and af~=""then
ai=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ai and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=ae,
})

local ak=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(ah,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
}),
ab.NewRoundFrame(ah,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
},{
ac("UIGradient",{
Rotation=70,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),
ab.NewRoundFrame(ah,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ai,
aj,
})
})
})

return ak
end


return aa end function a.t()
local aa={}

local ab=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween


function aa.New(af,ag,ah,ai)
local aj=ad("Frame",{
Size=UDim2.new(0,ai,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ag,
ZIndex=999,
Active=true,
})

local ak=ac.NewRoundFrame(ai/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=aj,
})

local al=ad("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=ak,
})

local am=false
local an=0

local function updateSliderSize()
local ao=af
local ap=ao.AbsoluteCanvasSize.Y
local aq=ao.AbsoluteWindowSize.Y

if ap<=aq then
ak.Visible=false
return
end

local ar=math.clamp(aq/ap,0.1,1)
ak.Size=UDim2.new(1,0,ar,0)
ak.Visible=true
end

local function updateScrollingFramePosition()
local ao=ak.Position.Y.Scale
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then return end

local as=math.max(1-ak.Size.Y.Scale,0)
if as<=0 then return end

local at=ao/as

af.CanvasPosition=Vector2.new(
af.CanvasPosition.X,
at*ar
)
end

local function updateThumbPosition()
if am then return end

local ao=af.CanvasPosition.Y
local ap=af.AbsoluteCanvasSize.Y
local aq=af.AbsoluteWindowSize.Y
local ar=math.max(ap-aq,0)

if ar<=0 then
ak.Position=UDim2.new(0,0,0,0)
return
end

local as=ao/ar
local at=math.max(1-ak.Size.Y.Scale,0)
local au=math.clamp(as*at,0,at)

ak.Position=UDim2.new(0,0,au,0)
end

ac.AddSignal(aj.InputBegan,function(ao)
if(ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch)then
local ap=ak.AbsolutePosition.Y
local aq=ap+ak.AbsoluteSize.Y

if not(ao.Position.Y>=ap and ao.Position.Y<=aq)then
local ar=aj.AbsolutePosition.Y
local as=aj.AbsoluteSize.Y
local at=ak.AbsoluteSize.Y

local au=ao.Position.Y-ar-at/2
local av=as-at

local aw=math.clamp(au/av,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,aw,0)
updateScrollingFramePosition()
end
end
end)

ac.AddSignal(al.InputBegan,function(ao)
if ao.UserInputType==Enum.UserInputType.MouseButton1 or ao.UserInputType==Enum.UserInputType.Touch then
am=true
an=ao.Position.Y-ak.AbsolutePosition.Y

local ap
local aq

ap=ab.InputChanged:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseMovement or ar.UserInputType==Enum.UserInputType.Touch then
local as=aj.AbsolutePosition.Y
local at=aj.AbsoluteSize.Y
local au=ak.AbsoluteSize.Y

local av=ar.Position.Y-as-an
local aw=at-au

local ax=math.clamp(av/aw,0,1-ak.Size.Y.Scale)

ak.Position=UDim2.new(0,0,ax,0)
updateScrollingFramePosition()
end
end)

aq=ab.InputEnded:Connect(function(ar)
if ar.UserInputType==Enum.UserInputType.MouseButton1 or ar.UserInputType==Enum.UserInputType.Touch then
am=false
if ap then ap:Disconnect()end
if aq then aq:Disconnect()end
end
end)
end
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteWindowSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"AbsoluteCanvasSize",function()
updateSliderSize()
updateThumbPosition()
end)

ac.AddSignal(af:GetPropertyChangedSignal"CanvasPosition",function()
if not am then
updateThumbPosition()
end
end)

updateSliderSize()
updateThumbPosition()

return aj
end


return aa end function a.u()
local aa={}


local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local function Color3ToHSB(ae)
local af,ag,ah=ae.R,ae.G,ae.B
local ai=math.max(af,ag,ah)
local aj=math.min(af,ag,ah)
local ak=ai-aj

local al=0
if ak~=0 then
if ai==af then
al=(ag-ah)/ak%6
elseif ai==ag then
al=(ah-af)/ak+2
else
al=(af-ag)/ak+4
end
al=al*60
else
al=0
end

local am=(ai==0)and 0 or(ak/ai)
local an=ai

return{
h=math.floor(al+0.5),
s=am,
b=an
}
end

local function GetPerceivedBrightness(ae)
local af=ae.R
local ag=ae.G
local ah=ae.B
return 0.299*af+0.587*ag+0.114*ah
end

local function GetTextColorForHSB(ae)
local af=Color3ToHSB(ae)local
ag, ah, ai=af.h, af.s, af.b
if GetPerceivedBrightness(ae)>0.5 then
return Color3.fromHSV(ag/360,0,0.05)
else
return Color3.fromHSV(ag/360,0,0.98)
end
end

local function GetAverageColor(ae)
local af,ag,ah=0,0,0
local ai=ae.Color.Keypoints
for aj,ak in ipairs(ai)do

af=af+ak.Value.R
ag=ag+ak.Value.G
ah=ah+ak.Value.B
end
local al=#ai
return Color3.new(af/al,ag/al,ah/al)
end


function aa.New(ae,af,ag)
local ah={
Title=af.Title or"Tag",
Color=af.Color or Color3.fromHex"#315dff",
Radius=af.Radius or 999,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
}

local ai=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ah.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ah.Title,
TextColor3=typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)or nil,
})

local aj

if typeof(ah.Color)=="table"then

aj=ac"UIGradient"
for ak,al in next,ah.Color do
aj[ak]=al
end

ai.TextColor3=GetTextColorForHSB(GetAverageColor(aj))
end



local ak=ab.NewRoundFrame(ah.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ah.Height),
Parent=ag,
ImageColor3=typeof(ah.Color)=="Color3"and ah.Color or Color3.new(1,1,1),
},{
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ah.Padding),
PaddingRight=UDim.new(0,ah.Padding),
}),
ai,
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
})
})


function ah.SetTitle(al,am)
ah.Title=am
ai.Text=am
end

function ah.SetColor(al,am)
ah.Color=am
if typeof(am)=="table"then
local an=GetAverageColor(am)
ad(ai,.06,{TextColor3=GetTextColorForHSB(an)}):Play()
local ao=ak:FindFirstChildOfClass"UIGradient"or ac("UIGradient",{Parent=ak})
for ap,aq in next,am do ao[ap]=aq end
ad(ak,.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if aj then
aj:Destroy()
end
ad(ai,.06,{TextColor3=GetTextColorForHSB(am)}):Play()
ad(ak,.06,{ImageColor3=am}):Play()
end
end


return ah
end


return aa end function a.v()

local aa=game:GetService"HttpService"

local ab

local ac
ac={

Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Default:ToHex(),
transparency=ad.Transparency or nil,
}
end,
Load=function(ad,ae)
if ad then
ad:Update(Color3.fromHex(ae.value),ae.transparency or nil)
end
end
},
Dropdown={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Select(ae.value)
end
end
},
Input={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Keybind={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Slider={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value.Default,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
Toggle={
Save=function(ad)
return{
__type=ad.__type,
value=ad.Value,
}
end,
Load=function(ad,ae)
if ad then
ad:Set(ae.value)
end
end
},
}
}

function ac.Init(ad,ae)
if not ae.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end

ab=ae
ac.Folder=ab.Folder
ac.Path="WindUI/"..tostring(ac.Folder).."/config/"

if not isfolder("WindUI/"..ac.Folder)then
makefolder("WindUI/"..ac.Folder)
if not isfolder("WindUI/"..ac.Folder.."/config/")then
makefolder("WindUI/"..ac.Folder.."/config/")
end
end

local af=ac:AllConfigs()

for ag,ah in next,af do
if isfile(ah..".json")then
ac.Configs[ah]=readfile(ah..".json")
end
end


return ac
end

function ac.CreateConfig(ad,ae)
local af={
Path=ac.Path..ae..".json",
Elements={},
CustomData={},
Version=1.1
}

if not ae then
return false,"No config file is selected"
end

function af.Register(ag,ah,ai)
af.Elements[ah]=ai
end

function af.Set(ag,ah,ai)
af.CustomData[ah]=ai
end

function af.Get(ag,ah)
return af.CustomData[ah]
end

function af.Save(ag)
local ah={
__version=af.Version,
__elements={},
__custom=af.CustomData
}

for ai,aj in next,af.Elements do
if ac.Parser[aj.__type]then
ah.__elements[tostring(ai)]=ac.Parser[aj.__type].Save(aj)
end
end

local ak=aa:JSONEncode(ah)
writefile(af.Path,ak)
end

function af.Load(ag)
if not isfile(af.Path)then
return false,"Config file does not exist"
end

local ah,ai=pcall(function()
return aa:JSONDecode(readfile(af.Path))
end)

if not ah then
return false,"Failed to parse config file"
end

if not ai.__version then
local aj={
__version=af.Version,
__elements=ai,
__custom={}
}
ai=aj
end

for aj,ak in next,(ai.__elements or{})do
if af.Elements[aj]and ac.Parser[ak.__type]then
task.spawn(function()
ac.Parser[ak.__type].Load(af.Elements[aj],ak)
end)
end
end

af.CustomData=ai.__custom or{}

return af.CustomData
end

function af.GetData(ag)
return{
elements=af.Elements,
custom=af.CustomData
}
end

ac.Configs[ae]=af
return af
end

function ac.AllConfigs(ad)
if not listfiles then return{}end

local ae={}
if not isfolder(ac.Path)then
makefolder(ac.Path)
return ae
end

for af,ag in next,listfiles(ac.Path)do
local ah=ag:match"([^\\/]+)%.json$"
if ah then
table.insert(ae,ah)
end
end

return ae
end

function ac.GetConfig(ad,ae)
return ac.Configs[ae]
end

return ac end function a.w()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween

local ae=game:GetService"UserInputService"


function aa.New(af)
local ag={
Button=nil
}

local ah













local ai=ac("TextLabel",{
Text=af.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local aj=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
local ak=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local al=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=af.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
local am=ac("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=al,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
aj,
ak,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ah,
ac("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai,
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

ag.Button=am



function ag.SetIcon(an,ao)
if ah then
ah:Destroy()
end
if ao then
ah=ab.Image(
ao,
af.Title,
0,
af.Folder,
"OpenButton",
true,
af.IconThemed
)
ah.Size=UDim2.new(0,22,0,22)
ah.LayoutOrder=-1
ah.Parent=ag.Button.TextButton
end
end

if af.Icon then
ag:SetIcon(af.Icon)
end



ab.AddSignal(am:GetPropertyChangedSignal"AbsoluteSize",function()
al.Size=UDim2.new(
0,am.AbsoluteSize.X,
0,am.AbsoluteSize.Y
)
end)

ab.AddSignal(am.TextButton.MouseEnter,function()
ad(am.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(am.TextButton.MouseLeave,function()
ad(am.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local an=ab.Drag(al)


function ag.Visible(ao,ap)
al.Visible=ap
end

function ag.Edit(ao,ap)
local aq={
Title=ap.Title,
Icon=ap.Icon,
Enabled=ap.Enabled,
Position=ap.Position,
Draggable=ap.Draggable,
OnlyMobile=ap.OnlyMobile,
CornerRadius=ap.CornerRadius or UDim.new(1,0),
StrokeThickness=ap.StrokeThickness or 2,
Color=ap.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if aq.Enabled==false then
af.IsOpenButtonEnabled=false
end
if aq.Draggable==false and aj and ak then
aj.Visible=aq.Draggable
ak.Visible=aq.Draggable

if an then
an:Set(aq.Draggable)
end
end
if aq.Position and OpenButtonContainer then
OpenButtonContainer.Position=aq.Position

end

local ar=ae.KeyboardEnabled or not ae.TouchEnabled
aa.Visible=not aq.OnlyMobile or not ar

if not aa.Visible then return end

if ai then
if aq.Title then
ai.Text=aq.Title
ab:ChangeTranslationKey(ai,aq.Title)
elseif aq.Title==nil then

end
end

if aq.Icon then
ag:SetIcon(aq.Icon)
end

am.UIStroke.UIGradient.Color=aq.Color
if Glow then
Glow.UIGradient.Color=aq.Color
end

am.UICorner.CornerRadius=aq.CornerRadius
am.TextButton.UICorner.CornerRadius=UDim.new(aq.CornerRadius.Scale,aq.CornerRadius.Offset-4)
am.UIStroke.Thickness=aq.StrokeThickness
end

return ag
end



return aa end function a.x()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af)
local ag={
Container=nil,
ToolTipSize=16,
}

local ah=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=17,
TextTransparency=1,
ThemeTag={
TextColor3="Text",
}
})

local ai=ac("UIScale",{
Scale=.9
})

local aj=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Accent",
},
},{
ac("ImageLabel",{
Size=UDim2.new(0,ag.ToolTipSize,0,ag.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
ab.NewRoundFrame(14,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

ah,
ac("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
ai,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ag.Container=aj

function ag.Open(ak)
aj.Visible=true


ad(aj.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ah,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ag.Close(ak)

ad(aj.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ah,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ai,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.35)

aj.Visible=false
aj:Destroy()
end

return ag
end



return aa end function a.y()
local aa=a.load'a'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

game:GetService"UserInputService"


local function Color3ToHSB(ae)
local af,ag,ah=ae.R,ae.G,ae.B
local ai=math.max(af,ag,ah)
local aj=math.min(af,ag,ah)
local ak=ai-aj

local al=0
if ak~=0 then
if ai==af then
al=(ag-ah)/ak%6
elseif ai==ag then
al=(ah-af)/ak+2
else
al=(af-ag)/ak+4
end
al=al*60
else
al=0
end

local am=(ai==0)and 0 or(ak/ai)
local an=ai

return{
h=math.floor(al+0.5),
s=am,
b=an
}
end

local function GetPerceivedBrightness(ae)
local af=ae.R
local ag=ae.G
local ah=ae.B
return 0.299*af+0.587*ag+0.114*ah
end

local function GetTextColorForHSB(ae)
local af=Color3ToHSB(ae)local
ag, ah, ai=af.h, af.s, af.b
if GetPerceivedBrightness(ae)>0.5 then
return Color3.fromHSV(ag/360,0,0.05)
else
return Color3.fromHSV(ag/360,0,0.98)
end
end

return function(ae)
local af={
Title=ae.Title,
Desc=ae.Desc or nil,
Hover=ae.Hover,
Thumbnail=ae.Thumbnail,
ThumbnailSize=ae.ThumbnailSize or 80,
Image=ae.Image,
IconThemed=ae.IconThemed or false,
ImageSize=ae.ImageSize or 30,
Color=ae.Color,
Scalable=ae.Scalable,
Parent=ae.Parent,
UIPadding=13,
UICorner=12,
UIElements={}
}

local ag=af.ImageSize
local ah=af.ThumbnailSize
local ai=true


local aj=0

local ak
local al
if af.Thumbnail then
ak=aa.Image(
af.Thumbnail,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Thumbnail",
false,
af.IconThemed
)
ak.Size=UDim2.new(1,0,0,ah)
end
if af.Image then
al=aa.Image(
af.Image,
af.Title,
af.UICorner-3,
ae.Window.Folder,
"Image",
not af.Color and true or false
)
if typeof(af.Color)=="string"then
al.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
elseif typeof(af.Color)=="Color3"then
al.ImageLabel.ImageColor3=GetTextColorForHSB(af.Color)
end

al.Size=UDim2.new(0,ag,0,ag)

aj=ag
end

local function CreateText(am,an)
local ao=typeof(af.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
or typeof(af.Color)=="Color3"
and GetTextColorForHSB(af.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=am or"",
TextSize=an=="Desc"and 14 or 16,
TextXAlignment="Left",
ThemeTag={
TextColor3=not af.Color and"Text"or nil,
},
TextColor3=af.Color and ao or nil,
TextTransparency=an=="Desc"and.25 or 0,
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium)
})
end

local am=CreateText(af.Title,"Title")
local an=CreateText(af.Desc,"Desc")
if not af.Desc or af.Desc==""then
an.Visible=false
end

af.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
ak,
ab("Frame",{
Size=UDim2.new(1,-ae.TextOffset,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Top",
HorizontalAlignment="Left",
}),
al,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,-aj,0,(50-(af.UIPadding*2)))
},{
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
am,
an
}),
})
})

af.UIElements.Locked=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,af.UIPadding*2,1,af.UIPadding*2),
ImageTransparency=.4,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
ZIndex=9999999,
})

af.UIElements.Main=ac(af.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,50),
AutomaticSize="Y",
ImageTransparency=af.Color and.05 or.95,



Parent=ae.Parent,
ThemeTag={
ImageColor3=not af.Color and"Text"or nil
},
ImageColor3=af.Color and
(
typeof(af.Color)=="string"
and Color3.fromHex(aa.Colors[af.Color])
or typeof(af.Color)=="Color3"
and af.Color
)or nil
},{
af.UIElements.Container,
af.UIElements.Locked,
ab("UIPadding",{
PaddingTop=UDim.new(0,af.UIPadding),
PaddingLeft=UDim.new(0,af.UIPadding),
PaddingRight=UDim.new(0,af.UIPadding),
PaddingBottom=UDim.new(0,af.UIPadding),
}),
},true)

if af.Hover then
aa.AddSignal(af.UIElements.Main.MouseEnter,function()
if ai then
ad(af.UIElements.Main,.05,{ImageTransparency=af.Color and.15 or.9}):Play()
end
end)
aa.AddSignal(af.UIElements.Main.InputEnded,function()
if ai then
ad(af.UIElements.Main,.05,{ImageTransparency=af.Color and.05 or.95}):Play()
end
end)
end

function af.SetTitle(ao,ap)
am.Text=ap
end

function af.SetDesc(ao,ap)
an.Text=ap or""
if not ap then
an.Visible=false
elseif not an.Visible then
an.Visible=true
end
end






function af.Destroy(ao)
af.UIElements.Main:Destroy()
end


function af.Lock(ao)
ai=false
af.UIElements.Locked.Active=true
af.UIElements.Locked.Visible=true
end

function af.Unlock(ao)
ai=true
af.UIElements.Locked.Active=false
af.UIElements.Locked.Visible=false
end





return af
end end function a.z()
local aa=a.load'a'
local ab=aa.New

local ac={}

local ad=a.load'j'.New

function ac.New(ae,af)
af.Hover=false
af.TextOffset=0
af.IsButtons=af.Buttons and#af.Buttons>0 and true or false

local ag={
__type="Paragraph",
Title=af.Title or"Paragraph",
Desc=af.Desc or nil,

Locked=af.Locked or false,
}
local ah=a.load'y'(af)

ag.ParagraphFrame=ah
if af.Buttons and#af.Buttons>0 then
local ai=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.UIElements.Container
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for aj,ak in next,af.Buttons do
local al=ad(ak.Title,ak.Icon,ak.Callback,"White",ai)
al.Size=UDim2.new(1,0,0,38)

end
end

return ag.__type,ag

end

return ac end function a.A()
local aa=a.load'a'
local ab=aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Locked=ae.Locked or false,
Callback=ae.Callback or function()end,
UIElements={}
}

local ag=true

af.ButtonFrame=a.load'y'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
TextOffset=20,
Hover=true,
Scalable=true,
}

af.UIElements.ButtonIcon=ab("ImageLabel",{
Image=aa.Icon"mouse-pointer-click"[1],
ImageRectOffset=aa.Icon"mouse-pointer-click"[2].ImageRectPosition,
ImageRectSize=aa.Icon"mouse-pointer-click"[2].ImageRectSize,
BackgroundTransparency=1,
Parent=af.ButtonFrame.UIElements.Main,
Size=UDim2.new(0,20,0,20),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ThemeTag={
ImageColor3="Text"
}
})

function af.Lock(ah)
ag=false
return af.ButtonFrame:Lock()
end
function af.Unlock(ah)
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.B()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}


local aj=13
local ak
if af and af~=""then
ak=ac("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,42,0,26),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),
Name="Frame",
},{
ak,
})
})

function ai.Set(am,an)
if an then
ad(al.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=0,
}):Play()
end
else
ad(al.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al.Layer,0.1,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if ak then
ad(ak,0.1,{
ImageTransparency=1,
}):Play()
end
end

task.spawn(function()
if ah then
ab.SafeCallback(ah,an)
end
end)


end

return al,ai
end


return aa end function a.C()
local aa={}

local ab=a.load'a'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah)
local ai={}

af=af or"check"

local aj=10
local ak=ac("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(af)[1],
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local al=ab.NewRoundFrame(aj,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=ag,
Size=UDim2.new(0,27,0,27),
},{
ab.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

ak,
})

function ai.Set(am,an)
if an then
ad(al.Layer,0.06,{
ImageTransparency=0,
}):Play()
ad(al.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
ad(ak,0.06,{
ImageTransparency=0,
}):Play()
else
ad(al.Layer,0.05,{
ImageTransparency=1,
}):Play()
ad(al.Stroke,0.05,{
ImageTransparency=1,
}):Play()
ad(ak,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ah then
ab.SafeCallback(ah,an)
end
end)
end

return al,ai
end


return aa end function a.D()
local aa=a.load'a'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'B'.New
local ae=a.load'C'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Value=ah.Value,
Icon=ah.Icon or nil,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={}
}
ai.ToggleFrame=a.load'y'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=44,
Hover=false,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end



function ai.Lock(ak)
aj=false
return ai.ToggleFrame:Lock()
end
function ai.Unlock(ak)
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
elseif ai.Type=="Checkbox"then
al,am=ae(ak,ai.Icon,ai.ToggleFrame.UIElements.Main,ai.Callback)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,0.5)
al.Position=UDim2.new(1,0,0.5,0)

function ai.Set(an,ao)
if aj then
am:Set(ao)
ak=ao
ai.Value=ao
end
end

ai:Set(ak)

aa.AddSignal(ai.ToggleFrame.UIElements.Main.MouseButton1Click,function()
ai:Set(not ak)
end)

return ai.__type,ai
end

return af end function a.E()
local aa=a.load'a'
local ac=aa.New
local ad=aa.Tween

local ae={}

local af=false

function ae.New(ag,ah)
local ai={
__type="Slider",
Title=ah.Title or"Slider",
Desc=ah.Desc or nil,
Locked=ah.Locked or nil,
Value=ah.Value or{},
Step=ah.Step or 1,
Callback=ah.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=130,
TextBoxWidth=30,
}
local aj
local ak
local al
local am=ai.Value.Default or ai.Value.Min or 0

local an=am
local ao=(am-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0))

local ap=true
local aq=ai.Step%1~=0

local function FormatValue(ar)
if aq then
return string.format("%.2f",ar)
else
return tostring(math.floor(ar+0.5))
end
end

local function CalculateValue(ar)
if aq then
return math.floor(ar/ai.Step+0.5)*ai.Step
else
return math.floor(ar/ai.Step+0.5)*ai.Step
end
end

ai.SliderFrame=a.load'y'{
Title=ai.Title,
Desc=ai.Desc,
Parent=ah.Parent,
TextOffset=ai.Width,
Hover=false,
}

ai.UIElements.SliderIcon=aa.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(1,-ai.TextBoxWidth-8,0,4),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ao,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
aa.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

ai.UIElements.SliderContainer=ac("Frame",{
Size=UDim2.new(0,ai.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,0,.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=ai.SliderFrame.UIElements.Main,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai.UIElements.SliderIcon,
ac("TextBox",{
Size=UDim2.new(0,ai.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(am),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function ai.Lock(ar)
ap=false
return ai.SliderFrame:Lock()
end
function ai.Unlock(ar)
ap=true
return ai.SliderFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ar=ai.SliderFrame.Parent:IsA"ScrollingFrame"and ai.SliderFrame.Parent or ai.SliderFrame.Parent.Parent.Parent

function ai.Set(as,at,au)
if ap then
if not ai.IsFocusing and not af and(not au or(au.UserInputType==Enum.UserInputType.MouseButton1 or au.UserInputType==Enum.UserInputType.Touch))then
at=math.clamp(at,ai.Value.Min or 0,ai.Value.Max or 100)

local av=math.clamp((at-(ai.Value.Min or 0))/((ai.Value.Max or 100)-(ai.Value.Min or 0)),0,1)
at=CalculateValue(ai.Value.Min+av*(ai.Value.Max-ai.Value.Min))

if at~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(av,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(at)
ai.Value.Default=FormatValue(at)
an=at
aa.SafeCallback(ai.Callback,FormatValue(at))
end

if au then
aj=(au.UserInputType==Enum.UserInputType.Touch)
ar.ScrollingEnabled=false
af=true
ak=game:GetService"RunService".RenderStepped:Connect(function()
local aw=aj and au.Position.X or game:GetService"UserInputService":GetMouseLocation().X
local ax=math.clamp((aw-ai.UIElements.SliderIcon.AbsolutePosition.X)/ai.UIElements.SliderIcon.AbsoluteSize.X,0,1)
at=CalculateValue(ai.Value.Min+ax*(ai.Value.Max-ai.Value.Min))

if at~=an then
ad(ai.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(ax,0,1,0)}):Play()
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(at)
ai.Value.Default=FormatValue(at)
an=at
aa.SafeCallback(ai.Callback,FormatValue(at))
end
end)
al=game:GetService"UserInputService".InputEnded:Connect(function(aw)
if(aw.UserInputType==Enum.UserInputType.MouseButton1 or aw.UserInputType==Enum.UserInputType.Touch)and au==aw then
ak:Disconnect()
al:Disconnect()
af=false
ar.ScrollingEnabled=true
end
end)
end
end
end
end

aa.AddSignal(ai.UIElements.SliderContainer.TextBox.FocusLost,function(as)
if as then
local at=tonumber(ai.UIElements.SliderContainer.TextBox.Text)
if at then
ai:Set(at)
else
ai.UIElements.SliderContainer.TextBox.Text=FormatValue(an)
end
end
end)

aa.AddSignal(ai.UIElements.SliderContainer.InputBegan,function(as)
ai:Set(am,as)
end)

return ai.__type,ai
end

return ae end function a.F()
local aa=game:GetService"UserInputService"

local ac=a.load'a'
local ad=ac.New local ae=
ac.Tween

local af={
UICorner=6,
UIPadding=8,
}

local ag=a.load's'.New

function af.New(ah,ai)
local aj={
__type="Keybind",
Title=ai.Title or"Keybind",
Desc=ai.Desc or nil,
Locked=ai.Locked or false,
Value=ai.Value or"F",
Callback=ai.Callback or function()end,
CanChange=ai.CanChange or true,
Picking=false,
UIElements={},
}

local ak=true

aj.KeybindFrame=a.load'y'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=85,
Hover=aj.CanChange,
}

aj.UIElements.Keybind=ag(aj.Value,nil,aj.KeybindFrame.UIElements.Main)

aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
aj.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
aj.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)

ad("UIScale",{
Parent=aj.UIElements.Keybind,
Scale=.85,
})

ac.AddSignal(aj.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",function()
aj.UIElements.Keybind.Size=UDim2.new(
0,24
+aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function aj.Lock(al)
ak=false
return aj.KeybindFrame:Lock()
end
function aj.Unlock(al)
ak=true
return aj.KeybindFrame:Unlock()
end

function aj.Set(al,am)
aj.Value=am
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=am
end

if aj.Locked then
aj:Lock()
end

ac.AddSignal(aj.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if ak then
if aj.CanChange then
aj.Picking=true
aj.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local al
al=aa.InputBegan:Connect(function(am)
local an

if am.UserInputType==Enum.UserInputType.Keyboard then
an=am.KeyCode.Name
elseif am.UserInputType==Enum.UserInputType.MouseButton1 then
an="MouseLeft"
elseif am.UserInputType==Enum.UserInputType.MouseButton2 then
an="MouseRight"
end

local ao
ao=aa.InputEnded:Connect(function(ap)
if ap.KeyCode.Name==an or an=="MouseLeft"and ap.UserInputType==Enum.UserInputType.MouseButton1 or an=="MouseRight"and ap.UserInputType==Enum.UserInputType.MouseButton2 then
aj.Picking=false

aj.UIElements.Keybind.Frame.Frame.TextLabel.Text=an
aj.Value=an

al:Disconnect()
ao:Disconnect()
end
end)
end)
end
end
end)
ac.AddSignal(aa.InputBegan,function(al)
if ak then
if al.KeyCode.Name==aj.Value then
ac.SafeCallback(aj.Callback,al.KeyCode.Name)
end
end
end)
return aj.__type,aj
end

return af end function a.G()
local aa=a.load'a'
local ac=aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'j'


.New
local ag=a.load'k'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local ak=true

aj.InputFrame=a.load'y'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=aj.Width,
Hover=false,
}

local al=ag(aj.Placeholder,aj.InputIcon,not aj.Type=="Input"and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,aj.Type,function(al)
aj:Set(al)
end)
if aj.Type=="Input"then
al.Size=UDim2.new(0,aj.Width,0,36)
al.Position=UDim2.new(1,0,0.5,0)
al.AnchorPoint=Vector2.new(1,0.5)
else
al.Size=UDim2.new(1,0,0,148)
end

ac("UIScale",{
Parent=al,
Scale=1,
})

function aj.Lock(am)
ak=false
return aj.InputFrame:Lock()
end
function aj.Unlock(am)
ak=true
return aj.InputFrame:Unlock()
end


function aj.Set(am,an)
if ak then
aa.SafeCallback(aj.Callback,an)

al.Frame.Frame.TextBox.Text=an
aj.Value=an
end
end
function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.H()
local aa=game:GetService"UserInputService"
local ac=game:GetService"Players".LocalPlayer:GetMouse()
local ae=game:GetService"Workspace".CurrentCamera

local af=a.load'a'
local ag=af.New
local ah=af.Tween

local ai=a.load's'.New

local aj={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
}

function aj.New(ak,al)
local am={
__type="Dropdown",
Title=al.Title or"Dropdown",
Desc=al.Desc or nil,
Locked=al.Locked or false,
Values=al.Values or{},
MenuWidth=al.MenuWidth or 170,
Value=al.Value,
AllowNone=al.AllowNone,
Multi=al.Multi,
Callback=al.Callback or function()end,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if am.Multi and not am.Value then
am.Value={}
end

local an=true

am.DropdownFrame=a.load'y'{
Title=am.Title,
Desc=am.Desc,
Parent=al.Parent,
TextOffset=am.Width,
Hover=false,
}


am.UIElements.Dropdown=ai("",nil,am.DropdownFrame.UIElements.Main)

am.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
am.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,am.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

am.UIElements.Dropdown.Size=UDim2.new(0,am.Width,0,36)
am.UIElements.Dropdown.Position=UDim2.new(1,0,0.5,0)
am.UIElements.Dropdown.AnchorPoint=Vector2.new(1,0.5)






ag("ImageLabel",{
Image=af.Icon"chevrons-up-down"[1],
ImageRectOffset=af.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=af.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Icon"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=am.UIElements.Dropdown.Frame
})

am.UIElements.UIListLayout=ag("UIListLayout",{
Padding=UDim.new(0,aj.MenuPadding),
FillDirection="Vertical"
})

am.UIElements.Menu=af.NewRoundFrame(aj.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="Background",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aj.MenuPadding),
PaddingLeft=UDim.new(0,aj.MenuPadding),
PaddingRight=UDim.new(0,aj.MenuPadding),
PaddingBottom=UDim.new(0,aj.MenuPadding),
}),
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),

ClipsDescendants=true
},{
ag("UICorner",{
CornerRadius=UDim.new(0,aj.MenuCorner-aj.MenuPadding),
}),
ag("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
am.UIElements.UIListLayout,
})
})
})

am.UIElements.MenuCanvas=ag("Frame",{
Size=UDim2.new(0,am.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=al.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
am.UIElements.Menu,






ag("UISizeConstraint",{
MinSize=Vector2.new(170,0)
})
})

function am.Lock(ao)
an=false
return am.DropdownFrame:Lock()
end
function am.Unlock(ao)
an=true
return am.DropdownFrame:Unlock()
end

if am.Locked then
am:Lock()
end

local function RecalculateCanvasSize()
am.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,am.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
if#am.Values>10 then
am.UIElements.MenuCanvas.Size=UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X,392)
else
am.UIElements.MenuCanvas.Size=UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X,am.UIElements.UIListLayout.AbsoluteContentSize.Y+(aj.MenuPadding*2))
end
end

function UpdatePosition()
local ao=am.UIElements.Dropdown
local ap=am.UIElements.MenuCanvas

local aq=ae.ViewportSize.Y-(ao.AbsolutePosition.Y+ao.AbsoluteSize.Y)-aj.MenuPadding-54
local ar=ap.AbsoluteSize.Y+aj.MenuPadding

local as=-54
if aq<ar then
as=ar-aq-54
end

ap.Position=UDim2.new(
0,
ao.AbsolutePosition.X+ao.AbsoluteSize.X,
0,
ao.AbsolutePosition.Y+ao.AbsoluteSize.Y-as+aj.MenuPadding
)
end



function am.Display(ao)
local ap=am.Values
local aq=""

if am.Multi then
for ar,as in next,ap do
if table.find(am.Value,as)then
aq=aq..as..", "
end
end
aq=aq:sub(1,#aq-2)
else
aq=am.Value or""
end

am.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(aq==""and"--"or aq)
end

function am.Refresh(ao,ap)
for aq,ar in next,am.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not ar:IsA"UIListLayout"then
ar:Destroy()
end
end

am.Tabs={}

for as,at in next,ap do

local au={
Name=at,
Selected=false,
UIElements={},
}
au.UIElements.TabItem=af.NewRoundFrame(aj.MenuCorner-aj.MenuPadding,"Squircle",{
Size=UDim2.new(1,0,0,36),

ImageTransparency=1,
Parent=am.UIElements.Menu.Frame.ScrollingFrame,

ImageColor3=Color3.new(1,1,1),

},{
af.NewRoundFrame(aj.MenuCorner-aj.MenuPadding,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
Name="Highlight",
},{
ag("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ag("UIPadding",{

PaddingLeft=UDim.new(0,aj.TabPadding),
PaddingRight=UDim.new(0,aj.TabPadding),

}),
ag("UICorner",{
CornerRadius=UDim.new(0,aj.MenuCorner-aj.MenuPadding)
}),













ag("TextLabel",{
Text=at,
TextXAlignment="Left",
FontFace=Font.new(af.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",

Size=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})
},true)


if am.Multi then
au.Selected=table.find(am.Value or{},au.Name)
else
au.Selected=am.Value==au.Name
end

if au.Selected then
au.UIElements.TabItem.ImageTransparency=.95
au.UIElements.TabItem.Highlight.ImageTransparency=.75


au.UIElements.TabItem.Frame.TextLabel.TextTransparency=0.05
end

am.Tabs[as]=au

am:Display()

local function Callback()
am:Display()
task.spawn(function()
af.SafeCallback(am.Callback,am.Value)
end)
end

af.AddSignal(au.UIElements.TabItem.MouseButton1Click,function()
if am.Multi then
if not au.Selected then
au.Selected=true
ah(au.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0}):Play()
table.insert(am.Value,au.Name)
else
if not am.AllowNone and#am.Value==1 then
return
end
au.Selected=false
ah(au.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.4}):Play()
for av,aw in ipairs(am.Value)do
if aw==au.Name then
table.remove(am.Value,av)
break
end
end
end
else
for av,aw in next,am.Tabs do

ah(aw.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()
ah(aw.UIElements.TabItem.Highlight,0.1,{ImageTransparency=1}):Play()

ah(aw.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=.5}):Play()
aw.Selected=false
end
au.Selected=true
ah(au.UIElements.TabItem,0.1,{ImageTransparency=.95}):Play()
ah(au.UIElements.TabItem.Highlight,0.1,{ImageTransparency=.75}):Play()

ah(au.UIElements.TabItem.Frame.TextLabel,0.1,{TextTransparency=0.05}):Play()
am.Value=au.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end

local au=0
for av,aw in next,am.Tabs do
if aw.UIElements.TabItem.Frame.TextLabel then

local ax=aw.UIElements.TabItem.Frame.TextLabel.TextBounds.X
au=math.max(au,ax)
end
end

am.UIElements.MenuCanvas.Size=UDim2.new(0,au+6+6+5+5+18+6+6,am.UIElements.MenuCanvas.Size.Y.Scale,am.UIElements.MenuCanvas.Size.Y.Offset)

end


am:Refresh(am.Values)

function am.Select(ao,ap)
if ap then
am.Value=ap
else
if am.Multi then
am.Value={}
else
am.Value=nil

end
end
am:Refresh(am.Values)
end


RecalculateListSize()

function am.Open(ao)
if an then
am.UIElements.Menu.Visible=true
am.UIElements.MenuCanvas.Visible=true
am.UIElements.MenuCanvas.Active=true
am.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
ah(am.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
),
ImageTransparency=0.05
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(.1)
am.Opened=true
end)




UpdatePosition()
end
end
function am.Close(ao)
am.Opened=false

ah(am.UIElements.Menu,0.25,{
Size=UDim2.new(
1,0,
0,0
),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()


task.spawn(function()
task.wait(.1)
am.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(.25)
am.UIElements.MenuCanvas.Visible=false
am.UIElements.MenuCanvas.Active=false
end)
end

af.AddSignal(am.UIElements.Dropdown.MouseButton1Click,function()
am:Open()
end)

af.AddSignal(aa.InputBegan,function(ao)
if
ao.UserInputType==Enum.UserInputType.MouseButton1
or ao.UserInputType==Enum.UserInputType.Touch
then
local ap,ar=am.UIElements.MenuCanvas.AbsolutePosition,am.UIElements.MenuCanvas.AbsoluteSize
if
al.Window.CanDropdown
and am.Opened
and(ac.X<ap.X
or ac.X>ap.X+ar.X
or ac.Y<(ap.Y-20-1)
or ac.Y>ap.Y+ar.Y
)
then
am:Close()
end
end
end)

af.AddSignal(am.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition",UpdatePosition)

return am.__type,am
end

return aj end function a.I()






local aa={}
local ac={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local ae={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(af)
local ag={}
for ah,ai in ipairs(af)do
ag[ai]=true
end
return ag
end

local af=createKeywordSet(ac.lua)
local ag=createKeywordSet(ac.rbx)
local ah=createKeywordSet(ac.operators)

local function getHighlight(ai,aj)
local ak=ai[aj]

if ae[ak.."_color"]then
return ae[ak.."_color"]
end

if tonumber(ak)then
return ae.numbers
elseif ak=="nil"then
return ae.null
elseif ak:sub(1,2)=="--"then
return ae.comment
elseif ah[ak]then
return ae.operator
elseif af[ak]then
return ae.lua
elseif ag[ak]then
return ae.rbx
elseif ak:sub(1,1)=="\""or ak:sub(1,1)=="\'"then
return ae.str
elseif ak=="true"or ak=="false"then
return ae.boolean
end

if ai[aj+1]=="("then
if ai[aj-1]==":"then
return ae.self_call
end

return ae.call
end

if ai[aj-1]=="."then
if ai[aj-2]=="Enum"then
return ae.rbx
end

return ae.local_property
end
end

function aa.run(ai)
local aj={}
local ak=""

local al=false
local am=false
local an=false

for ao=1,#ai do
local ap=ai:sub(ao,ao)

if am then
if ap=="\n"and not an then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""

am=false
elseif ai:sub(ao-1,ao)=="]]"and an then
ak=ak.."]"

table.insert(aj,ak)
ak=""

am=false
an=false
else
ak=ak..ap
end
elseif al then
if ap==al and ai:sub(ao-1,ao-1)~="\\"or ap=="\n"then
ak=ak..ap
al=false
else
ak=ak..ap
end
else
if ai:sub(ao,ao+1)=="--"then
table.insert(aj,ak)
ak="-"
am=true
an=ai:sub(ao+2,ao+3)=="[["
elseif ap=="\""or ap=="\'"then
table.insert(aj,ak)
ak=ap
al=ap
elseif ah[ap]then
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
elseif ap:match"[%w_]"then
ak=ak..ap
else
table.insert(aj,ak)
table.insert(aj,ap)
ak=""
end
end
end

table.insert(aj,ak)

local ao={}

for ap,ar in ipairs(aj)do
local as=getHighlight(aj,ap)

if as then
local at=string.format("<font color = \"#%s\">%s</font>",as:ToHex(),ar:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(ao,at)
else
table.insert(ao,ar)
end
end

return table.concat(ao)
end

return aa end function a.J()
local aa={}

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'I'

function aa.New(ah,ai,aj,ak,al)
local am={
Radius=12,
Padding=10
}

local an=ae("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,am.Padding+3),
PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),
PaddingBottom=UDim.new(0,am.Padding+3),
})
})
an.Font="Code"

local ao=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
an
})

local ap=ae("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-am.Padding/2,0,am.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ak and true or false,
},{
ac.NewRoundFrame(am.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ae("UIScale",{
Scale=1,
}),
ae("ImageLabel",{
Image=ac.Icon"copy"[1],
ImageRectSize=ac.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ac.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

ac.AddSignal(ap.MouseEnter,function()
af(ap.Button,.05,{ImageTransparency=.95}):Play()
af(ap.Button.UIScale,.05,{Scale=.9}):Play()
end)
ac.AddSignal(ap.InputEnded,function()
af(ap.Button,.08,{ImageTransparency=1}):Play()
af(ap.Button.UIScale,.08,{Scale=1}):Play()
end)

local ar=ac.NewRoundFrame(am.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
AutomaticSize="Y",
Parent=aj,
},{
ac.NewRoundFrame(am.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
ac.NewRoundFrame(am.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(am.Padding*2)),
Visible=ai and true or false
},{
ae("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
ae("TextLabel",{
Text=ai,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,ap and-20-(am.Padding*2),0,0)
}),
ae("UIPadding",{

PaddingLeft=UDim.new(0,am.Padding+3),
PaddingRight=UDim.new(0,am.Padding+3),

}),
ae("UIListLayout",{
Padding=UDim.new(0,am.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ao,
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
ap,
})

ac.AddSignal(an:GetPropertyChangedSignal"TextBounds",function()
ao.Size=UDim2.new(1,0,0,(an.TextBounds.Y/(al or 1))+((am.Padding+3)*2))
end)

function am.Set(as)
an.Text=ag.run(as)
end

function am.Destroy()
ar:Destroy()
am=nil
end

am.Set(ah)

ac.AddSignal(ap.MouseButton1Click,function()
if ak then
ak()
local as=ac.Icon"check"
ap.Button.ImageLabel.Image=as[1]
ap.Button.ImageLabel.ImageRectSize=as[2].ImageRectSize
ap.Button.ImageLabel.ImageRectOffset=as[2].ImageRectPosition

task.wait(1)
local at=ac.Icon"copy"
ap.Button.ImageLabel.Image=at[1]
ap.Button.ImageLabel.ImageRectSize=at[2].ImageRectSize
ap.Button.ImageLabel.ImageRectOffset=at[2].ImageRectPosition
end
end)
return am
end


return aa end function a.K()
local aa=a.load'a'local ac=
aa.New


local ae=a.load'J'

local af={}

function af.New(ag,ah)
local ai={
__type="Code",
Title=ah.Title,
Code=ah.Code,
OnCopy=ah.OnCopy,
UIElements={}
}

local aj=not ai.Locked











local ak=ae.New(ai.Code,ai.Title,ah.Parent,function()
if aj then
local ak=ai.Title or"code"
local al,am=pcall(function()
toclipboard(ai.Code)

if ai.OnCopy then ai.OnCopy()end
end)
if not al then
ah.WindUI:Notify{
Title="Error",
Content="The "..ak.." is not copied. Error: "..am,
Icon="x",
Duration=5,
}
end
end
end,ah.WindUI.UIScale)

function ai.SetCode(al,am)
ak.Set(am)
end

function ai.Destroy(al)
ak.Destroy()
ai=nil
end

return ai.__type,ai
end

return af end function a.L()
local aa=a.load'a'
local ac=aa.New local ae=
aa.Tween

local af=game:GetService"UserInputService"
game:GetService"TouchInputService"
local ag=game:GetService"RunService"
local ah=game:GetService"Players"

local ai=ag.RenderStepped
local aj=ah.LocalPlayer
local ak=aj:GetMouse()

local al=a.load'j'.New
local am=a.load'k'.New

local an={
UICorner=8,
UIPadding=8
}

function an.Colorpicker(ao,ap,ar,as)
local at={
__type="Colorpicker",
Title=ap.Title,
Desc=ap.Desc,
Default=ap.Default,
Callback=ap.Callback,
Transparency=ap.Transparency,
UIElements=ap.UIElements,

TextPadding=10,
}

function at.SetHSVFromRGB(au,av)
local aw,ax,ay=Color3.toHSV(av)
at.Hue=aw
at.Sat=ax
at.Vib=ay
end

at:SetHSVFromRGB(at.Default)

local au=a.load'l'.Init(ar)
local av=au.Create()

at.ColorpickerFrame=av

av.UIElements.Main.Size=UDim2.new(1,0,0,0)



local aw,ax,ay=at.Hue,at.Sat,at.Vib

at.UIElements.Title=ac("TextLabel",{
Text=at.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=av.UIElements.Main
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,at.TextPadding/2),
PaddingLeft=UDim.new(0,at.TextPadding/2),
PaddingRight=UDim.new(0,at.TextPadding/2),
PaddingBottom=UDim.new(0,at.TextPadding/2),
})
})





local az=ac("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=HueDragHolder,
BackgroundColor3=at.Default
},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

at.UIElements.SatVibMap=ac("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+at.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(aw,1,1),
BackgroundTransparency=0,
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),

az,
})

at.UIElements.Inputs=ac("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(at.Transparency and 240 or 210,40+at.TextPadding),
BackgroundTransparency=1,
Parent=av.UIElements.Main
},{
ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
})
})





local aA=ac("Frame",{
BackgroundColor3=at.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=at.Transparency,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+at.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),







aA,
})

local aB=ac("Frame",{
BackgroundColor3=at.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ac("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+at.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.85,
ZIndex=99999,
},{
ac("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
})
}),
aB,
})

local aC={}

for aD=0,1,0.1 do
table.insert(aC,ColorSequenceKeypoint.new(aD,Color3.fromHSV(aD,1,1)))
end

local aD=ac("UIGradient",{
Color=ColorSequence.new(aC),
Rotation=90,
})

local aE=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local b=ac("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aE,


BackgroundColor3=at.Default
},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local e=ac("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+at.TextPadding),
Parent=av.UIElements.Main,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
aD,
aE,
})


function CreateNewInput(g,h)
local i=am(g,nil,at.UIElements.Inputs)

ac("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=i.Frame,
Text=g,
})

ac("UIScale",{
Parent=i,
Scale=.85,
})

i.Frame.Frame.TextBox.Text=h
i.Size=UDim2.new(0,150,0,42)

return i
end

local function ToRGB(g)
return{
R=math.floor(g.R*255),
G=math.floor(g.G*255),
B=math.floor(g.B*255)
}
end

local g=CreateNewInput("Hex","#"..at.Default:ToHex())

local h=CreateNewInput("Red",ToRGB(at.Default).R)
local i=CreateNewInput("Green",ToRGB(at.Default).G)
local j=CreateNewInput("Blue",ToRGB(at.Default).B)
local l
if at.Transparency then
l=CreateNewInput("Alpha",((1-at.Transparency)*100).."%")
end

local m=ac("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+at.TextPadding),
BackgroundTransparency=1,
Parent=av.UIElements.Main,
LayoutOrder=4,
},{
ac("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

local p={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()as(Color3.fromHSV(at.Hue,at.Sat,at.Vib),at.Transparency)end
}
}

for r,x in next,p do
local z=al(x.Title,x.Icon,x.Callback,x.Variant,m,av,false)
z.Size=UDim2.new(0.5,-3,0,40)
z.AutomaticSize="None"
end



local z,A,B
if at.Transparency then
local C=ac("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

A=ac("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=C,

},{
ac("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
ac("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

B=ac("Frame",{
Size=UDim2.fromScale(1,1),
},{
ac("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ac("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

z=ac("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+at.TextPadding),
Parent=av.UIElements.Main,
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ac("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
B,
C,
})
end

function at.Round(C,F,G)
if G==0 then
return math.floor(F)
end
F=tostring(F)
return F:find"%."and tonumber(F:sub(1,F:find"%."+G))or F
end


function at.Update(C,F,G)
if F then aw,ax,ay=Color3.toHSV(F)else aw,ax,ay=at.Hue,at.Sat,at.Vib end

at.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(aw,1,1)
az.Position=UDim2.new(ax,0,1-ay,0)
az.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
aB.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
b.BackgroundColor3=Color3.fromHSV(aw,1,1)
b.Position=UDim2.new(0.5,0,aw,0)

g.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(aw,ax,ay):ToHex()
h.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).R
i.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).G
j.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aw,ax,ay)).B

if G or at.Transparency then
aB.BackgroundTransparency=at.Transparency or G
B.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
A.BackgroundColor3=Color3.fromHSV(aw,ax,ay)
A.BackgroundTransparency=at.Transparency or G
A.Position=UDim2.new(0.5,0,1-at.Transparency or G,0)
l.Frame.Frame.TextBox.Text=at:Round((1-at.Transparency or G)*100,0).."%"
end
end

at:Update(at.Default,at.Transparency)




local function GetRGB()
local C=Color3.fromHSV(at.Hue,at.Sat,at.Vib)
return{R=math.floor(C.r*255),G=math.floor(C.g*255),B=math.floor(C.b*255)}
end



local function clamp(C,F,G)
return math.clamp(tonumber(C)or 0,F,G)
end

aa.AddSignal(g.Frame.Frame.TextBox.FocusLost,function(C)
if C then
local F=g.Frame.Frame.TextBox.Text:gsub("#","")
local G,H=pcall(Color3.fromHex,F)
if G and typeof(H)=="Color3"then
at.Hue,at.Sat,at.Vib=Color3.toHSV(H)
at:Update()
at.Default=H
end
end
end)

local function updateColorFromInput(C,F)
aa.AddSignal(C.Frame.Frame.TextBox.FocusLost,function(G)
if G then
local H=C.Frame.Frame.TextBox
local J=GetRGB()
local L=clamp(H.Text,0,255)
H.Text=tostring(L)

J[F]=L
local M=Color3.fromRGB(J.R,J.G,J.B)
at.Hue,at.Sat,at.Vib=Color3.toHSV(M)
at:Update()
end
end)
end

updateColorFromInput(h,"R")
updateColorFromInput(i,"G")
updateColorFromInput(j,"B")

if at.Transparency then
aa.AddSignal(l.Frame.Frame.TextBox.FocusLost,function(C)
if C then
local F=l.Frame.Frame.TextBox
local G=clamp(F.Text,0,100)
F.Text=tostring(G)

at.Transparency=1-G*0.01
at:Update(nil,at.Transparency)
end
end)
end



local C=at.UIElements.SatVibMap
aa.AddSignal(C.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=C.AbsolutePosition.X
local H=G+C.AbsoluteSize.X
local J=math.clamp(ak.X,G,H)

local L=C.AbsolutePosition.Y
local M=L+C.AbsoluteSize.Y
local N=math.clamp(ak.Y,L,M)

at.Sat=(J-G)/(H-G)
at.Vib=1-((N-L)/(M-L))
at:Update()

ai:Wait()
end
end
end)

aa.AddSignal(e.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=e.AbsolutePosition.Y
local H=G+e.AbsoluteSize.Y
local J=math.clamp(ak.Y,G,H)

at.Hue=((J-G)/(H-G))
at:Update()

ai:Wait()
end
end
end)

if at.Transparency then
aa.AddSignal(z.InputBegan,function(F)
if F.UserInputType==Enum.UserInputType.MouseButton1 or F.UserInputType==Enum.UserInputType.Touch then
while af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local G=z.AbsolutePosition.Y
local H=G+z.AbsoluteSize.Y
local J=math.clamp(ak.Y,G,H)

at.Transparency=1-((J-G)/(H-G))
at:Update()

ai:Wait()
end
end
end)
end

return at
end

function an.New(ao,ap)
local ar={
__type="Colorpicker",
Title=ap.Title or"Colorpicker",
Desc=ap.Desc or nil,
Locked=ap.Locked or false,
Default=ap.Default or Color3.new(1,1,1),
Callback=ap.Callback or function()end,

Transparency=ap.Transparency,
UIElements={}
}

local as=true


ar.ColorpickerFrame=a.load'y'{
Title=ar.Title,
Desc=ar.Desc,
Parent=ap.Parent,
TextOffset=40,
Hover=false,
}

ar.UIElements.Colorpicker=aa.NewRoundFrame(an.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=ar.Default,
Parent=ar.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
ZIndex=2
},nil,true)


function ar.Lock(at)
as=false
return ar.ColorpickerFrame:Lock()
end
function ar.Unlock(at)
as=true
return ar.ColorpickerFrame:Unlock()
end

if ar.Locked then
ar:Lock()
end


function ar.Update(at,au,av)
ar.UIElements.Colorpicker.ImageTransparency=av or 0
ar.UIElements.Colorpicker.ImageColor3=au
ar.Default=au
if av then
ar.Transparency=av
end
end

function ar.Set(at,au,av)
return ar:Update(au,av)
end

aa.AddSignal(ar.UIElements.Colorpicker.MouseButton1Click,function()
if as then
an:Colorpicker(ar,ap.Window,function(at,au)
ar:Update(at,au)
ar.Default=at
ar.Transparency=au
aa.SafeCallback(ar.Callback,at,au)
end).ColorpickerFrame:Open()
end
end)

return ar.__type,ar
end

return an end function a.M()
local aa=a.load'a'
local ac=aa.New
local ae=aa.Tween

local af={}

function af.New(ag,ah)
local ai={
__type="Section",
Title=ah.Title or"Section",
Icon=ah.Icon,
TextXAlignment=ah.TextXAlignment or"Left",
TextSize=ah.TextSize or 19,
UIElements={},

HeaderSize=42,
IconSize=24,

Elements={},

Expandable=false,
}

local aj


function ai.SetIcon(ak,al)
ai.Icon=al or nil
if aj then aj:Destroy()end
if al then
aj=aa.Image(
al,
al..":"..ai.Title,
0,
ah.Window.Folder,
ai.__type,
true
)
aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
end
end

local ak=ac("Frame",{
Size=UDim2.new(0,ai.IconSize,0,ai.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})


if ai.Icon then
ai:SetIcon(ai.Icon)
end

local al=ac("TextLabel",{
BackgroundTransparency=1,
TextXAlignment="Left",
AutomaticSize="Y",
TextSize=ai.TextSize,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),


Text=ai.Title,
Size=UDim2.new(
1,
aj and(-ai.IconSize-8)*2
or(-ai.IconSize-8),

1,
0
),
TextWrapped=true,
})

local am=ac("Frame",{
Size=UDim2.new(1,0,0,ai.HeaderSize),
BackgroundTransparency=1,

Parent=ah.Parent,
ClipsDescendants=true,
},{
ac("TextButton",{
Size=UDim2.new(1,0,0,ai.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
aj,
al,
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=not aj and ai.TextXAlignment or"Left",
}),
ac("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,2),
}),
ak,
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,ai.HeaderSize)
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,6),
VerticalAlignment="Bottom",
}),
})
})







local an=ah.ElementsModule

an.Load(ai,am.Content,an.Elements,ah.Window,ah.WindUI,function()
if not ai.Expandable then
ai.Expandable=true
ak.Visible=true
end
end)


function ai.SetTitle(ao,ap)
al.Text=ap
end

function ai.Destroy(ao)
for ap,ar in next,ai.Elements do
ar:Destroy()
end








am:Destroy()
end

function ai.Open(ao)
if ai.Expandable then
ai.Opened=true
ae(am,0.33,{
Size=UDim2.new(1,0,0,ai.HeaderSize+(am.Content.AbsoluteSize.Y/ah.UIScale))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ae(ak.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function ai.Close(ao)
if ai.Expandable then
ai.Opened=false
ae(am,0.26,{
Size=UDim2.new(1,0,0,ai.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ae(ak.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

aa.AddSignal(am.TextButton.MouseButton1Click,function()
if ai.Expandable then
if ai.Opened then
ai:Close()
else
ai:Open()
end
end
end)

if ai.Opened then
task.spawn(function()
task.wait()
ai:Open()
end)
end


return ai.__type,ai
end

return af end function a.N()
local aa=a.load'a'
local ac=aa.New

local ae={}

function ae.New(af,ag)
local ah=ac("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
ac("Frame",{
Parent=ag.Parent,
Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
ah
})

return"Divider",{}
end

return ae end function a.O()
return{
Elements={
Paragraph=a.load'z',
Button=a.load'A',
Toggle=a.load'D',
Slider=a.load'E',
Keybind=a.load'F',
Input=a.load'G',
Dropdown=a.load'H',
Code=a.load'K',
Colorpicker=a.load'L',
Section=a.load'M',
Divider=a.load'N',
},
Load=function(aa,ac,ae,af,ag,ah,ai,aj)
for ak,al in pairs(ae)do
aa[ak]=function(am,an)
an=an or{}
an.Parent=ac
an.Window=af
an.WindUI=ag
an.UIScale=aj
an.ElementsModule=ai local

ao, ap=al:New(an)
table.insert(aa.Elements,ap)

local ar
for as,at in pairs(ap)do
if typeof(at)=="table"and as:match"Frame$"then
ar=at
break
end
end

if ar then
function ap.SetTitle(au,av)
ar:SetTitle(av)
end
function ap.SetDesc(au,av)
ar:SetDesc(av)
end
function ap.Destroy(au)
ar:Destroy()
end
end

if ah then
ah()
end
return ap
end
end

end
}end function a.P()
game:GetService"UserInputService"
local aa=game.Players.LocalPlayer:GetMouse()

local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'x'.New
local ah=a.load't'.New



local ai={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ai)end
}

function ai.Init(aj,ak,al,am)
Window=aj
WindUI=ak
ai.ToolTipParent=al
ai.TabHighlight=am
return ai
end

function ai.New(aj,ak)
local al={
__type="Tab",
Title=aj.Title or"Tab",
Desc=aj.Desc,
Icon=aj.Icon,
IconThemed=aj.IconThemed,
Locked=aj.Locked,
ShowTabTitle=aj.ShowTabTitle,
Selected=false,
Index=nil,
Parent=aj.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),
}

ai.TabCount=ai.TabCount+1

local am=ai.TabCount
al.Index=am

al.UIElements.Main=ac.NewRoundFrame(al.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=aj.Parent,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
},{
ac.NewRoundFrame(al.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ae("UIGradient",{
Rotation=80,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
ac.NewRoundFrame(al.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not al.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,2+(Window.UIPadding/2)),
PaddingLeft=UDim.new(0,4+(Window.UIPadding/2)),
PaddingRight=UDim.new(0,4+(Window.UIPadding/2)),
PaddingBottom=UDim.new(0,2+(Window.UIPadding/2)),
})
}),
},true)

local an=0
local ao
local ap

if al.Icon then
ao=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
Window.Folder,
al.__type,
true,
al.IconThemed
)
ao.Size=UDim2.new(0,16,0,16)
ao.Parent=al.UIElements.Main.Frame
ao.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
al.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,-30,0,0)
an=-30

al.UIElements.Icon=ao


ap=ac.Image(
al.Icon,
al.Icon..":"..al.Title,
0,
Window.Folder,
al.__type,
true,
al.IconThemed
)
ap.Size=UDim2.new(0,16,0,16)
ap.ImageLabel.ImageTransparency=not al.Locked and 0 or.7
an=-30




end

al.UIElements.ContainerFrame=ae("ScrollingFrame",{
Size=UDim2.new(1,0,1,al.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ae("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6),
HorizontalAlignment="Center",
})
})





al.UIElements.ContainerFrameCanvas=ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
al.UIElements.ContainerFrame,
ae("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=al.ShowTabTitle or false,
Name="TabTitle"
},{
ap,
ae("TextLabel",{
Text=al.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,-an,1,0),
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
ae("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ae("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=al.ShowTabTitle or false,
})
})

ai.Containers[am]=al.UIElements.ContainerFrameCanvas
ai.Tabs[am]=al

al.ContainerFrame=ContainerFrameCanvas

ac.AddSignal(al.UIElements.Main.MouseButton1Click,function()
if not al.Locked then
ai:SelectTab(am)
end
end)

ah(al.UIElements.ContainerFrame,al.UIElements.ContainerFrameCanvas,Window,3)

local ar
local as
local at
local au=false



if al.Desc then


ac.AddSignal(al.UIElements.Main.InputBegan,function()
au=true
as=task.spawn(function()
task.wait(0.35)
if au and not ar then
ar=ag(al.Desc,ai.ToolTipParent)

local function updatePosition()
if ar then
ar.Container.Position=UDim2.new(0,aa.X,0,aa.Y-20)
end
end

updatePosition()
at=aa.Move:Connect(updatePosition)
ar:Open()
end
end)
end)

end

ac.AddSignal(al.UIElements.Main.MouseEnter,function()
if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=.97}):Play()
end
end)
ac.AddSignal(al.UIElements.Main.InputEnded,function()
if al.Desc then
au=false
if as then
task.cancel(as)
as=nil
end
if at then
at:Disconnect()
at=nil
end
if ar then
ar:Close()
ar=nil
end
end

if not al.Locked then
af(al.UIElements.Main.Frame,0.08,{ImageTransparency=1}):Play()
end
end)



local av=a.load'O'

av.Load(al,al.UIElements.ContainerFrame,av.Elements,Window,WindUI,nil,av,ak)




task.spawn(function()
local aw=ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=al.UIElements.ContainerFrame
},{
ae("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
ae("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=ac.Icon"frown"[1],
ImageRectOffset=ac.Icon"frown"[2].ImageRectPosition,
ImageRectSize=ac.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Icon"
},
BackgroundTransparency=1,
ImageTransparency=.6,
}),
ae("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.5,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
})
})





ac.AddSignal(al.UIElements.ContainerFrame.ChildAdded,function()
aw.Visible=false
end)
end)

return al
end

function ai.OnChange(aj,ak)
ai.OnChangeFunc=ak
end

function ai.SelectTab(aj,ak)
if not ai.Tabs[ak].Locked then
ai.SelectedTab=ak

for al,am in next,ai.Tabs do
if not am.Locked then
af(am.UIElements.Main,0.15,{ImageTransparency=1}):Play()
af(am.UIElements.Main.Outline,0.15,{ImageTransparency=1}):Play()
af(am.UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0.3}):Play()
if am.UIElements.Icon then
af(am.UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.4}):Play()
end
am.Selected=false
end
end
af(ai.Tabs[ak].UIElements.Main,0.15,{ImageTransparency=0.95}):Play()
af(ai.Tabs[ak].UIElements.Main.Outline,0.15,{ImageTransparency=0.85}):Play()
af(ai.Tabs[ak].UIElements.Main.Frame.TextLabel,0.15,{TextTransparency=0}):Play()
if ai.Tabs[ak].UIElements.Icon then
af(ai.Tabs[ak].UIElements.Icon.ImageLabel,0.15,{ImageTransparency=0.1}):Play()
end
ai.Tabs[ak].Selected=true


task.spawn(function()
for an,ao in next,ai.Containers do
ao.AnchorPoint=Vector2.new(0,0.05)
ao.Visible=false
end
ai.Containers[ak].Visible=true
af(ai.Containers[ak],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

ai.OnChangeFunc(ak)
end
end

return ai end function a.Q()
local aa={}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween

local ag=a.load'P'

function aa.New(ah,ai,aj,ak)
local al={
Title=ah.Title or"Section",
Icon=ah.Icon,
IconThemed=ah.IconThemed,
Opened=ah.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local am
if al.Icon then
am=ac.Image(
al.Icon,
al.Icon,
0,
aj,
"Section",
true,
al.IconThemed
)

am.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
am.ImageLabel.ImageTransparency=.25
end

local an=ae("Frame",{
Size=UDim2.new(0,al.IconSize,0,al.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ae("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ac.Icon"chevron-down"[1],
ImageRectSize=ac.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ac.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local ao=ae("Frame",{
Size=UDim2.new(1,0,0,al.HeaderSize),
BackgroundTransparency=1,
Parent=ai,
ClipsDescendants=true,
},{
ae("TextButton",{
Size=UDim2.new(1,0,0,al.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
am,
ae("TextLabel",{
Text=al.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
am and(-al.IconSize-10)*2
or(-al.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
ae("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
an,
ae("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
ae("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,al.HeaderSize)
},{
ae("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,0),
VerticalAlignment="Bottom",
}),
})
})


function al.Tab(ap,ar)
if not al.Expandable then
al.Expandable=true
an.Visible=true
end
ar.Parent=ao.Content
return ag.New(ar,ak)
end

function al.Open(ap)
if al.Expandable then
al.Opened=true
af(ao,0.33,{
Size=UDim2.new(1,0,0,al.HeaderSize+(ao.Content.AbsoluteSize.Y/ak))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

af(an.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function al.Close(ap)
if al.Expandable then
al.Opened=false
af(ao,0.26,{
Size=UDim2.new(1,0,0,al.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
af(an.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ac.AddSignal(ao.TextButton.MouseButton1Click,function()
if al.Expandable then
if al.Opened then
al:Close()
else
al:Open()
end
end
end)

if al.Opened then
task.spawn(function()
task.wait()
al:Open()
end)
end



return al
end


return aa end function a.R()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.S()
game:GetService"UserInputService"

local aa={
Margin=8,
Padding=9,
}


local ac=a.load'a'
local ae=ac.New
local af=ac.Tween


function aa.new(ag,ah,ai)
local aj={
IconSize=14,
Padding=14,
Radius=18,
Width=400,
MaxHeight=380,

Icons=a.load'R'
}


local ak=ae("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((aj.IconSize*2)+(aj.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local al=ae("ImageLabel",{
Image=ac.Icon"x"[1],
ImageRectSize=ac.Icon"x"[2].ImageRectSize,
ImageRectOffset=ac.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
},{
ae("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local am=ae("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding),
})
})

local an=ac.NewRoundFrame(aj.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
ae("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ae("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ae("ImageLabel",{
Image=ac.Icon"search"[1],
ImageRectSize=ac.Icon"search"[2].ImageRectSize,
ImageRectOffset=ac.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.05,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ak,
al,
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
})
})
}),
ae("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ae("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
am,
ae("UISizeConstraint",{
MaxSize=Vector2.new(aj.Width,aj.MaxHeight),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local ao=ae("Frame",{
Size=UDim2.new(0,aj.Width,0,0),
AutomaticSize="Y",
Parent=ah,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ae("UIScale",{
Scale=.9,
}),
an,
ac.NewRoundFrame(aj.Radius,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=1,
},{
ae("UIGradient",{
Rotation=45,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
})
})
})

local function CreateSearchTab(ap,ar,as,at,au,av)
local aw=ae("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=at or nil
},{
ac.NewRoundFrame(aj.Radius-6,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
ac.NewRoundFrame(aj.Radius-6,"SquircleOutline2",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=1,
Name="Outline",
},{
ae("UIGradient",{
Rotation=65,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0.55),
NumberSequenceKeypoint.new(0.5,0.8),
NumberSequenceKeypoint.new(1,0.6)
}
}),
ae("UIPadding",{
PaddingTop=UDim.new(0,aj.Padding-2),
PaddingLeft=UDim.new(0,aj.Padding),
PaddingRight=UDim.new(0,aj.Padding),
PaddingBottom=UDim.new(0,aj.Padding-2),
}),
ae("ImageLabel",{
Image=ac.Icon(as)[1],
ImageRectSize=ac.Icon(as)[2].ImageRectSize,
ImageRectOffset=ac.Icon(as)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,aj.IconSize,0,aj.IconSize)
}),
ae("Frame",{
Size=UDim2.new(1,-aj.IconSize-aj.Padding,0,0),
BackgroundTransparency=1,
},{
ae("TextLabel",{
Text=ap,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
ae("TextLabel",{
Text=ar or"",
Visible=ar and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.25,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
ae("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
ae("UIListLayout",{
Padding=UDim.new(0,aj.Padding),
FillDirection="Horizontal",
})
}),
},true),
ae("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aj.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=au,

},{
ac.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
ae("Frame",{
Size=UDim2.new(1,-aj.Padding-2,0,0),
Position=UDim2.new(0,aj.Padding+2,0,0),
BackgroundTransparency=1,
},{
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ae("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



aw.Main.Size=UDim2.new(
1,
0,
0,
aw.Main.Outline.Frame.Desc.Visible and(((aj.Padding-2)*2)+aw.Main.Outline.Frame.Title.TextBounds.Y+6+aw.Main.Outline.Frame.Desc.TextBounds.Y)
or(((aj.Padding-2)*2)+aw.Main.Outline.Frame.Title.TextBounds.Y)
)

ac.AddSignal(aw.Main.MouseEnter,function()
af(aw.Main,.04,{ImageTransparency=.95}):Play()
af(aw.Main.Outline,.04,{ImageTransparency=.7}):Play()
end)
ac.AddSignal(aw.Main.InputEnded,function()
af(aw.Main,.08,{ImageTransparency=1}):Play()
af(aw.Main.Outline,.08,{ImageTransparency=1}):Play()
end)
ac.AddSignal(aw.Main.MouseButton1Click,function()
if av then
av()
end
end)

return aw
end

local function ContainsText(ap,ar)
if not ar or ar==""then
return false
end

if not ap or ap==""then
return false
end

local as=string.lower(ap)
local at=string.lower(ar)

return string.find(as,at,1,true)~=nil
end

local function Search(ap)
if not ap or ap==""then
return{}
end

local ar={}
for as,at in next,ag.Tabs do
local au=ContainsText(at.Title or"",ap)
local av={}

for aw,ax in next,at.Elements do
if ax.__type~="Section"then
local ay=ContainsText(ax.Title or"",ap)
local az=ContainsText(ax.Desc or"",ap)

if ay or az then
av[aw]={
Title=ax.Title,
Desc=ax.Desc,
Original=ax,
__type=ax.__type
}
end
end
end

if au or next(av)~=nil then
ar[as]={
Tab=at,
Title=at.Title,
Icon=at.Icon,
Elements=av,
}
end
end
return ar
end

function aj.Search(ap,ar)
ar=ar or""

local as=Search(ar)

am.Visible=true
an.Frame.Results.Frame.Visible=true
for at,au in next,am:GetChildren()do
if au.ClassName~="UIListLayout"and au.ClassName~="UIPadding"then
au:Destroy()
end
end

if as and next(as)~=nil then
for av,aw in next,as do
local ax=aj.Icons.Tab
local ay=CreateSearchTab(aw.Title,nil,ax,am,true,function()
aj:Close()
ag:SelectTab(av)
end)
if aw.Elements and next(aw.Elements)~=nil then
for az,aA in next,aw.Elements do
local aB=aj.Icons[aA.__type]
CreateSearchTab(aA.Title,aA.Desc,aB,ay:FindFirstChild"ParentContainer"and ay.ParentContainer.Frame or nil,false,function()
aj:Close()
ag:SelectTab(av)

end)

end
end
end
elseif ar~=""then
ae("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
Parent=am,
Name="NotFound",
})
else
am.Visible=false
an.Frame.Results.Frame.Visible=false
end
end

ac.AddSignal(ak:GetPropertyChangedSignal"Text",function()
aj:Search(ak.Text)
end)

ac.AddSignal(am.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

af(am,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(am.UIListLayout.AbsoluteContentSize.Y+(aj.Padding*2),0,aj.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aj.Open(ap)
task.spawn(function()
an.Frame.Visible=true
ao.Visible=true
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aj.Close(ap)
task.spawn(function()
ai()
an.Frame.Visible=false
af(ao.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
ao.Visible=false
end)
end

ac.AddSignal(al.TextButton.MouseButton1Click,function()
aj:Close()
end)

aj:Open()

return aj
end

return aa end function a.T()

local aa=game:GetService"UserInputService"
game:GetService"RunService"

local ac=workspace.CurrentCamera

local ae=a.load'q'

local af=a.load'a'
local ag=af.New
local ah=af.Tween


local ai=a.load's'.New
local aj=a.load'j'.New
local ak=a.load't'.New
local al=a.load'u'

local am=a.load'v'



return function(an)
local ao={
Title=an.Title or"UI Library",
Author=an.Author,
Icon=an.Icon,
IconThemed=an.IconThemed,
Folder=an.Folder,
Resizable=an.Resizable,
Background=an.Background,
BackgroundImageTransparency=an.BackgroundImageTransparency or 0,
User=an.User or{},
Size=an.Size and UDim2.new(
0,math.clamp(an.Size.X.Offset,560,700),
0,math.clamp(an.Size.Y.Offset,350,520))or UDim2.new(0,580,0,460),
ToggleKey=an.ToggleKey or Enum.KeyCode.G,
Transparent=an.Transparent or false,
HideSearchBar=an.HideSearchBar,
ScrollBarEnabled=an.ScrollBarEnabled or false,
SideBarWidth=an.SideBarWidth or 200,
Acrylic=an.Acrylic or false,

Position=UDim2.new(0.5,0,0.5,0),
IconSize=22,
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=an.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=false,
IsOpenButtonEnabled=true,

ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnCloseCallback=nil,
OnDestroyCallback=nil,

TopBarButtons={},

}

if ao.HideSearchBar~=false then
ao.HideSearchBar=true
end
if ao.Resizable~=false then
ao.CanResize=true
ao.Resizable=true
end

if ao.Folder then
makefolder("WindUI/"..ao.Folder)
end

local ap=ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
})

if ao.Folder then
ao.ConfigManager=am:Init(ao)
end local



ar, as=ae.AcrylicPaint{UseAcrylic=ao.Acrylic}

ao.AcrylicPaint=ar

local at=ag("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
ag("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
})
})
local au=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
ag("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=af.Icon"expand"[1],
ImageRectOffset=af.Icon"expand"[2].ImageRectPosition,
ImageRectSize=af.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local av=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})










ao.UIElements.SideBar=ag("ScrollingFrame",{
Size=UDim2.new(
1,
ao.ScrollBarEnabled and-3-(ao.UIPadding/2)or 0,
1,
not ao.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
ag("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding/2),


PaddingBottom=UDim.new(0,ao.UIPadding/2),
}),
ag("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,0)
})
}),
ag("UIPadding",{

PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),

}),

})

ao.UIElements.SideBarContainer=ag("Frame",{
Size=UDim2.new(0,ao.SideBarWidth,1,ao.User.Enabled and-94-(ao.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
ag("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(
1,
0,
1,
not ao.HideSearchBar and-45-ao.UIPadding/2 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
}),
ao.UIElements.SideBar,
})

if ao.ScrollBarEnabled then
ak(ao.UIElements.SideBar,ao.UIElements.SideBarContainer.Content,ao,3)
end


ao.UIElements.MainBar=ag("Frame",{
Size=UDim2.new(1,-ao.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.95,
Name="Background",
}),
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding/2),
PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),
PaddingBottom=UDim.new(0,ao.UIPadding/2),
})
})

local aw=ag("ImageLabel",{
Image="rbxassetid://8992230677",
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

local ax

if aa.TouchEnabled and not aa.KeyboardEnabled then
ax=false
elseif aa.KeyboardEnabled then
ax=true
else
ax=nil
end









local ay
if ao.User.Enabled then local
az, aA=game.Players:GetUserThumbnailAsync(
ao.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

ay=ag("TextButton",{
Size=UDim2.new(0,
(ao.UIElements.SideBarContainer.AbsoluteSize.X)-(ao.UIPadding/2),
0,
42+(ao.UIPadding)
),
Position=UDim2.new(0,ao.UIPadding/2,1,-(ao.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
},{
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ag("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
af.NewRoundFrame(ao.UICorner-(ao.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ag("ImageLabel",{
Image=az,
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ag("TextLabel",{
Text=ao.User.Anonymous and"Anonymous"or game.Players.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
ag("TextLabel",{
Text=ao.User.Anonymous and"@anonymous"or"@"..game.Players.LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
ag("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
ag("UIListLayout",{
Padding=UDim.new(0,ao.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ag("UIPadding",{
PaddingLeft=UDim.new(0,ao.UIPadding/2),
PaddingRight=UDim.new(0,ao.UIPadding/2),
})
})
})

if ao.User.Callback then
af.AddSignal(ay.MouseButton1Click,function()
ao.User.Callback()
end)
af.AddSignal(ay.MouseEnter,function()
ah(ay.UserIcon,0.04,{ImageTransparency=.95}):Play()
ah(ay.Outline,0.04,{ImageTransparency=.85}):Play()
end)
af.AddSignal(ay.InputEnded,function()
ah(ay.UserIcon,0.04,{ImageTransparency=1}):Play()
ah(ay.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local az
local aA



local aB=false
local aC

local aD=typeof(ao.Background)=="string"and string.match(ao.Background,"^video:(.+)")or nil

if typeof(ao.Background)=="string"and aD then
aB=true

if string.find(aD,"http")then
local function SanitizeFilename(aE)
aE=aE:gsub("[%s/\\:*?\"<>|]+","-")
aE=aE:gsub("[^%w%-_%.]","")
return aE
end

local aE=ao.Folder.."/Assets/."..SanitizeFilename(aD)..".webm"
if not isfile(aE)then
local b,e=pcall(function()
local b=game:HttpGet(aD)
writefile(aE,b)
end)

if not b then
warn("[ WindUI.Background ]  Failed to download video: "..tostring(e))
return
end
end
aD=getcustomasset(aE)
end

aC=ag("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=aD,
Looped=true,
Volume=0,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
})
aC:Play()
elseif ao.Background then
aC=ag("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(ao.Background)=="string"and ao.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
})
end


local aE=af.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
ag("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

function createAuthor(b)
return ag("TextLabel",{
Text=b,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=ao.UIElements.Main and ao.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
Name="Author",
})
end

local b
local e

if ao.Author then
b=createAuthor(ao.Author)
end


local g=ag("TextLabel",{
Text=ao.Title,
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

ao.UIElements.Main=ag("Frame",{
Size=ao.Size,
Position=ao.Position,
BackgroundTransparency=1,
Parent=an.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
ao.AcrylicPaint.Frame,
aw,
af.NewRoundFrame(ao.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,-240),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},

},{
aC,
aE,
at,



}),
UIStroke,
ap,
au,
av,
ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,ao.UICorner)
}),
ao.UIElements.SideBarContainer,
ao.UIElements.MainBar,

ay,

aA,
ag("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
az,






ag("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
ag("UIListLayout",{
Padding=UDim.new(0,ao.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
ag("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
g,
b,
}),
ag("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
ag("ScrollingFrame",{
Name="Center",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
Visible=false,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ao.UIPadding/2)
})
}),
ag("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
ag("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
ag("UIPadding",{
PaddingTop=UDim.new(0,ao.UIPadding),
PaddingLeft=UDim.new(0,ao.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,ao.UIPadding),
})
})
})
})

af.AddSignal(ao.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local h=0
local i=ao.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
if g and b then
h=math.max(g.TextBounds.X,b.TextBounds.X)
else
h=g.TextBounds.X
end
if e then
h=h+ao.IconSize+ao.UIPadding+4
end
ao.UIElements.Main.Main.Topbar.Center.Position=UDim2.new(0,h+ao.UIPadding,0.5,0)
ao.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-h-i-(ao.UIPadding*2),
1,
0
)
end)

function ao.CreateTopbarButton(h,i,j,l,m,p)
local r=af.Image(
j,
j,
0,
ao.Folder,
"TopbarIcon",
true,
p
)
r.Size=UDim2.new(0,16,0,16)
r.AnchorPoint=Vector2.new(0.5,0.5)
r.Position=UDim2.new(0.5,0,0.5,0)

local x=af.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0,36,0,36),
LayoutOrder=m or 999,
Parent=ao.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=1
},{
af.NewRoundFrame(9,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline"
},{
ag("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
}
}),
}),
r
},true)



ao.TopBarButtons[100-m]={
Name=i,
Object=x
}

af.AddSignal(x.MouseButton1Click,function()
l()
end)
af.AddSignal(x.MouseEnter,function()
ah(x,.15,{ImageTransparency=.93}):Play()
ah(x.Outline,.15,{ImageTransparency=.75}):Play()

end)
af.AddSignal(x.MouseLeave,function()
ah(x,.1,{ImageTransparency=1}):Play()
ah(x.Outline,.1,{ImageTransparency=1}):Play()

end)

return x
end



local h=af.Drag(
ao.UIElements.Main,
{ao.UIElements.Main.Main.Topbar,aE.Frame},
function(h,i)
if not ao.Closed then
if h and i==aE.Frame then
ah(aE,.1,{ImageTransparency=.35}):Play()
else
ah(aE,.2,{ImageTransparency=.8}):Play()
end
end
end
)

if not aB and ao.Background and typeof(ao.Background)=="table"then

local i=ag"UIGradient"
for j,l in next,ao.Background do
i[j]=l
end

ao.UIElements.BackgroundGradient=af.NewRoundFrame(ao.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=ao.UIElements.Main.Background,
ImageTransparency=ao.Transparent and an.WindUI.TransparencyValue or 0
},{
i
})
end














local i=a.load'w'.New(ao)


task.spawn(function()
if ao.Icon then

e=af.Image(
ao.Icon,
ao.Title,
0,
ao.Folder,
"Window",
true,
ao.IconThemed
)
e.Parent=ao.UIElements.Main.Main.Topbar.Left
e.Size=UDim2.new(0,ao.IconSize,0,ao.IconSize)

i:SetIcon(ao.Icon)











else
i:SetIcon(ao.Icon)

end
end)

function ao.SetToggleKey(j,l)
ao.ToggleKey=l
end

function ao.SetTitle(j,l)
ao.Title=l
g.Text=l
end

function ao.SetAuthor(j,l)
ao.Author=l
if not b then
b=createAuthor(ao.Author)
end

b.Text=l
end

function ao.SetBackgroundImage(j,l)
ao.UIElements.Main.Background.ImageLabel.Image=l
end
function ao.SetBackgroundImageTransparency(j,l)
ao.UIElements.Main.Background.ImageLabel.ImageTransparency=l
ao.BackgroundImageTransparency=l
end

local j
local l
af.Icon"minimize"
af.Icon"maximize"

ao:CreateTopbarButton("Fullscreen","maximize",function()
ao:ToggleFullscreen()
end,998)

function ao.ToggleFullscreen(m)
local p=ao.IsFullscreen

h:Set(p)

if not p then
j=ao.UIElements.Main.Position
l=ao.UIElements.Main.Size

ao.CanResize=false
else
if ao.Resizable then
ao.CanResize=true
end
end

ah(ao.UIElements.Main,0.45,{Size=p and l or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ah(ao.UIElements.Main,0.45,{Position=p and j or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



ao.IsFullscreen=not p
end


ao:CreateTopbarButton("Minimize","minus",function()
ao:Close()
task.spawn(function()
task.wait(.3)
if not ax and ao.IsOpenButtonEnabled then

i:Visible(true)
end
end)















end,997)

function ao.OnClose(m,p)
ao.OnCloseCallback=p
end
function ao.OnDestroy(m,p)
ao.OnDestroyCallback=p
end





function ao.Open(m)
task.spawn(function()
task.wait(.06)
ao.Closed=false

ah(ao.UIElements.Main.Background,0.2,{
ImageTransparency=ao.Transparent and an.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if ao.UIElements.BackgroundGradient then
ah(ao.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ah(ao.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,0),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if aC then
if aC:IsA"VideoFrame"then
aC.Visible=true
end
ah(aC,0.2,{
ImageTransparency=aC:IsA"ImageLabel"and 0 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end


ah(aw,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ah(UIStroke,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.spawn(function()
task.wait(.5)
ah(aE,.45,{Size=UDim2.new(0,200,0,4),ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
h:Set(true)
task.wait(.45)
if ao.Resizable then
ah(at.ImageLabel,.45,{ImageTransparency=.8},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
ao.CanResize=true
end
end)


ao.CanDropdown=true

ao.UIElements.Main.Visible=true
task.spawn(function()
task.wait(.05)
ao.UIElements.Main:WaitForChild"Main".Visible=true

an.WindUI:ToggleAcrylic(true)
end)
end)
end
function ao.Close(m)
local p={}

if ao.OnCloseCallback then
task.spawn(function()
af.SafeCallback(ao.OnCloseCallback)
end)
end

an.WindUI:ToggleAcrylic(false)

ao.UIElements.Main:WaitForChild"Main".Visible=false

ao.CanDropdown=false
ao.Closed=true

ah(ao.UIElements.Main.Background,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
if ao.UIElements.BackgroundGradient then
ah(ao.UIElements.BackgroundGradient,0.32,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

ah(ao.UIElements.Main.Background,0.4,{
Size=UDim2.new(1,0,1,-240),
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()


if aC then
if aC:IsA"VideoFrame"then
aC.Visible=false
end
ah(aC,0.2,{
ImageTransparency=aC:IsA"ImageLabel"and 1 or nil,

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
ah(aw,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if UIStroke then
ah(UIStroke,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ah(aE,.3,{Size=UDim2.new(0,0,0,4),ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()
ah(at.ImageLabel,.3,{ImageTransparency=1},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
h:Set(false)
ao.CanResize=false

task.spawn(function()
task.wait(0.4)
ao.UIElements.Main.Visible=false
end)

function p.Destroy(r)
if ao.OnDestroyCallback then
task.spawn(function()
af.SafeCallback(ao.OnDestroyCallback)
end)
end
if ao.AcrylicPaint.Model then
ao.AcrylicPaint.Model:Destroy()
end
ao.Destroyed=true
task.wait(0.4)
an.Parent.Parent:Destroy()


end

return p
end
function ao.Destroy(m)
ao:Close():Destroy()
end

function ao.ToggleTransparency(m,p)

ao.Transparent=p
an.WindUI.Transparent=p

ao.UIElements.Main.Background.ImageTransparency=p and an.WindUI.TransparencyValue or 0

ao.UIElements.MainBar.Background.ImageTransparency=p and 0.97 or 0.95

end


function ao.SetUIScale(m,p)
an.WindUI.UIScale=p
ah(an.WindUI.ScreenGui.UIScale,.2,{Scale=p},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

do

if(ac.ViewportSize.X-40<ao.UIElements.Main.AbsoluteSize.X)
or(ac.ViewportSize.Y-40<ao.UIElements.Main.AbsoluteSize.Y)then
if not ao.IsFullscreen then
ao:SetUIScale(.9)
end
end
end

if not ax and ao.IsOpenButtonEnabled then
af.AddSignal(i.Button.TextButton.MouseButton1Click,function()

i:Visible(false)
ao:Open()
end)
end

af.AddSignal(aa.InputBegan,function(m,p)
if p then return end

if m.KeyCode==ao.ToggleKey then
if ao.Closed then
ao:Open()
else
ao:Close()
end
end
end)

task.spawn(function()

ao:Open()
end)

function ao.EditOpenButton(m,p)
return i:Edit(p)
end


local m=a.load'P'
local p=a.load'Q'
local r=m.Init(ao,an.WindUI,an.Parent.Parent.ToolTips)
r:OnChange(function(x)ao.CurrentTab=x end)

ao.TabModule=m

function ao.Tab(x,z)
z.Parent=ao.UIElements.SideBar.Frame
return r.New(z,an.WindUI.UIScale)
end

function ao.SelectTab(x,z)
r:SelectTab(z)
end

function ao.Section(x,z)
return p.New(z,ao.UIElements.SideBar.Frame,ao.Folder,an.WindUI.UIScale)
end

function ao.IsResizable(x,z)
ao.Resizable=z
ao.CanResize=z
end

function ao.Divider(x)
local z=ag("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local A=ag("Frame",{
Parent=ao.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
z
})

return A
end

local x=a.load'l'.Init(ao,nil)
function ao.Dialog(z,A)
local B={
Title=A.Title or"Dialog",
Width=A.Width or 320,
Content=A.Content,
Buttons=A.Buttons or{},

TextPadding=10,
}
local C=x.Create(false)

C.UIElements.Main.Size=UDim2.new(0,B.Width,0,0)

local F=ag("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=C.UIElements.Main
},{
ag("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,C.UIPadding),
VerticalAlignment="Center"
}),
ag("UIPadding",{
PaddingTop=UDim.new(0,B.TextPadding/2),
PaddingLeft=UDim.new(0,B.TextPadding/2),
PaddingRight=UDim.new(0,B.TextPadding/2),
})
})

local G
if A.Icon then
G=af.Image(
A.Icon,
B.Title..":"..A.Icon,
0,
ao,
"Dialog",
true,
A.IconThemed
)
G.Size=UDim2.new(0,22,0,22)
G.Parent=F
end

C.UIElements.UIListLayout=ag("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=C.UIElements.Main
})

ag("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=C.UIElements.Main,
})


C.UIElements.Title=ag("TextLabel",{
Text=B.Title,
TextSize=20,
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,G and-26-C.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=F
})
if B.Content then
ag("TextLabel",{
Text=B.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=C.UIElements.Main
},{
ag("UIPadding",{
PaddingLeft=UDim.new(0,B.TextPadding/2),
PaddingRight=UDim.new(0,B.TextPadding/2),
PaddingBottom=UDim.new(0,B.TextPadding/2),
})
})
end

local H=ag("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local J=ag("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=C.UIElements.Main,
LayoutOrder=4,
},{
H,






})


local L={}

for M,N in next,B.Buttons do
local O=aj(N.Title,N.Icon,N.Callback,N.Variant,J,C,false)
table.insert(L,O)
end

local function CheckButtonsOverflow()
H.FillDirection=Enum.FillDirection.Horizontal
H.HorizontalAlignment=Enum.HorizontalAlignment.Right
H.VerticalAlignment=Enum.VerticalAlignment.Center
J.AutomaticSize=Enum.AutomaticSize.None

for O,P in ipairs(L)do
P.Size=UDim2.new(0,0,1,0)
P.AutomaticSize=Enum.AutomaticSize.X
end

wait()

local Q=H.AbsoluteContentSize.X
local R=J.AbsoluteSize.X

if Q>R then
H.FillDirection=Enum.FillDirection.Vertical
H.HorizontalAlignment=Enum.HorizontalAlignment.Right
H.VerticalAlignment=Enum.VerticalAlignment.Bottom
J.AutomaticSize=Enum.AutomaticSize.Y

for S,T in ipairs(L)do
T.Size=UDim2.new(1,0,0,40)
T.AutomaticSize=Enum.AutomaticSize.None
end
else
local S=R-Q
if S>0 then
local T
local U=math.huge

for V,W in ipairs(L)do
local X=W.AbsoluteSize.X
if X<U then
U=X
T=W
end
end

if T then
T.Size=UDim2.new(0,U+S,1,0)
T.AutomaticSize=Enum.AutomaticSize.None
end
end
end
end

af.AddSignal(C.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",CheckButtonsOverflow)
CheckButtonsOverflow()

wait()
C:Open()

return C
end


ao:CreateTopbarButton("Close","x",function()
ah(ao.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ao:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()ao:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)

function ao.Tag(z,A)
if ao.UIElements.Main.Main.Topbar.Center.Visible==false then ao.UIElements.Main.Main.Topbar.Center.Visible=true end
return al:New(A,ao.UIElements.Main.Main.Topbar.Center)
end


local function startResizing(z)
if ao.CanResize then
isResizing=true
au.Active=true
initialSize=ao.UIElements.Main.Size
initialInputPosition=z.Position
ah(au,0.12,{ImageTransparency=.65}):Play()
ah(au.ImageLabel,0.12,{ImageTransparency=0}):Play()
ah(at.ImageLabel,0.1,{ImageTransparency=.35}):Play()

af.AddSignal(z.Changed,function()
if z.UserInputState==Enum.UserInputState.End then
isResizing=false
au.Active=false
ah(au,0.2,{ImageTransparency=1}):Play()
ah(au.ImageLabel,0.17,{ImageTransparency=1}):Play()
ah(at.ImageLabel,0.17,{ImageTransparency=.8}):Play()
end
end)
end
end

af.AddSignal(at.InputBegan,function(z)
if z.UserInputType==Enum.UserInputType.MouseButton1 or z.UserInputType==Enum.UserInputType.Touch then
if ao.CanResize then
startResizing(z)
end
end
end)

af.AddSignal(aa.InputChanged,function(z)
if z.UserInputType==Enum.UserInputType.MouseMovement or z.UserInputType==Enum.UserInputType.Touch then
if isResizing and ao.CanResize then
local A=z.Position-initialInputPosition
local B=UDim2.new(0,initialSize.X.Offset+A.X*2,0,initialSize.Y.Offset+A.Y*2)

ah(ao.UIElements.Main,0,{
Size=UDim2.new(
0,math.clamp(B.X.Offset,560,700),
0,math.clamp(B.Y.Offset,350,520)
)}):Play()
end
end
end)




if not ao.HideSearchBar then
local z=a.load'S'
local A=false





















local B=ai("Search","search",ao.UIElements.SideBarContainer)
B.Size=UDim2.new(1,-ao.UIPadding/2,0,39)
B.Position=UDim2.new(0,ao.UIPadding/2,0,ao.UIPadding/2)

af.AddSignal(B.MouseButton1Click,function()
if A then return end

z.new(ao.TabModule,ao.UIElements.Main,function()

A=false
if ao.Resizable then
ao.CanResize=true
end

ah(av,0.1,{ImageTransparency=1}):Play()
av.Active=false
end)
ah(av,0.1,{ImageTransparency=.65}):Play()
av.Active=true

A=true
ao.CanResize=false
end)
end




function ao.DisableTopbarButtons(z,A)
for B,C in next,A do
for F,G in next,ao.TopBarButtons do
if G.Name==C then
G.Object.Visible=false
end
end
end
end

return ao
end end end
local aa={
Window=nil,
Theme=nil,
Creator=a.load'a',
LocalizationModule=a.load'b',
NotificationModule=a.load'c',
Themes=a.load'd',
Transparent=false,

TransparencyValue=.15,

UIScale=1,


Version="1.6.45",

Services=a.load'h',

OnThemeChangeFunction=nil,
}


local ac=game:GetService"HttpService"


local ae=ac:JSONDecode(a.load'i')
if ae then
aa.Version=ae.version

end

local af=a.load'm'local ag=

aa.Services

local ah=aa.Themes
local ai=aa.Creator

local aj=ai.New local ak=
ai.Tween

ai.Themes=ah

local al=a.load'q'local am=

game:GetService"Players"and game:GetService"Players".LocalPlayer or nil


local an=protectgui or(syn and syn.protect_gui)or function()end

local ao=gethui and gethui()or game.CoreGui


aa.ScreenGui=aj("ScreenGui",{
Name="WindUI",
Parent=ao,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
aj("UIScale",{
Scale=aa.Scale,
}),
aj("Folder",{
Name="Window"
}),






aj("Folder",{
Name="KeySystem"
}),
aj("Folder",{
Name="Popups"
}),
aj("Folder",{
Name="ToolTips"
})
})

aa.NotificationGui=aj("ScreenGui",{
Name="WindUI/Notifications",
Parent=ao,
IgnoreGuiInset=true,
})
aa.DropdownGui=aj("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=ao,
IgnoreGuiInset=true,
})
an(aa.ScreenGui)
an(aa.NotificationGui)
an(aa.DropdownGui)

ai.Init(aa)

math.clamp(aa.TransparencyValue,0,1)

local ap=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(ar,as)
as.Holder=ap.Frame
as.Window=aa.Window

return aa.NotificationModule.New(as)
end

function aa.SetNotificationLower(ar,as)
ap.SetLower(as)
end

function aa.SetFont(ar,as)
ai.UpdateFont(as)
end

function aa.OnThemeChange(ar,as)
aa.OnThemeChangeFunction=as
end

function aa.AddTheme(ar,as)
ah[as.Name]=as
return as
end

function aa.SetTheme(ar,as)
if ah[as]then
aa.Theme=ah[as]
ai.SetTheme(ah[as])

if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(as)
end


return ah[as]
end
return nil
end

function aa.GetThemes(ar)
return ah
end
function aa.GetCurrentTheme(ar)
return aa.Theme.Name
end
function aa.GetTransparency(ar)
return aa.Transparent or false
end
function aa.GetWindowSize(ar)
return Window.UIElements.Main.Size
end
function aa.Localization(ar,as)
return aa.LocalizationModule:New(as,ai)
end

function aa.SetLanguage(ar,as)
if ai.Localization then
return ai.SetLanguage(as)
end
return false
end

function aa.ToggleAcrylic(ar,as)
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=as
aa.Window.AcrylicPaint.Model.Transparency=as and 0.98 or 1
if as then
al.Enable()
else
al.Disable()
end
end
end


aa:SetTheme"Dark"
aa:SetLanguage(ai.Language)


function aa.Gradient(ar,as,at)
local au={}
local av={}

for aw,ax in next,as do
local ay=tonumber(aw)
if ay then
ay=math.clamp(ay/100,0,1)
table.insert(au,ColorSequenceKeypoint.new(ay,ax.Color))
table.insert(av,NumberSequenceKeypoint.new(ay,ax.Transparency or 0))
end
end

table.sort(au,function(ay,az)return ay.Time<az.Time end)
table.sort(av,function(ay,az)return ay.Time<az.Time end)


if#au<2 then
error"ColorSequence requires at least 2 keypoints"
end


local ay={
Color=ColorSequence.new(au),
Transparency=NumberSequence.new(av),
}

if at then
for az,aA in pairs(at)do
ay[az]=aA
end
end

return ay
end


function aa.Popup(ar,as)
as.WindUI=aa
return a.load'r'.new(as)
end


function aa.CreateWindow(ar,as)
local at=a.load'T'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if as.Folder then
makefolder(as.Folder)
else
makefolder(as.Title)
end

as.WindUI=aa
as.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local au=true

local av=ah[as.Theme or"Dark"]


ai.SetTheme(av)


local aw=gethwid or function()
return game:GetService"Players".LocalPlayer.UserId
end

local ax=aw()

if as.KeySystem then
au=false

local function loadKeysystem()
af.new(as,ax,function(ay)au=ay end)
end

local ay=as.Folder.."/"..ax..".key"

if not as.KeySystem.API then
if as.KeySystem.SaveKey and isfile(ay)then
local az=readfile(ay)
local aA=(type(as.KeySystem.Key)=="table")
and table.find(as.KeySystem.Key,az)
or tostring(as.KeySystem.Key)==tostring(az)

if aA then
au=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(ay)then
local az=readfile(ay)
local aA=false

for aB,aC in next,as.KeySystem.API do
local aD=aa.Services[aC.Type]
if aD then
local aE={}
for b,e in next,aD.Args do
table.insert(aE,aC[e])
end

local g=aD.New(table.unpack(aE))
local h=g.Verify(az)
if h then
aA=true
break
end
end
end

au=aA
if not aA then loadKeysystem()end
else
loadKeysystem()
end
end

repeat task.wait()until au
end

local ay=at(as)

aa.Transparent=as.Transparent
aa.Window=ay

if as.Acrylic then
al.init()
end

return ay
end

return aa
