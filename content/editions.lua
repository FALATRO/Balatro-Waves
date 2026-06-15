SMODS.Edition({
    key = "sword",
    in_shop = false,
    shader = false,
    extra_cost = 4,
    config = {
        mult = 0
    },
    loc_txt = {
        label = "Sword",
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition and card.edition.mult or 0 } }
    end,

    calculate = function(self, card, context)
        if not card then return end

        card.edition = card.edition or {}
        card.edition.mult = card.edition.mult or 0

        if context.end_of_round and context.main_eval then

            card.edition.mult = card.edition.mult + 3
        end

        
    if context.pre_joker then
        return {
            mult = card.edition.mult
        }
    end
end,
})

SMODS.Edition({
    key = "broadblade",
    in_shop = false,
    shader = false,

    loc_txt = {
        label = "Broadblade",
    },

    config = {
        x_mult = 1
    },

    loc_vars = function(self, info_queue, card)
        local mult = (card.edition and card.edition.x_mult) or 1
        return {
            vars = { mult }
        }
    end,

    calculate = function(self, card, context)

        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            card.edition.x_mult = (card.edition.x_mult or 1) + 0.1
        end

        if context.post_joker then
            return {
                x_mult = card.edition and card.edition.x_mult or 1
            }
        end
    end,
})

SMODS.Edition({
    key = "pistols",
    in_shop = false,
    shader = false,
    extra_cost = 4,

    config = {
        chips = 0
    },

    loc_txt = {
        label = "Pistols",
    },

    loc_vars = function(self, info_queue, card)
        local chips = (card.edition and card.edition.chips) or 0
        return {
            vars = { chips }
        }
    end,

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play then
            card.edition.chips = (card.edition.chips or 0) + 1
        end

        if context.pre_joker then
            return {
                chips = card.edition and card.edition.chips or 0
            }
        end
    end,
})

SMODS.Edition({
    key = "gauntlets",
    in_shop = false,
    shader = false,
    extra_cost = 4,

    config = {
        x_chips = 1
    },

    loc_txt = {
        label = "Gauntlets",
    },

    loc_vars = function(self, info_queue, card)
        local xchips = (card.edition and card.edition.x_chips) or 1
        return {
            vars = { xchips }
        }
    end,

    calculate = function(self, card, context)

        if context.after and context.main_eval then
            card.edition.x_chips = (card.edition.x_chips or 1) + 0.05
        end

        if context.post_joker then
            return {
                x_chips = card.edition and card.edition.x_chips or 1
            }
        end
    end,
})

SMODS.Edition({
    key = "rectifier",
    in_shop = false,
    shader = false,
    extra_cost = 4,
    loc_txt = {
        label = "Rectifier",
    },
        calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            return {
                dollars = 3
            }
        end
    end,
})
