
local killmsg = {}
killmsg.chatcolor = Color(255,255,255,255)
killmsg.namecolor = Color(255,255,0,255)

net.Receive("killmessages", function()
	local atk = net.ReadEntity()
	local role = net.ReadString()

	if role == "traitor" || role == "detective" then 
		chat.AddText(killmsg.chatcolor, "You were killed by ", killmsg.namecolor, atk:Nick(), killmsg.chatcolor," they were a ", team.GetColor(atk:Team()), role..".")
	elseif role == "innocent" then 
		chat.AddText(killmsg.chatcolor, "You were killed by ", killmsg.namecolor, atk:Nick(), killmsg.chatcolor, " they were an ", team.GetColor(atk:Team()), role..".")
	else 
		chat.AddText(killmsg.chatcolor, "Something went horribly wrong :(")
	end
end)
