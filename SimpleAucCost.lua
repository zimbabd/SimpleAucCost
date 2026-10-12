local addon = CreateFrame("Frame")
local summaryText

local function UpdateSummary()
	if not summaryText or not AuctionFrameAuctions or not AuctionFrameAuctions:IsShown() then
		return
	end

	local lotCount = GetNumAuctionItems("owner") or 0
	local buyoutLotCount = 0
	local totalBuyout = 0

	for index = 1, lotCount do
		local _, _, _, _, _, _, _, _, buyoutPrice = GetAuctionItemInfo("owner", index)
		if buyoutPrice and buyoutPrice > 0 then
			buyoutLotCount = buyoutLotCount + 1
			totalBuyout = totalBuyout + buyoutPrice
		end
	end

	local estimatedProceeds = math.floor(totalBuyout * 0.95)
	summaryText:SetText(string.format(
		"Lots: %d (%d with Buyout)   Total: %s   Est. after 5%%: %s",
		lotCount,
		buyoutLotCount,
		GetCoinTextureString(totalBuyout),
		GetCoinTextureString(estimatedProceeds)
	))
end

local function CreateSummary()
	if not AuctionFrame or summaryText then
		return
	end

	summaryText = AuctionFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	summaryText:SetPoint("BOTTOMLEFT", AuctionFrame, "BOTTOMLEFT", 260, 20)
	summaryText:SetWidth(590)
	summaryText:SetJustifyH("LEFT")

	if AuctionFrameAuctions then
		AuctionFrameAuctions:HookScript("OnShow", UpdateSummary)
		AuctionFrameAuctions:HookScript("OnHide", function()
			summaryText:SetText("")
		end)
	end
	UpdateSummary()
end

addon:RegisterEvent("AUCTION_HOUSE_SHOW")
addon:RegisterEvent("AUCTION_HOUSE_CLOSED")
addon:RegisterEvent("AUCTION_OWNED_LIST_UPDATE")
addon:SetScript("OnEvent", function(_, event)
	if event == "AUCTION_HOUSE_SHOW" then
		CreateSummary()
	elseif event == "AUCTION_HOUSE_CLOSED" then
		if summaryText then
			summaryText:SetText("")
		end
	else
		UpdateSummary()
	end
end)
