SMODS.Atlas({
    key = "ForgingTide",
    path = "forgingtide.png",
    px = 34,
    py = 34,
})

SMODS.ConsumableType {
    key = "ForgingTide",
    primary_colour = HEX("FFFF00"),   
    secondary_colour = HEX("FFFF00"),  
    loc_txt = {
        name = "Forging Tide",
        collection = "Forging Tide"
    },
}

SMODS.Consumable {
    key = "ForgingTide",
    atlas = "ForgingTide",
    set = "ForgingTide",
    display_size = { w = 68, h = 68 },
    pos = { x = 0, y = 0 },
    cost = 4,

    loc_vars = function(self, info_queue, card)

    info_queue[#info_queue + 1] = {
        key = "e_mm_sword",
        set = "Edition",
        vars = { card.edition and card.edition.mult or 0 },
        config = { extra = G.P_CENTERS["e_mm_sword"].config }
    }

    info_queue[#info_queue + 1] = {
        key = "e_mm_broadblade",
        set = "Edition",
        vars = { card.edition and card.edition.x_mult or 1 },
        config = { extra = G.P_CENTERS["e_mm_broadblade"].config }
    }

    info_queue[#info_queue + 1] = {
        key = "e_mm_pistols",
        set = "Edition",
        vars = { card.edition and card.edition.chips or 0 },
        config = { extra = G.P_CENTERS["e_mm_pistols"].config }
    }

    info_queue[#info_queue + 1] = {
        key = "e_mm_gauntlets",
        set = "Edition",
        vars = { card.edition and card.edition.x_chips or 1 },
        config = { extra = G.P_CENTERS["e_mm_gauntlets"].config }
    }

    info_queue[#info_queue + 1] = {
        key = "e_mm_rectifier",
        set = "Edition",
        config = { extra = G.P_CENTERS["e_mm_rectifier"].config }
    }

    return {}
end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true)) ~= nil
    end,
   use = function(self, card, area, copier)
    local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()

            local eligible_card = pseudorandom_element(
                editionless_jokers,
                pseudoseed("mm_forgingtide_card")
            )

            if eligible_card then

                local editions = {
                    "e_mm_sword",
                    "e_mm_broadblade",
                    "e_mm_pistols",
                    "e_mm_gauntlets",
                    "e_mm_rectifier"
                }

                local chosen_edition = pseudorandom_element(
                    editions,
                    pseudoseed("mm_forgingtide_edition")
                )

                eligible_card:set_edition(chosen_edition)

                card_eval_status_text(
                    eligible_card,
                    'extra',
                    nil,
                    nil,
                    nil,
                    {
                        message = "Equipped!",
                        colour = G.C.RED
                    }
                )
            end

            return true
        end
    }))
end
}
