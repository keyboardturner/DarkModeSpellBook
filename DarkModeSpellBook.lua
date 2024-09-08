local _, L = ...

local f = CreateFrame("Frame");
f:RegisterEvent("ADDON_LOADED");

local DefaultSettings = {
	Name = {
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},
	Text = {
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},
	SubName = {
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},
	Backplate_OnEnter = {
		r = .78,
		g = .69,
		b = .47,
		a = .53,
	},
	Backplate_OnLeave = {
		r = .5,
		g = .5,
		b = .5,
		a = .34,
	},
	Background = {
		r = .5,
		g = .5,
		b = .5,
		a = 1,
	},
	Bookmark = {
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},
	Border = {
		r = .5,
		g = .5,
		b = .5,
		a = 1,
	},
	PageText = {
		r = 1,
		g = 1,
		b = 1,
		a = 1,
	},
	HideButton = false,
	FadeFrame = true,
};

local function ShowColorPicker(r, g, b, a, setting)

	local function OnColorChanged()
		local newR, newG, newB = ColorPickerFrame:GetColorRGB();
		local newA = ColorPickerFrame:GetColorAlpha();
		DMSB_DB[setting].r, DMSB_DB[setting].g, DMSB_DB[setting].b, DMSB_DB[setting].a = newR, newG, newB, newA
		f.SetColors()
	end

	local function OnCancel()
		DMSB_DB[setting].r, DMSB_DB[setting].g, DMSB_DB[setting].b, DMSB_DB[setting].a = r, g, b, a
		f.SetColors()
	end

	local options = {
		swatchFunc = OnColorChanged,
		opacityFunc = OnColorChanged,
		cancelFunc = OnCancel,
		hasOpacity = true,
		opacity = a,
		r = r,
		g = g,
		b = b,
	};

  ColorPickerFrame:SetupColorPickerAndShow(options);
end


f.button = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
f.button:SetWidth(164)
f.button:SetHeight(22)
f.button:SetPoint("CENTER", nil, "CENTER", 0, 0)
f.button:SetText("Spellbook Colors")
f.button:SetNormalFontObject("GameFontNormal")
f.button:SetScript("OnClick", function(self, button)
	if f.BackdropFrame:IsShown() then
		f.BackdropFrame:Hide()
	else
		f.BackdropFrame:Show()
	end
end)
f.button:Hide()

f.backdropInfo ={
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileEdge = true,
	tileSize = 8,
	edgeSize = 8,
	insets = { left = 1, right = 1, top = 1, bottom = 1 },
};

f.BackdropFrame = CreateFrame("Frame", nil, f.button, "BackdropTemplate")
f.BackdropFrame:SetPoint("BOTTOMLEFT", f.button, "TOPLEFT", 0, 0)
f.BackdropFrame:SetWidth(130*2)
f.BackdropFrame:SetHeight((26*11))
f.BackdropFrame:SetBackdrop(f.backdropInfo)
f.BackdropFrame:Hide()
f.BackdropFrame:SetBackdropColor(0,0,0,1)
f.closebutton = CreateFrame("Button", nil, f.BackdropFrame, "UIPanelCloseButton")
f.closebutton:SetWidth(24)
f.closebutton:SetHeight(24)
f.closebutton:SetPoint("TOPRIGHT", f.BackdropFrame, "TOPRIGHT", 1, 1)
f.closebutton:SetScript("OnClick", function(self, button)
	f.BackdropFrame:Hide()
end)

f.BackdropFrame.TitleFrame = f.BackdropFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
f.BackdropFrame.TitleFrame:SetFont(STANDARD_TEXT_FONT, 15);
f.BackdropFrame.TitleFrame:ClearAllPoints();
f.BackdropFrame.TitleFrame:SetPoint("TOPLEFT", f.BackdropFrame, "TOPLEFT",10,-7);
f.BackdropFrame.TitleFrame:SetText(NORMAL_FONT_COLOR_CODE .. COLOR_PICKER .. "|r");

local function getAnchors(frame)
	local x, y = frame:GetCenter()
	if not x or not y then return "CENTER" end
	local hhalf = (x > UIParent:GetWidth()*2/3) and "RIGHT" or (x < UIParent:GetWidth()/3) and "LEFT" or ""
	local vhalf = (y > UIParent:GetHeight()/2) and "TOP" or "BOTTOM"
	return vhalf..hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP")..hhalf
end

function f.tooltip_OnEnter(frame, tooltip)
	GameTooltip:SetOwner(frame, "ANCHOR_NONE")
	GameTooltip:SetPoint(getAnchors(frame))
	--GameTooltip_SetDefaultAnchor(GameTooltip, frame);
	--GameTooltip_SetTitle(GameTooltip);
	GameTooltip_AddNormalLine(GameTooltip, tooltip);
	GameTooltip:Show();
