getgenv().rotationcopier = true -- false to disable
local target = "twinki" -- can be shortened

-- actual code
local function getFullTargetUser()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name, target) then
			return v.Name
		end
	end
end
local fulluser = getFullTargetUser()
local targethrp = workspace[fulluser].HumanoidRootPart
local cam = workspace.CurrentCamera
while getgenv().rotationcopier == true do
	cam.CFrame = CFrame.new(targethrp.CFrame.Position, targethrp.CFrame.LookVector * 100)
	task.wait()
end