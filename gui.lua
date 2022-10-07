local themecolor = Color3.new(0.4, 0.22, 1)
local buttoncolor = Color3.new((themecolor["R"]*0.5), (themecolor["G"]*0.5), (themecolor["B"]*0.5))
local backgroundcolor = Color3.new(0.075, 0.075, 0.075)

local mouse = game.Players.LocalPlayer:GetMouse()
local isIcon = false

local tween = game:GetService("TweenService")
local defaultanim = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local exitanim = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

local yummy = {}

function cornered(obj, value)
	local uicorner = Instance.new("UICorner", obj)
	uicorner.CornerRadius = UDim.new(0, value)
end

function yummy:CreateWindow(icon: "id or emoji", name: string)
	if type(icon) == "number" then
		local checktype = game.MarketplaceService:GetProductInfo(icon)["Description"]
		if checktype == "Decal" or checktype == "Decal Image" then
			isIcon = true
		end
	elseif type(icon) == "string" then
		if #icon <= 4 then
			isIcon = false
		end
	else
		error("invalid icon")
	end


	local GUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	--local GUI = Instance.new("ScreenGui", game:WaitForChild("CoreGui"))
	GUI.Name = tostring(name)
	GUI.Enabled = true
	GUI.ResetOnSpawn = false
	GUI.DisplayOrder = 3030303

	local MAINFRAME = Instance.new("Frame", GUI)
	MAINFRAME.AnchorPoint = Vector2.new(0.5, 0.5)
	MAINFRAME.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	MAINFRAME.BorderSizePixel = 0
	MAINFRAME.Position = UDim2.new(0.5, 0, 0.5, 0)
	MAINFRAME.Size = UDim2.new(0, 500, 0, 300)
	cornered(MAINFRAME, 10)


	local HEADER = Instance.new("Frame", MAINFRAME)
	HEADER.BackgroundColor3 = themecolor
	HEADER.BackgroundTransparency = 0.3
	HEADER.BorderSizePixel = 0
	HEADER.Size = UDim2.new(1, 0, 0, 50)
	cornered(HEADER, 10)
	local hUIll = Instance.new("UIListLayout", HEADER)
	hUIll.FillDirection = Enum.FillDirection.Horizontal
	hUIll.SortOrder = Enum.SortOrder.LayoutOrder
	hUIll.VerticalAlignment = Enum.VerticalAlignment.Center
	hUIll.Padding = UDim.new(0, 10)
	local hUIpad = Instance.new("UIPadding", HEADER)
	hUIpad.PaddingBottom = UDim.new(0, 10)
	hUIpad.PaddingLeft = UDim.new(0, 10)
	hUIpad.PaddingRight = UDim.new(0, 10)
	hUIpad.PaddingTop = UDim.new(0, 12.5)


	if isIcon then
		local hIcon = Instance.new("ImageLabel", HEADER)
		hIcon.BackgroundTransparency = 1.000
		hIcon.BorderSizePixel = 0
		hIcon.LayoutOrder = 1
		hIcon.Size = UDim2.new(0, 33, 0, 33)
		hIcon.Image = "http://www.roblox.com/asset/?id="..icon
	else
		local hIcon = Instance.new("TextLabel", HEADER)
		hIcon.LayoutOrder = 1
		hIcon.BackgroundTransparency = 1.000
		hIcon.BorderSizePixel = 0
		hIcon.Size = UDim2.new(0, 33, 0, 33)
		hIcon.Font = Enum.Font.Code
		hIcon.Text = icon
		hIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
		hIcon.TextScaled = true
	end

	local hText = Instance.new("TextLabel", HEADER)
	hText.BackgroundTransparency = 1.000
	hText.BorderSizePixel = 0
	hText.LayoutOrder = 2
	hText.Size = UDim2.new(1, -85, 0, 33)
	hText.Font = Enum.Font.Code
	hText.Text = name
	hText.TextColor3 = Color3.fromRGB(255, 255, 255)
	hText.TextSize = 24
	hText.TextXAlignment = Enum.TextXAlignment.Left

	local hExit = Instance.new("TextButton", HEADER)
	hExit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	hExit.BackgroundTransparency = 0.8
	hExit.LayoutOrder = 999
	hExit.Size = UDim2.new(0, 33, 0, 33)
	hExit.Font = Enum.Font.Code
	hExit.Text = "✖️"
	hExit.TextColor3 = Color3.fromRGB(255, 255, 255)
	hExit.TextSize = 24.000
	cornered(hExit, 11)	
	local hExitUIpad = Instance.new("UIPadding", hExit)
	hExitUIpad.PaddingTop = UDim.new(0, 5)

	hExit.MouseButton1Up:Connect(function()
		local anim = tween:Create(MAINFRAME, exitanim, {["Position"] = UDim2.new(0.5, 0, 1.5, 0)})
		anim:Play()
		anim.Completed:Wait()
		GUI:Destroy()
	end)


	local listmodule = {}

	function listmodule:CreateFolder(name: string)
		if not MAINFRAME:FindFirstChild("pages") then

			local pages = Instance.new("ScrollingFrame", MAINFRAME)
			pages.Name = "pages"
			pages.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			pages.BackgroundTransparency = 0.600
			pages.BorderSizePixel = 0
			pages.Position = UDim2.new(0, 0, 0, 50)
			pages.Size = UDim2.new(0.25, 0, 1, -50)
			pages.CanvasSize = UDim2.new(0, 0, 0, 0)
			pages.ScrollBarThickness = 4

			local pgUIll = Instance.new("UIListLayout", pages)
			pgUIll.HorizontalAlignment = Enum.HorizontalAlignment.Center
			pgUIll.SortOrder = Enum.SortOrder.LayoutOrder
			pgUIll.Padding = UDim.new(0, 10)

			local pgUIpd = Instance.new("UIPadding", pages)
			pgUIpd.PaddingBottom = UDim.new(0, 10)
			pgUIpd.PaddingLeft = UDim.new(0, 10)
			pgUIpd.PaddingRight = UDim.new(0, 10)
			pgUIpd.PaddingTop = UDim.new(0, 10)


			local folder = Instance.new("Folder", MAINFRAME)
		end

		local pages = MAINFRAME:FindFirstChild("pages")

		local pgButton = Instance.new("TextButton", pages)
		pgButton.Name = name
		pgButton.BackgroundColor3 = buttoncolor
		pgButton.BackgroundTransparency = 0.500
		pgButton.Size = UDim2.new(1, 0, 0, 33)
		pgButton.Font = Enum.Font.Code
		pgButton.Text = name
		pgButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		pgButton.TextSize = 14.000
		cornered(pgButton, 10)					


		local pgBTUIpd = Instance.new("UIPadding", pgButton)
		pgBTUIpd.PaddingBottom = UDim.new(0, 5)
		pgBTUIpd.PaddingLeft = UDim.new(0, 5)
		pgBTUIpd.PaddingRight = UDim.new(0, 5)
		pgBTUIpd.PaddingTop = UDim.new(0, 5)

		pgButton.MouseButton1Up:Connect(function()
			for _, h in pairs(MAINFRAME:FindFirstChild("Folder"):GetChildren()) do
				for _, itemh in pairs(h:GetChildren()) do
					if itemh.ClassName ~= "UIListLayout" and itemh.ClassName ~= "UIPadding" and itemh.ClassName ~= "UICorner" then
						itemh.Visible = false
					end
				end
				h.Visible = false
				h.ZIndex = -1
			end

			MAINFRAME:FindFirstChild("Folder")[name].Visible = true
			MAINFRAME:FindFirstChild("Folder")[name].ZIndex = 999
			for _, itemh in pairs(MAINFRAME:FindFirstChild("Folder")[name]:GetChildren()) do
				if itemh.ClassName ~= "UIListLayout" and itemh.ClassName ~= "UIPadding" and itemh.ClassName ~= "UICorner" then
					itemh.Visible = true
				end
			end
		end)


		local content = Instance.new("ScrollingFrame", MAINFRAME:FindFirstChild("Folder"))
		content.Visible = false
		content.Name = name
		content.BorderSizePixel = 0
		content.BackgroundTransparency = 1
		content.Position = UDim2.new(0.25, 0, 0, 50)
		content.Size = UDim2.new(0.75, 0, 1, -50)
		content.ScrollBarThickness = 4

		local ctUIll = Instance.new("UIListLayout", content)
		ctUIll.SortOrder = Enum.SortOrder.LayoutOrder
		ctUIll.Padding = UDim.new(0, 15)

		local ctUIpd = Instance.new("UIPadding", content)
		ctUIpd.PaddingBottom = UDim.new(0, 15)
		ctUIpd.PaddingLeft = UDim.new(0, 15)
		ctUIpd.PaddingRight = UDim.new(0, 15)
		ctUIpd.PaddingTop = UDim.new(0, 15)


		local hichat = {}

		function hichat:CreateText(text)
			local textlabel = Instance.new("TextLabel", MAINFRAME.Folder[name])
			textlabel.BackgroundTransparency = 1.000
			textlabel.BorderSizePixel = 0
			textlabel.Position = UDim2.new(1, 15, 0, 0)
			textlabel.Size = UDim2.new(1, 0, 0, 33)
			textlabel.Font = Enum.Font.Code
			textlabel.Text = text
			textlabel.TextColor3 = Color3.fromRGB(222, 222, 222)
			textlabel.TextSize = 18.000
			textlabel.TextWrapped = true
			textlabel.TextXAlignment = Enum.TextXAlignment.Left
			
			local bruh = {}
			
			function bruh:Edit(newtext)
				textlabel.Text = newtext
			end
				
			return bruh
		end
		
		function hichat:CreateDesc(text)
			local textlabel = Instance.new("TextLabel", MAINFRAME.Folder[name])
			textlabel.BackgroundTransparency = 1.000
			textlabel.BorderSizePixel = 0
			textlabel.Position = UDim2.new(1, 15, 0, 0)
			textlabel.Size = UDim2.new(1, 0, 0, 33)
			textlabel.Font = Enum.Font.Code
			textlabel.Text = text
			textlabel.TextColor3 = Color3.fromRGB(170, 170, 170)
			textlabel.TextSize = 14.000
			textlabel.TextWrapped = true
			textlabel.TextXAlignment = Enum.TextXAlignment.Left
		end
		
		function hichat:CreateButton(text, func, desc)
			local buttonka = Instance.new("TextButton", MAINFRAME.Folder[name])
			buttonka.BackgroundColor3 = buttoncolor
			buttonka.Size = UDim2.new(0, 125, 0, 33)
			buttonka.Font = Enum.Font.Code
			buttonka.Text = text
			buttonka.TextColor3 = Color3.fromRGB(255, 255, 255)
			buttonka.TextSize = 14.000
			buttonka.TextWrapped = true

			cornered(buttonka, 10)
			local btUIpd = Instance.new("UIPadding", buttonka)
			btUIpd.PaddingBottom = UDim.new(0, 5)
			btUIpd.PaddingLeft = UDim.new(0, 5)
			btUIpd.PaddingRight = UDim.new(0, 5)
			btUIpd.PaddingTop = UDim.new(0, 5)

			if desc then
				local descriptiontext = Instance.new("TextLabel", buttonka)
				descriptiontext.BackgroundTransparency = 1.000
				descriptiontext.BorderSizePixel = 0
				descriptiontext.Position = UDim2.new(1, 15, 0, 0)
				descriptiontext.Size = UDim2.new(0, 200, 1, 0)
				descriptiontext.Font = Enum.Font.Code
				descriptiontext.Text = desc
				descriptiontext.TextColor3 = Color3.fromRGB(170, 170, 170)
				descriptiontext.TextSize = 14.000
				descriptiontext.TextWrapped = true
				descriptiontext.TextXAlignment = Enum.TextXAlignment.Left
			end

			buttonka.MouseButton1Up:Connect(func)
		end

		function hichat:CreateToggle(text, func, desc)
			local isToggled = false


			local toglbutton = Instance.new("TextButton", MAINFRAME.Folder[name])
			toglbutton.BackgroundTransparency = 1.000
			toglbutton.BorderSizePixel = 0
			toglbutton.Size = UDim2.new(0, 33, 0, 33)
			toglbutton.Font = Enum.Font.SourceSans
			toglbutton.Text = "❎"
			toglbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
			toglbutton.TextScaled = true
			toglbutton.TextWrapped = true

			local togglerka = Instance.new("TextLabel", toglbutton)
			togglerka.BackgroundTransparency = 1
			togglerka.BorderSizePixel = 0
			togglerka.Position = UDim2.new(1, 15, 0, 0)
			togglerka.Size = UDim2.new(0, 100, 0, 33)
			togglerka.Font = Enum.Font.Code
			togglerka.Text = text
			togglerka.TextColor3 = Color3.fromRGB(222, 222, 222)
			togglerka.TextSize = 18.000
			togglerka.TextWrapped = true
			togglerka.TextXAlignment = Enum.TextXAlignment.Left

			if desc then
				local descripterka = Instance.new("TextLabel", togglerka)
				descripterka.BackgroundTransparency = 1.000
				descripterka.BorderSizePixel = 0
				descripterka.Position = UDim2.new(1, 15, 0, 0)
				descripterka.Size = UDim2.new(0, 175, 1, 0)
				descripterka.Font = Enum.Font.Code
				descripterka.Text = desc
				descripterka.TextColor3 = Color3.fromRGB(170, 170, 170)
				descripterka.TextSize = 14.000
				descripterka.TextWrapped = true
				descripterka.TextXAlignment = Enum.TextXAlignment.Left
			end

			toglbutton.MouseButton1Up:Connect(function()
				if isToggled then
					isToggled = false
					toglbutton.Text = "❎"
					func(isToggled)
				else
					isToggled = true
					toglbutton.Text = "✅"
					func(isToggled)
				end
			end)
		end

		function hichat:CreateSlider(text: string, func, desc: string, min: number, max: number)
			local value = min				
			local isdown = false

			local fullbar = Instance.new("Frame", MAINFRAME.Folder[name])
			fullbar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			fullbar.Position = UDim2.new(0, 0, 0, 0)
			fullbar.Size = UDim2.new(0, 125, 0, 20)
			cornered(fullbar, 8)

			local maxtext = Instance.new("TextLabel", fullbar)
			maxtext.BackgroundTransparency = 1.000
			maxtext.BorderSizePixel = 0
			maxtext.Position = UDim2.new(0, 140, 0, 0)
			maxtext.Size = UDim2.new(0, 30, 0, 20)
			maxtext.Font = Enum.Font.Code
			maxtext.Text = min
			maxtext.TextColor3 = Color3.fromRGB(170, 170, 170)
			maxtext.TextScaled = true


			local bar = Instance.new("Frame", fullbar)
			bar.BackgroundColor3 = buttoncolor
			bar.Size = UDim2.new(0, 0, 1, 0)
			cornered(bar, 8)				

			local cursor = Instance.new("TextButton", fullbar)
			cursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			cursor.Position = UDim2.new(0, -5, 0, -2)
			cursor.Size = UDim2.new(0, 10, 0, 25)
			cursor.TextTransparency = 1.000
			cornered(cursor, 100)

			cursor.MouseButton1Down:Connect(function()
				isdown = true
			end)

			game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					isdown = false
				end
			end)

			mouse.Move:Connect(function()
				if isdown then
					if mouse.X > fullbar.AbsoluteSize.X+fullbar.AbsolutePosition.X then
						bar.Size = UDim2.new(1, 0, 1, 0)
						cursor.Position = UDim2.new(1, -5, 0, -2.5)
						value = max
						maxtext.Text = value
					elseif mouse.X < fullbar.AbsolutePosition.X then
						bar.Size = UDim2.new(0, 0, 1, 0)
						cursor.Position = UDim2.new(0, -5, 0, -2.5)
						value = min
						maxtext.Text = value
					else
						bar.Size = UDim2.new(0, mouse.X-fullbar.AbsolutePosition.X, 1, 0)
						cursor.Position = UDim2.new(0, mouse.X-fullbar.AbsolutePosition.X-5, 0, -2.5)
						value = math.floor(max * (bar.Size.X.Offset/fullbar.AbsoluteSize.X))
						maxtext.Text = value
					end
					func(value)
				end
			end)

		end

		function hichat:CreateInput(text, func, desc)
			local inputbox = Instance.new("TextBox", MAINFRAME.Folder[name])
			inputbox.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			inputbox.BackgroundTransparency = 0.500
			inputbox.Size = UDim2.new(0, 125, 0, 33)
			inputbox.Font = Enum.Font.Code
			inputbox.PlaceholderText = text
			inputbox.Text = ""
			inputbox.TextColor3 = Color3.fromRGB(255, 255, 255)
			inputbox.TextSize = 14.000
			inputbox.TextWrapped = true
			cornered(inputbox, 10)
			
			local ibUIpd = Instance.new("UIPadding", inputbox)
			ibUIpd.PaddingBottom = UDim.new(0, 5)
			ibUIpd.PaddingLeft = UDim.new(0, 5)
			ibUIpd.PaddingRight = UDim.new(0, 5)
			ibUIpd.PaddingTop = UDim.new(0, 5)

			if desc then
				local desctext = Instance.new("TextLabel", inputbox)
				desctext.BackgroundTransparency = 1.000
				desctext.BorderSizePixel = 0
				desctext.Position = UDim2.new(1, 15, 0, 0)
				desctext.Size = UDim2.new(0, 200, 1, 0)
				desctext.Font = Enum.Font.Code
				desctext.Text = desc
				desctext.TextColor3 = Color3.fromRGB(170, 170, 170)
				desctext.TextSize = 14.000
				desctext.TextWrapped = true
				desctext.TextXAlignment = Enum.TextXAlignment.Left
			end

			inputbox.FocusLost:Connect(function()
				func(inputbox.Text)
			end)
		end

		function hichat:CreateKeybind(text, func, desc)
			local keybindbutton = Instance.new("TextButton", MAINFRAME.Folder[name])
			keybindbutton.BackgroundColor3 = Color3.fromRGB(157, 35, 35)
			keybindbutton.BackgroundTransparency = 0.500
			keybindbutton.Size = UDim2.new(0, 125, 0, 33)
			keybindbutton.Font = Enum.Font.Code
			keybindbutton.Text = text
			keybindbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
			keybindbutton.TextSize = 14.000
			keybindbutton.TextWrapped = true
			cornered(keybindbutton, 10)

			local kbbUIpd = Instance.new("UIPadding", keybindbutton)
			kbbUIpd.PaddingBottom = UDim.new(0, 5)
			kbbUIpd.PaddingLeft = UDim.new(0, 5)
			kbbUIpd.PaddingRight = UDim.new(0, 5)
			kbbUIpd.PaddingTop = UDim.new(0, 5)
			
			if desc then
				local desctext = Instance.new("TextLabel", keybindbutton)
				desctext.BackgroundTransparency = 1.000
				desctext.BorderSizePixel = 0
				desctext.Position = UDim2.new(1, 15, 0, 0)
				desctext.Size = UDim2.new(0, 200, 1, 0)
				desctext.Font = Enum.Font.Code
				desctext.Text = desc
				desctext.TextColor3 = Color3.fromRGB(170, 170, 170)
				desctext.TextSize = 14.000
				desctext.TextWrapped = true
				desctext.TextXAlignment = Enum.TextXAlignment.Left
			end
			
			local cooldown = false
			keybindbutton.MouseButton1Up:Connect(function()
				keybindbutton.Text = "Press any key"
				wait(0.3)
				game:GetService("UserInputService").InputEnded:Connect(function(inp)
					if not cooldown then
						cooldown = true
						keybindbutton.Text = tostring(inp.KeyCode)
						func(inp)
					end
				end)
				cooldown = false
			end)
		end
		
		function hichat:DeleteFolder()
			MAINFRAME:WaitForChild("pages"):FindFirstChild(name):Destroy()
			MAINFRAME:WaitForChild("Folder"):FindFirstChild(name):Destroy()
		end
		
		return hichat
	end

	return listmodule
end

return yummy