end

function f.tooltip_OnLeave()
	GameTooltip:Hide();
end

local backdropPlacement = 1
for kebble, vabble in pairs(DefaultSettings) do
	if kebble ~= "HideButton" and kebble ~= "FadeFrame" then
		backdropPlacement = backdropPlacement + 1
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)] = CreateFrame("Button", nil, f.BackdropFrame, "UIPanelButtonTemplate");
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetPoint("TOPLEFT", f.BackdropFrame, "TOPLEFT", 10, -23*backdropPlacement+20);
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetSize(164, 22);
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetText(L[kebble]);
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetScript("OnClick", function()
			ShowColorPicker(DMSB_DB[kebble].r, DMSB_DB[kebble].g, DMSB_DB[kebble].b, DMSB_DB[kebble].a, kebble);
		end)
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetScript("OnEnter", function(self)
			f.tooltip_OnEnter(self, L[kebble.."TT"]);
		end);
		f.BackdropFrame["DMSBsettingsFrame_" .. tostring(kebble)]:SetScript("OnLeave", f.tooltip_OnLeave);
	end
end

backdropPlacement = backdropPlacement + 1
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox = CreateFrame("CheckButton", nil, f.BackdropFrame, "UICheckButtonTemplate");
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:SetPoint("TOPLEFT", f.BackdropFrame, "TOPLEFT", 10, -23*backdropPlacement+20);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:SetScript("OnClick", function(self)
	if self:GetChecked() then
		DMSB_DB["FadeFrame"] = true;
	else
		DMSB_DB["FadeFrame"] = false;
	end
end);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:SetScript("OnEnter", function(self)
	f.tooltip_OnEnter(self, L["FadeFrameTT"]);
end);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:SetScript("OnLeave", f.tooltip_OnLeave);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text = f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:CreateFontString();
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text:SetFont(STANDARD_TEXT_FONT, 11);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text:SetPoint("LEFT", f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox, "RIGHT", 0, 0);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text:SetText(L["FadeFrame"]);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text:SetScript("OnEnter", function(self)
	f.tooltip_OnEnter(self, L["FadeFrameTT"]);
end);
f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox.text:SetScript("OnLeave", f.tooltip_OnLeave);

backdropPlacement = backdropPlacement + 1
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox = CreateFrame("CheckButton", nil, f.BackdropFrame, "UICheckButtonTemplate");
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:SetPoint("TOPLEFT", f.BackdropFrame, "TOPLEFT", 10, -23*backdropPlacement+20);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:SetScript("OnClick", function(self)
	if self:GetChecked() then
		DMSB_DB["FadeFrame"] = true;
	else
		DMSB_DB["FadeFrame"] = false;
	end
end);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:SetScript("OnEnter", function(self)
	f.tooltip_OnEnter(self, L["HideButtonTT"]);
end);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:Disable();
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:SetScript("OnLeave", f.tooltip_OnLeave);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text = f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox:CreateFontString();
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text:SetFont(STANDARD_TEXT_FONT, 11);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text:SetPoint("LEFT", f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox, "RIGHT", 0, 0);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text:SetText(L["HideButton"]);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text:SetScript("OnEnter", function(self)
	f.tooltip_OnEnter(self, L["HideButtonTT"]);
end);
f.BackdropFrame.DMSBsettingsFrame_Hide_Checkbox.text:SetScript("OnLeave", f.tooltip_OnLeave);


local function RePosition()
	f.button:ClearAllPoints()
	f.button:Hide()
	if PlayerSpellsFrame and PlayerSpellsFrame.SpellBookFrame then
		f.button:SetParent(PlayerSpellsFrame.SpellBookFrame)
		f.button:SetPoint("BOTTOMLEFT", PlayerSpellsFrame.SpellBookFrame, "BOTTOMLEFT", 75, 40)
		f.button:SetFrameStrata(PlayerSpellsFrame.SpellBookFrame:GetFrameStrata())
		f.button:SetFrameLevel(PlayerSpellsFrame.SpellBookFrame:GetFrameLevel()+100)
		
		if DMSB_DB["HideButton"] ~= true then
			f.button:Show()
		end
	else
		f.button:Hide()
	end
end


local bongus = {};

local HOOKED_BEEPISES = {};

function f.color(setting)
	return DMSB_DB[setting].r, DMSB_DB[setting].g, DMSB_DB[setting].b, DMSB_DB[setting].a
end

