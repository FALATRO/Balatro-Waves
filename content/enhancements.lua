SMODS.Atlas({
    key = "wuwa_enhancements",
    path = "enhancements.png",
    px = 71,
    py = 95,
})

SMODS.Enhancement({
    key = "mm_aero",
    atlas = "wuwa_enhancements",
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            chance = 2,
            dollars = 5
        }
    },


    loc_vars = function(self, info_queue, card)
        local numerator = G.GAME and G.GAME.probabilities
            and G.GAME.probabilities.normal or 1
        local denominator = card.ability.extra.chance
        return { vars = { numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            local numerator = G.GAME.probabilities.normal or 1
            if pseudorandom("aero") < numerator / card.ability.extra.chance then
                return {
                    dollars = card.ability.extra.dollars,
                }
            end
        end
    end
})

SMODS.Enhancement{
    key = "mm_fusion",
    pos = { x = 1, y = 0 },
    atlas = "wuwa_enhancements",

    config = {
        extra = {
            mult_good = 3,
            mult_bad = 1/3,
            good_odds = 2, 
            bad_odds = 4   
        }
    },


    loc_vars = function(self, info_queue, card)
        local good_num, good_den = SMODS.get_probability_vars(
            card, 1, card.ability.extra.good_odds, "fusion_good"
        )
        local bad_num, bad_den = SMODS.get_probability_vars(
            card, 1, card.ability.extra.bad_odds, "fusion_bad"
        )

        return {
            vars = {
                good_num, good_den,
                bad_num, bad_den
            }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}

            if SMODS.pseudorandom_probability(
                card, "fusion_good", 1, card.ability.extra.good_odds
            ) then
                ret.xmult = card.ability.extra.mult_good
            end

            if SMODS.pseudorandom_probability(
                card, "fusion_bad", 1, card.ability.extra.bad_odds
            ) then
                ret.xmult = card.ability.extra.mult_bad
            end

            return next(ret) and ret or nil
        end
    end
}

SMODS.Enhancement({
    key = "mm_spectro",
    pos = { x = 2, y = 0 },
    atlas = "wuwa_enhancements",
    config = {
        extra = {
            mult = 0,
            gain = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.mult }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.mult =
                card.ability.extra.mult + card.ability.extra.gain

            return {
                mult = card.ability.extra.mult,
            }
        end
    end
})

SMODS.Enhancement({
    key = "mm_electro",
    pos = { x = 3, y = 0 },
    atlas = "wuwa_enhancements",

    calculate = function(self, card, context)
        if context.main_scoring
        and context.cardarea == G.play
        and G.GAME.current_round
        and G.GAME.current_round.hands_left == 0 then

            return {
                x_chips = 2
            }
        end
    end
})


SMODS.Enhancement({
    key = "mm_glacio",
    pos = { x = 4, y = 0 },
    atlas = "wuwa_enhancements",
})

local set_debuff_ref = Card.set_debuff

function Card:set_debuff(should_debuff)
    if SMODS.has_enhancement(self, "m_mm_glacio") then
        set_debuff_ref(self, false)
    else
        set_debuff_ref(self, should_debuff)
    end
end

local havoc_destroy_queue = 0

SMODS.Enhancement({
    key = "mm_havoc",
    pos = { x = 5, y = 0 },
    atlas = "wuwa_enhancements",

    calculate = function(self, card, context)

        if context.end_of_round then
            card.ability.havoc_pending = true
            havoc_destroy_queue = 0
        end

        if context.main_scoring
        and context.cardarea == G.play
        and not context.blueprint
        and not context.retrigger_joker
        then
            if not card.ability.havoc_pending then
                card.ability.havoc_pending = true
                havoc_destroy_queue = havoc_destroy_queue + 1
            end

            local selected_card = pseudorandom_element(
                G.hand.cards,
                'mm_havoc_destroy'
            )

            if selected_card then
                G.hand:remove_card(selected_card)
                selected_card:start_dissolve()
            end

            return {
                x_mult = 1.5
            }
        end
    end
})
