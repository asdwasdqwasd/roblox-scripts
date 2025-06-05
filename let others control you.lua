local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local owners = {}
local function notify(title, text)
	game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = title,
    Text = text
})
end
notify("hey", "script ran")
local character = Players.LocalPlayer.Character
TextChatService.MessageReceived:Connect(function(msg)
	if msg.Text == "!controlme" then
		for i,v in pairs(Players:GetChildren()) do
			if v.UserId == msg.TextSource.UserId then
				table.insert(owners, v.Name)
				notify("owner changed", "owner is now: "..owners[#owners])
			    task.spawn(function()
			        while true do
						character.Humanoid.WalkSpeed = 0
						character.Humanoid.JumpPower = 0
						if v.Name == owners[#owners] then
							character.HumanoidRootPart.Velocity = workspace[v.Name].HumanoidRootPart.Velocity * 1.5
						else
							return
						end
    				    task.wait()
				    end
				end)
				return
			end
		end
		return
	else
		for i,v in pairs(Players:GetChildren()) do
			if v.UserId == msg.TextSource.UserId then
				print(v.Name .. ": " .. msg.Text)
				local owner = v.Name
			end
		end
	end
end)
