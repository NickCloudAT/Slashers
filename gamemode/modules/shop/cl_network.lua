-- Utopia Games - Slashers
--
-- @Author: Garrus2142
-- @Date:   2017-07-25 16:15:51
-- @Last Modified by:   Garrus2142
-- @Last Modified time: 2017-07-26 14:49:07

local function OnTeamWin()
	messages.PrintFade("Thanks for playing Slashers on NickCloud.", ScrH() - 50, 25, 3, Color(181, 137, 0), "horrortext")
end
hook.Add("sls_round_OnTeamWin", "sls_shop_OnTeamWin", OnTeamWin)
