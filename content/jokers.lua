SMODS.Atlas({
    key = "wuwa_jokers",
    px = 71,
    py = 95,
    path = "jokers.png"
})

SMODS.Joker({
    key = "mm_worker",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    atlas = "wuwa_jokers",
    pos = {x = 0, y = 0},

    config = {
        extra = {
            mult = 7,
            chips = 24,
            count = 0,
            goal = 10
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.goal - card.ability.extra.count
            }
        }
    end,

    calculate = function(self, card, context)

        if context.individual
        and context.cardarea == G.play
        and (context.other_card:get_id() == 9
        or context.other_card:get_id() == 5) then

            card.ability.extra.count =
                card.ability.extra.count + 1

            if card.ability.extra.count >= card.ability.extra.goal then

                card.ability.extra.count = 0

                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                    dollars = 10,
                    message = "Payment!"
                }
            end

            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end, 
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})


SMODS.Joker({
    key = "mm_crystalization",
    rarity = 3,
    cost = 12,
    atlas = "wuwa_jokers",
    blueprint_compat = true,
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            step = 0.5,
            dollars = 15
        }
    },

    loc_vars = function(self, info_queue, card)
        local money = G.GAME.dollars

        return {
            vars = {
                card.ability.extra.step,
                card.ability.extra.dollars,
                1 + card.ability.extra.step *
                    math.floor(money / card.ability.extra.dollars)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local money = G.GAME.dollars

            return {
                Xmult = 1 +
                    card.ability.extra.step *
                    math.floor(money / card.ability.extra.dollars)
            }
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})


local function count_blue_seals()
    local count = 0

    if not G or not G.playing_cards then
        return 0
    end

    for _, card in ipairs(G.playing_cards) do
        if card.seal and tostring(card.seal):lower():find("blue") then
            count = count + 1
        end
    end

    return count
end

SMODS.Joker({
    key = "mm_mysterious",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    atlas = "wuwa_jokers",
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            xmult_per_seal = 0.75
        }
    },

    loc_vars = function(self, info_queue, card)
        local seals = count_blue_seals()

        return {
            vars = {
                card.ability.extra.xmult_per_seal,
                1 + seals * card.ability.extra.xmult_per_seal
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = 1 + count_blue_seals() *
                    card.ability.extra.xmult_per_seal
            }
        end
    end,

    locked_loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_per_seal,
                1
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_pero",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    atlas = "wuwa_jokers",
    pos = { x = 3, y = 0 },

    config = { extra = { Xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local max_slots = G.jokers.config.card_limit or 0
            local filled = #G.jokers.cards

            if filled >= max_slots and max_slots > 0 then

                return { Xmult = card.ability.extra.Xmult }
            end
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_seafaring",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    atlas = "wuwa_jokers",
    pos = { x = 4, y = 0 },

    config = { extra = { chips = 7, total = 0 } },

  
    loc_vars = function(self, info_queue, card)
        local extra = card.ability.extra
        return { vars = { extra.total } }
    end,

    calculate = function(self, card, context)
        
        if context.joker_main and card.ability.extra then
            card.ability.extra.total = card.ability.extra.total + card.ability.extra.chips
        end
  
        if context.joker_main then
            return { chips = card.ability.extra.total }
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker {
    key = "mm_acolyte",
    rarity = 3,
    blueprint_compat = false,
    cost = 8,
    pos = { x = 5, y = 0 },
    atlas = "wuwa_jokers", 

    config = {
        reduction = 0.25
    },

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and context.blind and context.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.GAME.blind and G.GAME.blind.chips then
                                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - self.config.reduction))
                                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                            end
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = "-25% Boss Requirement" }, card)
                    return true
                end
            }))
            return nil, true
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
            if G.GAME.blind.chips then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * (1 - self.config.reduction))
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            end
            SMODS.calculate_effect({ message = "-25% Boss Requirement" }, card)
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
}

