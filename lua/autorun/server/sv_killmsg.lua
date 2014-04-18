util.AddNetworkString("killmessages")

hook.Add("PlayerDeath", "KillMessage", function(vic, inf, atk)
	net.Start("killmessages")
	net.WriteEntity(atk)
	net.WriteString(atk:GetRoleString())
	net.Send(vic)
end)