function f.SetColors()
	for key, scrungus in pairs(bongus) do
		if scrungus then
			local beepis = scrungus:GetLayoutChildren();
			for k, v in pairs(beepis) do
				if beepis[k].Name then
					beepis[k].Name:SetTextColor(f.color("Name")); -- spell names
				end
				if beepis[k].Text then
					beepis[k].Text:SetTextColor(f.color("Text")); -- class / spec big text
				end
				if beepis[k].SubName then
					beepis[k].SubName:SetTextColor(f.color("SubName")); -- small subnames (ie Passive)
				end
				if beepis[k].Backplate then
					--beepis[k].defaultBackplateAlpha = 1 -- causes combat taint
					--beepis[k].hoverBackplateAlpha = 0.5
					--beepis[k].Backplate:SetAlpha(0)

					beepis[k].Backplate:SetVertexColor(f.color("Backplate_OnLeave")); -- *all* the textures behind text
				end

				
				if beepis[k].Button then	
					if not HOOKED_BEEPISES[beepis[k].Button] then -- some backplates get recycled around
						beepis[k].Button:HookScript("OnEnter", function()
							beepis[k].Backplate:SetVertexColor(f.color("Backplate_OnEnter"));
						end);
						beepis[k].Button:HookScript("OnLeave", function()
							beepis[k].Backplate:SetVertexColor(f.color("Backplate_OnLeave"));
						end);
						HOOKED_BEEPISES[beepis[k].Button] = true;
					end
				end

				if beepis[k].Border then
					beepis[k].Border:SetVertexColor(f.color("Border")); -- seprators
				end
			end
			if PlayerSpellsFrame.SpellBookFrame.BookBGLeft then
				PlayerSpellsFrame.SpellBookFrame.BookBGLeft:SetVertexColor(f.color("Background"));
			end
			if PlayerSpellsFrame.SpellBookFrame.BookBGRight then
				PlayerSpellsFrame.SpellBookFrame.BookBGRight:SetVertexColor(f.color("Background"));
			end
			if PlayerSpellsFrame.SpellBookFrame.BookCornerFlipbook then
				PlayerSpellsFrame.SpellBookFrame.BookCornerFlipbook:SetVertexColor(f.color("Background"));
			end
			if PlayerSpellsFrame.SpellBookFrame.BookBGHalved then
				PlayerSpellsFrame.SpellBookFrame.BookBGHalved:SetVertexColor(f.color("Background"));
			end
			if PlayerSpellsFrame.SpellBookFrame.Bookmark then
				PlayerSpellsFrame.SpellBookFrame.Bookmark:SetVertexColor(f.color("Bookmark"));
			end
			if PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.PagingControls.PageText then
				PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.PagingControls.PageText:SetVertexColor(f.color("PageText"));
			end
	
		end
	end

	RePosition()
end

-- Using Blizz's globally accessible frame fade function causes taint with the map
-- So just add their own code in locally

local FrameFaderDriver;
local fadingFrames;
local deferredFadingFrames;

local function OnUpdate(self, elapsed)
	local isMoving = IsPlayerMoving();
	for frame, setting in pairs(fadingFrames) do
		local fadeOut = isMoving and (not setting.fadePredicate or setting.fadePredicate());
		frame:SetAlpha(DeltaLerp(frame:GetAlpha(), fadeOut and setting.minAlpha or setting.maxAlpha, .1, elapsed));
	end
end

local function MergeDeferredEvents()
	if deferredFadingFrames then
		for frame, setting in pairs(deferredFadingFrames) do
			fadingFrames[frame] = setting;
		end
		deferredFadingFrames = nil;
	end
end

local function OnEvent(self, event, ...)
	if event == "PLAYER_STARTED_MOVING" 
	or event == "PLAYER_STOPPED_MOVING" 
	or event == "PLAYER_IS_GLIDING_CHANGED" 
	or event == "PLAYER_IMPULSE_APPLIED" then
		MergeDeferredEvents();
	end
end

local function InitializeDriver()
	if not FrameFaderDriver then
		fadingFrames = {};

		FrameFaderDriver = CreateFrame("FRAME");
		FrameFaderDriver:SetScript("OnUpdate", OnUpdate);
		FrameFaderDriver:SetScript("OnEvent", OnEvent);
		FrameFaderDriver:RegisterEvent("PLAYER_STARTED_MOVING");
		FrameFaderDriver:RegisterEvent("PLAYER_STOPPED_MOVING");
		FrameFaderDriver:RegisterEvent("PLAYER_IS_GLIDING_CHANGED");
		FrameFaderDriver:RegisterEvent("PLAYER_IMPULSE_APPLIED");
	end
end

