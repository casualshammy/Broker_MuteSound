local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("Broker_MuteSound", {
	type = "data source",
	text = "",
	icon = (GetCVarBool("Sound_EnableAllSound") == nil and "Interface\\AddOns\\Broker_MuteSound\\Media\\Muted.tga") or "Interface\\AddOns\\Broker_MuteSound\\Media\\NotMuted.tga",
	tocname = "Broker_MuteSound"}
);
LDB.OnTooltipShow = function(tooltip)
	-- // todo
	tooltip:AddLine("Broker: MuteSound");
	tooltip:AddLine("|cffeda55fLeftClick:|r mute/unmute sound");
	-- tooltip:AddLine("|cffeda55fRightClick:|r show options");
end
LDB.OnClick = function(displayFrame, button)
	if (GetCVarBool("Sound_EnableAllSound") == nil) then
		SetCVar("Sound_EnableAllSound", 1, true);
		LDB.icon = "Interface\\AddOns\\Broker_MuteSound\\Media\\NotMuted.tga";
	else
		SetCVar("Sound_EnableAllSound", nil, true);
		LDB.icon = "Interface\\AddOns\\Broker_MuteSound\\Media\\Muted.tga";
	end
end