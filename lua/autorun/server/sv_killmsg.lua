if SERVER then 
	util.AddNetworkString("killmessages")
	
	hook.Add("PlayerDeath", "KillMessage", function(vic, inf, atk)
		net.Start("killmessages")
		net.WriteEntity(atk)
		print(atk)
		if IsValid(atk) then 
			net.WriteString(atk:GetRoleString())
		else 
			net.WriteString("world")
		end
		net.Send(vic)
	end)
end 