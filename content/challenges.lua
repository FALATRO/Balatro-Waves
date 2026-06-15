SMODS.Challenge {
    key = 'Insanity',

    jokers = {
        { id = 'j_mm_two_sided', eternal = true },
    },

    rules = {
        custom = {
            { id = 'none' }
        },
        modifiers = {
            { id = "joker_slots", value = 2 },
            { id = "hands", value = 1 },
            { id = "discards", value = 5 },
        },
        deck = {
            type = "Challenge Deck"
        },
    },
        restrictions = {
           banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
           },

},
    button_colour = G.C.RED,
}


SMODS.Challenge {
    key = 'POF',

    jokers = {
        { id = 'j_mm_bard', eternal = true },
        { id = 'j_riff_raff', eternal = true }
    },

    rules = {
        custom = {
            {id = 'no_extra_hand_money'},
            {id = 'no_interest'},
            { id = 'no_shop_jokers' }
        },
        modifiers = {
            { id = "joker_slots", value = 4 },
            { id = "hands", value = 4 },
            { id = "discards", value = 3 },
        },
        deck = {
            type = "Challenge Deck"
        },
    },

    restrictions = {
        banned_cards = {
            { id = 'c_soul' },
            { id = 'c_wraith' },
            { id = 'c_judgement' },
            {id = 'v_seed_money'},
            {id = 'v_money_tree'},
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1',
            }},
            {id = 'p_mm_jinzhou_pack'},
            {id = 'p_mm_rinascita_pack'},
            {id = 'p_mm_septimont_pack'},
            {id = 'p_mm_blackshores_pack'},
            {id = 'p_mm_lahairoi_pack'},
        },

        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_holo' },
            { id = 'tag_polychrome' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_buffoon' },
        },
    },

    button_colour = G.C.RED,
}

SMODS.Challenge {
    key = 'SP',

    jokers = {
        { id = 'j_mm_crystalization', eternal = true },
    },

    rules = {
        custom = {
            {id = 'no_reward'},
            {id = 'no_extra_hand_money'},
            {id = 'no_interest'},
            {id = 'discard_cost', value = 1}
        },
        modifiers = {
            { id = "joker_slots", value = 3 },
            { id = "hands", value = 4 },
            { id = "discards", value = 3 },
            { id = "dollars", value = 120 },
        },
        deck = {
            type = "Challenge Deck"
        },
    },

    restrictions = {
        banned_cards = { 
            { id = 'c_immolate' },
            { id = 'c_hermit' },
            { id = 'c_temperance' },
            { id = 'c_devil' },  
            {id = 'v_seed_money'},
            {id = 'v_money_tree'},                  
            {id = 'j_golden'},
            {id = 'j_business'},
            {id = 'j_egg'},
            {id = 'j_riff_raff'},
            {id = 'j_ticket'},
            {id = 'j_faceless'}, 
            {id = 'j_todo_list'},                             
            {id = 'j_satellite'},
            {id = 'j_rocket'},
            {id = 'j_reserved_parking'},
            {id = 'j_to_the_moon'},
            {id = 'j_mail'},
            {id = 'j_gift'},
            {id = 'j_rough_gem'},
            {id = 'j_matador'},
            {id = 'j_midas_mask'},
            {id = 'j_rocket'},
        },
        vouchers = {
         },
        banned_tags = {  
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_holo' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
            { id = 'tag_investment' },
            { id = 'tag_garbage'},
            { id = 'tag_skip' },
            { id = 'tag_economy' },
            { id = 'tag_handy' },
        },
        banned_other = {
        },
    },
    button_colour = G.C.RED,
}

SMODS.Challenge {
    key = 'BC',

    jokers = {
        { id = 'j_mm_artist', eternal = true },
        { id = 'j_popcorn' },
    },
 
    rules = {
        custom = {
            { id = 'mm_BC' }
        },
        modifiers = {
            { id = "joker_slots", value = 5 },
            { id = "hands", value = 1 },
            { id = "discards", value = 0 },
        },
    },
        deck = {
            type = "Challenge Deck",
            no_suits = { 
                S = true,
                H = true,
                C = true,
                D = true
            },
        },


    button_colour = G.C.RED,
}

SMODS.Challenge {
    key = 'AC',

    jokers = {
        { id = 'j_mm_pero', eternal = true },
        { id = 'j_mm_lively', eternal = true },
        { id = 'j_mm_mysterious', eternal = true },
        { id = 'j_mm_sinflame', eternal = true },
        { id = 'j_mm_butterfly', eternal = true },
        { id = 'j_mm_leader', eternal = true },
        { id = 'j_mm_soliskin', eternal = true },
    },
 
    rules = {
        custom = {
            { id = 'no_shop_jokers' },
            { id = 'mm_AC' },
        },
        modifiers = {
            { id = "joker_slots", value = 7 },
            { id = "hands", value = 2 },
            { id = "discards", value = 3 },
        },
    },
        restrictions = {
        banned_cards = {
            { id = 'c_soul' },
            { id = 'c_wraith' },
            { id = 'c_judgement' },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1','p_buffoon_normal_2','p_buffoon_jumbo_1','p_buffoon_mega_1',
            }},
            {id = 'p_mm_jinzhou_pack'},
            {id = 'p_mm_rinascita_pack'},
            {id = 'p_mm_blackshores_pack'},
            {id = 'p_mm_lahairoi_pack'},
            { id = 'v_mm_minor' },
            { id = 'v_mm_major' },
        },

        banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_holo' },
            { id = 'tag_polychrome' },
            { id = 'tag_negative' },
            { id = 'tag_foil' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
        },
    },
        deck = {
            type = "Challenge Deck",
        },


    button_colour = G.C.RED,
}

local function starts_with(str, start)
    return string.sub(str, 1, #start) == start
end

SMODS.Challenge({
    key = 'TTF',
    rules = {
        custom = {
            { id = 'no_shop_jokers' },
            { id = "mm_TTF" },
        },
        modifiers = {
            { id = "joker_slots", value = 5 },
            { id = "hands", value = 4 },
            { id = "discards", value = 3 },

        },
    },

    deck = {
        type = "Challenge Deck",
    },
     vouchers = {
        { id = 'v_mm_minor' },
        { id = 'v_mm_major' },
    },

  restrictions = {
    banned_cards = function()
        local banned = {
            'c_soul',
            'c_wraith',
            'c_judgement',

            'p_buffoon_normal_1',
            'p_buffoon_normal_2',
            'p_buffoon_jumbo_1',
            'p_buffoon_mega_1',
        }

        for k, v in pairs(G.P_BLINDS) do
            if not starts_with(k, "bl_mm_") then
                banned[#banned + 1] = k
            end
        end

        return {{
            id = 'j_mm_placeholder',
            ids = banned
        }}
    end,

    banned_tags = {
        { id = 'tag_uncommon' },
        { id = 'tag_rare' },
        { id = 'tag_negative' },
        { id = 'tag_foil' },
        { id = 'tag_holo' },
        { id = 'tag_polychrome' },
        { id = 'tag_buffoon' },
        { id = 'tag_top_up' },
    },
},
    button_colour = G.C.RED,
})