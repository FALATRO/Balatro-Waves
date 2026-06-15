SMODS.Atlas({
    key = "wuwa_tarots",
    path = "tarots.png",
    px = 71,
    py = 95,
})

SMODS.Consumable({
    key = "bamboo",
    set = "Tarot",
    pos = { x = 0, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 1, mod_conv = 'm_mm_aero' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'aero', set = 'Enhanced', key = m_mm_aero } } }
    end,
})

SMODS.Consumable({
    key = "glory",
    set = "Tarot",
    pos = { x = 1, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 1, mod_conv = 'm_mm_fusion' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'fusion', set = 'Enhanced', key = m_mm_fusion } } }
    end,
})

SMODS.Consumable({
    key = "inverted",
    set = "Tarot",
    pos = { x = 2, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 1, mod_conv = 'm_mm_spectro' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'spectro', set = 'Enhanced', key = m_mm_spectro } } }
    end,
})

SMODS.Consumable({
    key = "origin",
    set = "Tarot",
    pos = { x = 3, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 1, mod_conv = 'm_mm_electro' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'electro', set = 'Enhanced', key = m_mm_electro } } }
    end,
})

SMODS.Consumable({
    key = "snowfall",
    set = "Tarot",
    pos = { x = 4, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 2, mod_conv = 'm_mm_glacio' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'glacio', set = 'Enhanced', key = m_mm_glacio } } }
    end,
})

SMODS.Consumable({
    key = "crownless",
    set = "Tarot",
    pos = { x = 5, y = 0 },
    atlas = "wuwa_tarots",

config = { max_highlighted = 1, mod_conv = 'm_mm_havoc' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'havoc', set = 'Enhanced', key = m_mm_havoc } } }
    end,
})