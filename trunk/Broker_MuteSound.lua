local tFrame = CreateFrame("frame");
tFrame.elapsed = 0;

local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("Broker_MuteSound", {
	type = "data source",
	text = "",
	icon = "Interface\\AddOns\\Broker_MuteSound\\Media\\NotMuted.tga",
	tocname = "Broker_MuteSound"}
);

LDB.OnTooltipShow = function(tooltip)
	tooltip:AddLine("Broker: MuteSound");
	tooltip:AddLine("|cffeda55fLeftClick:|r mute/unmute sound");
end

local function Timer_OnElapsed()
	if (not GetCVarBool("Sound_EnableAllSound")) then
		LDB.icon = "Interface\\AddOns\\Broker_MuteSound\\Media\\Muted.tga";
	else
		LDB.icon = "Interface\\AddOns\\Broker_MuteSound\\Media\\NotMuted.tga";
	end
end

LDB.OnClick = function(displayFrame, button)
	if (not GetCVarBool("Sound_EnableAllSound")) then
		SetCVar("Sound_EnableAllSound", 1, true);
	else
		SetCVar("Sound_EnableAllSound", false, true);
	end
	Timer_OnElapsed();
end

tFrame:SetScript("OnUpdate", function(this, elapsed)
	this.elapsed = this.elapsed + elapsed;
	if (this.elapsed >= 1.0) then
		Timer_OnElapsed();
		this.elapsed = 0;
	end
end);