SMODS.Joker({
    key = "mm_bard",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 6, y = 0 },
    atlas = "wuwa_jokers", 

    config = { extra = { Xmult = 1 } },

    loc_vars = function(self, info_queue, card)
        local count = 1
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                if j.config and j.config.center and j.config.center.rarity == 1 then
                    count = count + 1
                end
            end
        end
        return { vars = { card.ability.extra.Xmult, count * card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 1
            for _, j in ipairs(G.jokers.cards) do
                if j.config and j.config.center and j.config.center.rarity == 1 then
                    count = count + 1
                end
            end
            if count > 0 then
                return {
                    Xmult = count * card.ability.extra.Xmult
                }
            end
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_two_sided",
    rarity = 3,
    blueprint_compat = false,
    cost = 10,
    pos = { x = 7, y = 0 },
    atlas = "wuwa_jokers",

    config = { extra = { chance = 6 } },

    loc_vars = function(self, info_queue, card)
       
        local numerator = G.GAME and G.GAME.probabilities and G.GAME.probabilities.normal or 1
        local denominator = card.ability.extra.chance
        return { vars = { numerator, denominator } }
    end,

    calculate = function(self, card, context)

        if context.retrigger_joker_check then
            local jokers = G.jokers.cards
            if #jokers > 1 then
                local rightmost = jokers[#jokers]
                if context.other_card == rightmost and context.other_card ~= card then
                    return { repetitions = 2 }
                end
            end
        end

        if context.setting_blind and not context.blueprint then
            local chance = card.ability.extra.chance
            if pseudorandom("mm_two_sided") < (G.GAME.probabilities.normal / chance) then
                if #G.jokers.cards > 1 then
                    local card_to_destroy = pseudorandom_element(G.jokers.cards, "random_destroy")
                    if card_to_destroy and card_to_destroy ~= card then
                        SMODS.destroy_cards(card_to_destroy)
                        SMODS.calculate_effect({ message = "Destroyed" }, card)
                        return
                    end
                end
            end
            return { message = localize('k_safe_ex') }
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Black Shores",
            HEX("3d2866"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_butterfly",
    rarity = 3,
    blueprint_compat = true,
    cost = 10,
    pos = { x = 8, y = 0 },
    atlas = "wuwa_jokers",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {
            key = 'e_negative_consumable',
            set = 'Edition',
            config = { extra = 1 }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind
            and context.blind
            and context.blind.boss then

            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.add_card({
                        set = 'Spectral',
                        edition = { negative = true }
                    })
                    return true
                end
            }))
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Black Shores",
            HEX("3d2866"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_lively",
    rarity = 3,
    blueprint_compat = true,
    cost = 9,
    pos = { x = 0, y = 1 },
    atlas = "wuwa_jokers",

    config = { extra = { repetitions = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and next(SMODS.get_enhancements(context.other_card))then
            return {
                repetitions = 1
            }
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Black Shores",
            HEX("3d2866"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_justice",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 1, y = 1 },
    atlas = "wuwa_jokers",

    config = { extra = { gain = 0.5, bosses_defeated = 0 } },

    loc_vars = function(self, info_queue, card)
        local e = card.ability.extra
        return { vars = { e.gain, 1 + (e.bosses_defeated * e.gain) } }
    end,

    calculate = function(self, card, context)
        local e = card.ability.extra

        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            e.bosses_defeated = e.bosses_defeated + 1
            return {
                message = "Victory will be ours",
                colour = G.C.GREEN
            }
        end

        if context.joker_main then
            local total_mult = 1 + (e.bosses_defeated * e.gain)
            return { Xmult = total_mult }
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_logical",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 2, y = 1 },
    atlas = "wuwa_jokers",

  config = { extra = { mult_gain = 5, mult = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, localize('Flush', 'poker_hands'), card.ability.extra.mult } }
    end,
calculate = function(self, card, context)
    local mult_gain = card.ability.extra.mult_gain or 5
    local total_mult = card.ability.extra.mult or 0

    if context.before and not context.blueprint and context.poker_hands then
        local hands = context.poker_hands

        if (hands['Flush'] and next(hands['Flush'])) or
           (hands['Straight Flush'] and next(hands['Straight Flush'])) or
           (hands['Flush House'] and next(hands['Flush House'])) or
           (hands['Flush Five'] and next(hands['Flush Five'])) then

            total_mult = total_mult + mult_gain
            card.ability.extra.mult = total_mult

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.RED
            }
        end
    end

    if context.joker_main then
        return {
            mult = total_mult
        }
    end
end,
   set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_leader",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 3, y = 1 },
    atlas = "wuwa_jokers",

    config = { extra = { mult = 3 } },

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G and G.deck and G.deck.cards then
            for _, v in ipairs(G.deck.cards) do
                if v:is_face() then
                    count = count + 1
                end
            end
        end
        return { vars = { count * card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            if G and G.deck and G.deck.cards then
                for _, v in ipairs(G.deck.cards) do
                    if v:is_face() then
                        count = count + 1
                    end
                end
            end
            if count > 0 then
                return {
                    mult = count * card.ability.extra.mult
                }
            end
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_artist",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 4, y = 1 },
    atlas = "wuwa_jokers",

 calculate = function(self, card, context)
    if context.setting_blind then

        local cen_pool = {}
        for _, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if v.key ~= "m_glass" and (v.key == "m_bonus" or v.key == "m_wild" or v.key == "m_mult" or v.key == "m_steel" or v.key == "m_gold" or v.key == "m_mm_aero" or v.key == "m_mm_fusion" or v.key == "m_mm_spectro" or v.key == "m_mm_electro" or v.key == "m_mm_glacio" or v.key == "m_mm_havoc") then
                table.insert(cen_pool, v)
            end
        end

        local selected_center = pseudorandom_element(cen_pool, pseudoseed("the_queen"))

        local suits = {"H", "D", "C", "S"}         
        local faces = {"J", "Q", "K"}              
        local rand_suit = suits[math.random(#suits)]
        local rand_face = faces[math.random(#faces)]

        local _card = create_playing_card({
            front = G.P_CARDS[rand_suit .. "_" .. rand_face],
            center = selected_center,
            area = G.discard
        })

        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand:emplace(_card)
                _card:start_materialize()
                SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                return true
            end
        }))
    end
end,
   set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker {
    key = "mm_monk",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pos = { x = 5, y = 1 },
    atlas = "wuwa_jokers",
    config = { extra = { xchips = 3 } },
    loc_vars = function(self, info_queue, card)
        local suit = (G.GAME.current_round.vremade_monk or {}).suit or "Spades"
        return {
            vars = {
                card.ability.extra.xchips,
                localize(suit, "suits_singular"),
                colours = { G.C.SUITS[suit] }
            }
        }
    end, 

    calculate = function(self, card, context)
        if context.joker_main then
            local chosen = (G.GAME.current_round.vremade_monk or {}).suit or "Spades"
            local all_match = true

            for _, played in ipairs(context.full_hand or {}) do
                if played.base.suit ~= chosen then
                    all_match = false
                    break
                end
            end

            if all_match then
             
                return { xchips = card.ability.extra.xchips }
            end
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
}  

local function reset_vremade_monk()
    G.GAME.current_round.vremade_monk = G.GAME.current_round.vremade_monk or { suit = "Spades" }
    local monk_suits = {}
    for _, v in ipairs({ "Spades", "Hearts", "Clubs", "Diamonds" }) do
        if v ~= G.GAME.current_round.vremade_monk.suit then
            monk_suits[#monk_suits + 1] = v
        end
    end
    local new_suit = pseudorandom_element(monk_suits, "vremade_monk" .. G.GAME.round_resets.ante)
    G.GAME.current_round.vremade_monk.suit = new_suit
end

SMODS.current_mod.reset_game_globals = function()
    reset_vremade_monk()
end

SMODS.Joker({
    key = "mm_puppet",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 6, y = 1 },
    atlas = "wuwa_jokers",

     config = { extra = { Xmult = 2, size = 5 } },

       loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.size } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and #context.full_hand == card.ability.extra.size then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_photosyntheic",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 7, y = 1 },
    atlas = "wuwa_jokers",

    config = { extra = { hands = 2, discards = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.discards } }
    end,

    calculate = function(self, card, context)
  
        if context.setting_blind and G.GAME.blind and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()

                    ease_hands_played(card.ability.extra.hands)
                    ease_discard(card.ability.extra.discards)
                    return true
                end
            }))

            return {
                message = "Photosynthesis",
                colour = G.C.GREEN
            }
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_sighted",
    rarity = 3,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 8, y = 1 },
    atlas = "wuwa_jokers",

    config = { extra = { Xmult_gain = 0.1, Xmult = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, localize('Pair', 'poker_hands'), card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        local Xmult_gain = card.ability.extra.Xmult_gain or 0.1
        local total_Xmult = card.ability.extra.Xmult or 1

        if context.before and not context.blueprint and context.poker_hands then
            local hands = context.poker_hands

            if (hands['Pair'] and next(hands['Pair'])) or
               (hands['Two Pair'] and next(hands['Two Pair'])) or
               (hands['Three of a Kind'] and next(hands['Three of a Kind'])) or
               (hands['Four of a Kind'] and next(hands['Four of a Kind'])) or
               (hands['Five of a Kind'] and next(hands['Five of a Kind'])) or
               (hands['Full House'] and next(hands['Full House'])) or
               (hands['Flush House'] and next(hands['Flush House'])) or
               (hands['Flush Five'] and next(hands['Flush Five'])) then

                total_Xmult = total_Xmult + Xmult_gain
                card.ability.extra.Xmult = total_Xmult

                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end

        if context.joker_main then
            return {
                Xmult = total_Xmult
            }
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_gladiator",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 0, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if G.GAME.blind and G.GAME.blind.boss then
                local other = context.other_card
                if other and other:is_face() then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_sun",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 1, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { Xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local round = G.GAME.current_round
            if (round.hands_played == 0) or (round.hands_left == 0) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_moon",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 2, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { mult = 28 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local round = G.GAME.current_round
            if (round.hands_played == 0) or (round.hands_left == 0) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_knight",
    rarity = 3,
    blueprint_compat = true,
    cost = 11,
    pos = { x = 3, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { Xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

calculate = function(self, card, context)

    if context.setting_blind and context.blind then

        if not card.ability.extra.hands_lost then
            local hands_left = G.GAME.current_round.hands_left or 0
            local to_remove = math.floor(hands_left / 2)
            if to_remove > 0 then
                G.GAME.current_round.hands_left = hands_left - to_remove
            end
        end
    end

    if context.individual and context.cardarea == G.play then
        local id = context.other_card:get_id()
        if id == 14 then
            return { Xmult = card.ability.extra.Xmult }
        end
    end
end,
 set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rinascita",
            HEX("d99b0c"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_sinflame",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 4, y = 2 },
    atlas = "wuwa_jokers",

    config = {
        extra = {
            Xmult = 1.0,
            Xmult_gain = 0.25
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.Xmult }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local round = G.GAME.current_round
            if (round.hands_left == 0) then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = "Hellfire!",
                    colour = G.C.MULT,
                    xmult = card.ability.extra.Xmult
                }
            else
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Black Shores",
            HEX("3d2866"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_swordsman",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 5, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { Xchips = 1.0, Xchips_gain = 0.05 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xchips } }
    end,

    calculate = function(self, card, context)
    
        if context.joker_main then
            local face_count = 0

            for _, other in ipairs(context.scoring_hand or {}) do
                if other and other:is_face() then
                    face_count = face_count + 1
                end
            end

            if face_count > 0 then
                card.ability.extra.Xchips = card.ability.extra.Xchips + (face_count * card.ability.extra.Xchips_gain)
                return {
                    xchips = card.ability.extra.Xchips
                }
            end
        end
    end,
       set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Jinzhou",
            HEX("5B8296"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_cutter",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 6, y = 2 },
    atlas = "wuwa_jokers",

    config = { extra = { mult_gain = 0.4, mult = 0 } },

    loc_vars = function(self, info_queue, card)
        
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    calculate = function(self, card, context)
     
        if context and context.discard then
            local count = 0
            if context.discard_count and type(context.discard_count) == "number" then
                count = context.discard_count
            elseif context.discarded and type(context.discarded) == "table" then
                count = #context.discarded
            elseif context.full_hand and type(context.full_hand) == "table" then
                count = #context.full_hand
            end

            if count >= 5 then
                card.ability.extra.mult = (card.ability.extra.mult or 0) + (card.ability.extra.mult_gain or 0)
                return {
                    message = "Upgrade!",
                    colour = G.C.MULT,
                    delay = 0.4
                }
            end
        end

        if context and context.joker_main then
            return {
                mult = card.ability.extra.mult or 0
            }
        end
    end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_colors",
    rarity = 3,
    blueprint_compat = true,
    cost = 9,
    pos = { x = 7, y = 2 },
    atlas = "wuwa_jokers",

    calculate = function(self, card, context)
        if context.other_joker
            and context.other_joker ~= card
            and context.other_joker.edition then

            return {
                xmult = 1.5
            }
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_professor",
    rarity = 3,
    blueprint_compat = false,
    cost = 10,
    pos = { x = 8, y = 2 },
    atlas = "wuwa_jokers",

    calculate = function(self, card, context)

        if context.using_consumeable
        and context.consumeable
        and context.consumeable.ability.set == "Planet" then

            local c = context.consumeable

            if c.ability and c.ability.hand_type then

                G.E_MANAGER:add_event(Event({
                    func = function()
                        level_up_hand(c, c.ability.hand_type)
                        return true
                    end
                }))

                return {
                    message = "Upgrade!",
                    colour = G.C.BLUE
                }
            end
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_doctor",
    rarity = 3,
    blueprint_compat = false,
    cost = 8,
    pos = { x = 0, y = 3 },
    atlas = "wuwa_jokers",

    config = { extra = { triggered = false } },

     loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {
            key = 'e_polychrome',
            set = 'Edition',
            config = { extra = 1.5 }
        }
    end,


    calculate = function(self, card, context)

        if context.setting_blind then
            card.ability.extra.triggered = false
        end

        if context.before and not card.ability.extra.triggered then
            card.ability.extra.triggered = true

            if G.hand and #G.hand.cards > 0 then
                local lowest = nil

                for _, c in ipairs(G.hand.cards) do
                    if not lowest or c:get_id() < lowest:get_id() then
                        lowest = c
                    end
                end

                if lowest then
                    lowest:set_edition("e_polychrome", true)
                end
            end
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_soliskin",
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    pos = { x = 2, y = 3 },
    atlas = "wuwa_jokers",

    config = { extra = { first_hand = true } },

    calculate = function(self, card, context)

        if context.after and context.main_eval then
            card.ability.extra.first_hand = false
        end
        if context.setting_blind then
            card.ability.extra.first_hand = true
        end

        if context.individual and context.cardarea == G.play then
            if not card.ability.extra.first_hand then
                return {
                    mult = 5
                }
            end
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_ghost",
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    pos = { x = 3, y = 3 },
    atlas = "wuwa_jokers",

    config = { extra = { mode = 1 } },

    calculate = function(self, card, context)

        if context.end_of_round and context.main_eval then
            if card.ability.extra.mode == 1 then
                card.ability.extra.mode = 2
            else
                card.ability.extra.mode = 1
            end
        end

        if context.joker_main then
            if card.ability.extra.mode == 1 then
                return {
                    x_mult = 2
                }
            else
                return {
                    x_chips = 3
                }
            end
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_snow",
    rarity = 3,
    blueprint_compat = true,
    cost = 9,
    pos = { x = 4, y = 3 },
    atlas = "wuwa_jokers",

    config = {
        extra = {
            chance = 2
        }
    },

loc_vars = function(self, info_queue, card)

    info_queue[#info_queue + 1] = {
        key = "m_mm_glacio",
        set = "Enhanced",
        config = G.P_CENTERS["m_mm_glacio"].config
    }

    local glacio_count = 0

    if G.playing_cards then
        for _, v in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(v, "m_mm_glacio") then
                glacio_count = glacio_count + 1
            end
        end
    end

    local numerator =
        G.GAME and G.GAME.probabilities
        and G.GAME.probabilities.normal or 1

    local denominator = card.ability.extra.chance

    return {
        vars = {
            numerator,
            denominator,
            glacio_count * 5
        }
    }
end,

    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play then

            if not SMODS.has_enhancement(context.other_card, "m_mm_glacio") then

                if pseudorandom("scarlet_snow") <
                    (G.GAME.probabilities.normal / card.ability.extra.chance) then

                    context.other_card:set_ability("m_mm_glacio")

                    return {
                        message = "Frozen!",
                        colour = G.C.BLUE
                    }
                end
            end
        end

        if context.joker_main then

            local glacio_count = 0

            if G.playing_cards then
                for _, v in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(v, "m_mm_glacio") then
                        glacio_count = glacio_count + 1
                    end
                end
            end

            return {
                chips = glacio_count * 5
            }
        end
    end,
      set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})


SMODS.Joker({
    key = "mm_head",
    rarity = 3,
    blueprint_compat = false,
    cost = 10,
    pos = { x = 5, y = 3 },
    atlas = "wuwa_jokers",

    config = {
        extra = {
            rounds = 0
        }
    },

    loc_vars = function(self, info_queue, card)
 info_queue[#info_queue+1] = {
        key = "e_negative",
        set = "Edition",
        config = { extra = 1 }
    }
     info_queue[#info_queue + 1] = {
         key = "perishable", 
         set = "Other", 
         vars = { G.GAME.perishable_rounds, G.GAME.perishable_rounds } 
        }

        return {
            vars = {
                5 - (card.ability.extra.rounds % 5)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.rounds =
                card.ability.extra.rounds + 1

            if card.ability.extra.rounds % 5 == 0
            and G.GAME.mm_last_joker_obtained then

                local copied = create_card(
                    "Joker",
                    G.jokers,
                    nil,
                    nil,
                    nil,
                    nil,
                    G.GAME.mm_last_joker_obtained
                )

                if copied then
                    if copied.set_perishable then
                        copied:set_perishable(true)
                    else
                        copied.ability.perishable = true
                    end
                    copied:set_edition(
                    { negative = true },
                    true
                    )  

                    copied:add_to_deck()
                    G.jokers:emplace(copied)
                    

                    return {
                        message = "Copied!",
                        colour = G.C.PURPLE
                    }
                end
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

local card_add_to_deck_ref = Card.add_to_deck

function Card:add_to_deck(from_debuff)
    card_add_to_deck_ref(self, from_debuff)

    if self.ability
    and self.ability.set == "Joker"
    and self.config
    and self.config.center
    and self.config.center.key ~= "j_mm_head" then

        G.GAME.mm_last_joker_obtained =
            self.config.center.key
    end
end

SMODS.Joker({
    key = "mm_artificial",
    rarity = 2,
    blueprint_compat = false,
    cost = 8,
    pos = { x = 1, y = 3 },
    atlas = "wuwa_jokers",

    config = {
        extra = {
            rounds = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.max(0, 3 - card.ability.extra.rounds)
            }
        }
    end,

    calculate = function(self, card, context)

        if context.end_of_round
        and context.main_eval then

            card.ability.extra.rounds =
                card.ability.extra.rounds + 1

            if card.ability.extra.rounds >= 3 then

                local possible_tags = {
                    "tag_coupon",
                    "tag_uncommon",
                    "tag_rare",
                    "tag_negative",
                    "tag_holo",
                    "tag_polychrome",
                    "tag_handy",
                    "tag_garbage",
                    "tag_boss",
                    "tag_standard",
                    "tag_foil",
                    "tag_charm",
                    "tag_d_six",
                    "tag_top_up",
                    "tag_skip",
                    "tag_economy",
                    "tag_orbital",
                    "tag_meteor",
                    "tag_buffoon",
                    "tag_ethereal",
                    "tag_double",
                    "tag_juggle",
                    "tag_investment",
                    "tag_voucher"
                }

                for i = 1, 3 do

                    local tag_key = pseudorandom_element(
                        possible_tags,
                        pseudoseed("mm_artificial_tag_" .. i)
                    )

                    add_tag(Tag(tag_key))
                end

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = "Final Act!",
                    colour = G.C.PURPLE
                }
            end
        end
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(
            "Lahai-Roi",
            HEX("aed8e6"),
            G.C.WHITE,
            1.2
        )
    end
})

SMODS.Joker({
    key = "mm_chosen",
    rarity = 4,
    blueprint_compat = true,
    cost = 20,
    pos = { x = 6, y = 3 },
    atlas = "wuwa_jokers",

    
    config = { extra = { Xmult = 2 } },

     loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and next(SMODS.get_enhancements(context.other_card))then
            return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end,
        set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
            "Rover",
            HEX("ddbf61"),
            G.C.WHITE,
            1.2
        )
    end
})