local function PackFadeData(minAlpha, maxAlpha, durationSec, fadePredicate)
	return { minAlpha = minAlpha or .5, maxAlpha = maxAlpha or 1, durationSec = durationSec or 1, fadePredicate = fadePredicate };
end

local function RemoveFrameInternal(frame)
	if fadingFrames then
		fadingFrames[frame] = nil;
	end
	if deferredFadingFrames then
		deferredFadingFrames[frame] = nil;
	end
end

local PlayerMovementFrameFader = {};

function PlayerMovementFrameFader.AddFrame(frame, minAlpha, maxAlpha, durationSec, fadePredicate)
	RemoveFrameInternal(frame);

	InitializeDriver();
	fadingFrames[frame] = PackFadeData(minAlpha, maxAlpha, durationSec, fadePredicate);
end

-- The fading won't take effect until the player stops or starts moving again
function PlayerMovementFrameFader.AddDeferredFrame(frame, minAlpha, maxAlpha, durationSec, fadePredicate)
	InitializeDriver();
	RemoveFrameInternal(frame);

	if not deferredFadingFrames then
		deferredFadingFrames = {};
	end
	deferredFadingFrames[frame] = PackFadeData(minAlpha, maxAlpha, durationSec, fadePredicate);
end

function PlayerMovementFrameFader.RemoveFrame(frame)
	local maxAlpha = fadingFrames and fadingFrames[frame] and fadingFrames[frame].maxAlpha;
	if maxAlpha then
		frame:SetAlpha(maxAlpha);
	end

	RemoveFrameInternal(frame, restoreAlpha);
end

local function SetupFade(self)
	if DMSB_DB["FadeFrame"] ~= true then
		return
	end
	local minAlpha = 0.5;
	local maxAlpha = 1.0;
	local duration = 0.5;
	local predicate = function() return not self:IsMouseOver(); end;
	PlayerMovementFrameFader.AddDeferredFrame(self, minAlpha, maxAlpha, duration, predicate);
end

local function CleanupFade(self)
	PlayerMovementFrameFader.RemoveFrame(self);
end

local function ToggleButton()
	if DMSB_DB["HideButton"] == true then
		DMSB_DB["HideButton"] = false;
		if PlayerSpellsFrame.SpellBookFrame:IsShown() then
			f.button:Show();
		end
		return
	end
	if DMSB_DB["HideButton"] == false then
		DMSB_DB["HideButton"] = true;
		if PlayerSpellsFrame.SpellBookFrame:IsShown() then
			f.button:Hide();
		end
		return
	end
end

function f.event(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == "DarkModeSpellBook" then
		if DMSB_DB == nil then
			DMSB_DB = CopyTable(DefaultSettings)
		end
		f.BackdropFrame.DMSBsettingsFrame_Fade_Checkbox:SetChecked(DMSB_DB["FadeFrame"])

		if C_AddOns.IsAddOnLoaded("DarkModeSpellBook") == true and C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") == true then
			f:UnregisterEvent("ADDON_LOADED");
		end
	end
	if event == "ADDON_LOADED" and arg1 == "Blizzard_PlayerSpells" then
		--print("Blizzard_PlayerSpells loaded, executing function");
		bongus = {
			PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.View1,
			PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.View2,
			PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.BookBGHalved,
		};
		
		hooksecurefunc(PlayerSpellsFrame.SpellBookFrame.PagedSpellsFrame.elementTemplateData.SPELL, "initFunc", f.SetColors);
		if C_AddOns.IsAddOnLoaded("DarkModeSpellBook") == true and C_AddOns.IsAddOnLoaded("Blizzard_PlayerSpells") == true then
			f:UnregisterEvent("ADDON_LOADED");
		end
		
		PlayerSpellsFrame:HookScript("OnShow", SetupFade);
		PlayerSpellsFrame:HookScript("OnHide", CleanupFade);

		
		function DarkModeSpellBook_OnAddonCompartmentClick(addonName, buttonName, menuButtonFrame)
			ToggleButton()
		end

		function DarkModeSpellBook_OnAddonCompartmentEnter(addonName, menuButtonFrame)
			local tooltipData = {
				L["HideButtonTT"],
			}
			local concatenatedString
			for k, v in ipairs(tooltipData) do
				if concatenatedString == nil then
					concatenatedString = v
				else
					concatenatedString = concatenatedString .. "\n".. v
				end
				
			end
			f.tooltip_OnEnter(menuButtonFrame, concatenatedString);
		end

		function DarkModeSpellBook_OnAddonCompartmentLeave(addonName, menuButtonFrame)
			f.tooltip_OnLeave();
		end
	end

end

f:SetScript("OnEvent", f.event);
