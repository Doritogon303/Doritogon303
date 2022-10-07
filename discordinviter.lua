local module = {}

function module:Invite(invitecode: string)
	invitecode = string.gsub(invitecode, "https://discord.gg/", "") or string.gsub(invitecode, "discord.gg/", "")

	local success, inviteData = pcall(function()
		return game:GetService("HttpService"):JSONDecode(http_request({Url = "https://ptb.discord.com/api/invites/".. invitecode, Method = "GET" }).Body)
	end)

	if success == true then
		http_request({Url = "http://127.0.0.1:6463/rpc?v=1", Method = "POST",
			Headers = {["Content-Type"] = "application/json",["Origin"] = "https://discord.com"},
			Body = game:GetService("HttpService"):JSONEncode({cmd = "INVITE_BROWSER", args = {code = inviteData.code},
			nonce = game:GetService("HttpService"):GenerateGUID(false)})
		})
	end

end

return module
