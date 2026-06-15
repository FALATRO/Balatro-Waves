SMODS.Atlas({
    key = "wuwa_vouchers",
    path = "vouchers.png",
    px = 71,
    py = 95,
})

SMODS.Voucher({
    key = "minor",
    pos = { x = 0, y = 0 },
    atlas = "wuwa_vouchers",
    set = "Voucher",

    redeem = function(self, card)
    G.GAME.mm_banner_rate = 2
end
})

SMODS.Voucher({
    key = "major",
    pos = { x = 1, y = 0 },
    requires = { 'v_mm_minor' },
    atlas = "wuwa_vouchers",
    set = "Voucher",

    redeem = function(self)
    G.GAME.mm_banner_slot = true
    G.GAME.mm_banner_rate = 0
end
})