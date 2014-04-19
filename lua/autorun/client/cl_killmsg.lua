
local killmsg = {}
killmsg.chatcolor = Color(255,255,255,255)
killmsg.namecolor = Color(255,255,0,255)

net.Receive("killmessages", function()
	local atk = net.ReadEntity()
	local role = net.ReadString()

	if role == "world" then 
		chat.AddText(killmsg.chatcolor, "You were killed by the world.")
	elseif atk:IsValid() && atk:Nick() == LocalPlayer():Nick() then 
		chat.AddText(killmsg.chatcolor, "Nice job you managed to kill yourself.")
	elseif role == "traitor" || role == "detective" then 
		chat.AddText(killmsg.chatcolor, "You were killed by ", killmsg.namecolor, atk:Nick(), killmsg.chatcolor," they were a ", team.GetColor(atk:Team()), role..".")
	elseif role == "innocent" then 
		chat.AddText(killmsg.chatcolor, "You were killed by ", killmsg.namecolor, atk:Nick(), killmsg.chatcolor, " they were an ", team.GetColor(atk:Team()), role..".")
	else
		chat.AddText(killmsg.chatcolor, "You shouldnt see this. Contact the coder and let him know hes an idiot and tell him what happened before you saw this.")
	end
end)
