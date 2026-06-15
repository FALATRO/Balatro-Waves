SMODS.Atlas({
    key = "modicon",
    path = "WuWa_icon.png",
    px = 34,
    py = 34
})

SMODS.Atlas({
    key = "mm_placeholder",
    path = "banned.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "mm_placeholder",
    loc_txt = {
        name = "BANNED",
        text = {
            "Non-Wuthering Waves Blinds",
            "are banned"
        },
    },
    config = {},
    rarity = 1,
    cost = 1,
    no_mod_badges = true,
    no_collection = true,
    no_doe = true,
    discovered = true,
    unlocked = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    atlas = "mm_placeholder",
    width = 71,
    height = 95,

    set_card_type_badge = function(self, card, badges)
        badges = nil
    end,

    in_pool = function(self, args)
        return false
    end
})

SMODS.current_mod.menu_cards = function()
    return { 
        key = "j_mm_butterfly",
        remove_original = true 
    }
end

SMODS.Atlas{
    key = "balatro",
    prefix_config = { key = false },
    path = "bwlogo.png",
    px = 2266,
    py = 1488,
}