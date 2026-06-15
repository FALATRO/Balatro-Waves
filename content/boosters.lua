SMODS.Atlas({
    key = "wuwa_boosters",
    px = 71,
    py = 95,
    path = "boosters.png"
})

SMODS.Booster({
    key = "jinzhou_pack",
    atlas = "wuwa_boosters",
    loc_txt = {
        group_name = "Jinzhou Banner"
    },

    kind = "Weapon",

    pos = { x = 0, y = 0 },

    cost = 5,
    weight = 0.5,
get_weight = function(self)
    return self.weight * (G.GAME.mm_banner_rate or 1)
end,

    config = {
        extra = 1,
        choose = 1
    },

    create_card = function(self, card, i)

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity or 0

        local bw_jokers = {
            "j_mm_justice",
            "j_mm_logical",
            "j_mm_leader",
            "j_mm_artist",
            "j_mm_monk",
            "j_mm_puppet",
            "j_mm_photosyntheic",
            "j_mm_sighted",
            "j_mm_swordsman"
        }

        local got_bw_joker = false

        if G.GAME.mm_wave_pity >= 4 then
            got_bw_joker = true

        elseif pseudorandom("jinzhou_pack") < 0.25 then
            got_bw_joker = true
        end

        if got_bw_joker then
            G.GAME.mm_wave_pity = 0

            return create_card(
                "Joker",
                G.pack_cards,
                nil,
                nil,
                true,
                nil,
                pseudorandom_element(
                    bw_jokers,
                    pseudoseed("bw_pity")
                )
            )
        end

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity + 1

        return create_card(
            "ForgingTide",
            G.pack_cards,
            nil,
            nil,
            true,
            nil,
            nil,
            "jinzhou_pack"
        )
    end
})


SMODS.Booster({
    key = "rinascita_pack",
    atlas = "wuwa_boosters",
    loc_txt = {
        group_name = "Rinascita Banner"
    },

    kind = "Weapon",

    pos = { x = 1, y = 0 },

    cost = 5,
    weight = 0.5,
    get_weight = function(self)
    return self.weight * (G.GAME.mm_banner_rate or 1)
end,

    config = {
        extra = 1,
        choose = 1
    },

    create_card = function(self, card, i)

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity or 0

        local bw_jokers = {
            "j_mm_worker",
            "j_mm_crystalization",
            "j_mm_mysterious",
            "j_mm_pero",
            "j_mm_seafaring",
            "j_mm_acolyte",
            "j_mm_bard",
            "j_mm_knight",
            "j_mm_gladiator",
            "j_mm_sun",
            "j_mm_moon",
        }

        local got_bw_joker = false

        if G.GAME.mm_wave_pity >= 4 then
            got_bw_joker = true

        elseif pseudorandom("rinascita_pack") < 0.25 then
            got_bw_joker = true
        end

        if got_bw_joker then
            G.GAME.mm_wave_pity = 0

            return create_card(
                "Joker",
                G.pack_cards,
                nil,
                nil,
                true,
                nil,
                pseudorandom_element(
                    bw_jokers,
                    pseudoseed("bw_pity")
                )
            )
        end

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity + 1

        return create_card(
            "ForgingTide",
            G.pack_cards,
            nil,
            nil,
            true,
            nil,
            nil,
            "rinascita_pack"
        )
    end
})

SMODS.Booster({
    key = "blackshores_pack",
    atlas = "wuwa_boosters",
    loc_txt = {
        group_name = "Black Shores Banner"
    },

    kind = "Weapon",

    pos = { x = 2, y = 0 },

    cost = 5,
    weight = 0.5,
    get_weight = function(self)
    return self.weight * (G.GAME.mm_banner_rate or 1)
end,

    config = {
        extra = 1,
        choose = 1
    },

    create_card = function(self, card, i)

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity or 0

        local bw_jokers = {
            "j_mm_two_sided",
            "j_mm_butterfly",
            "j_mm_lively",
            "j_mm_sinflame",
        }

        local got_bw_joker = false

        if G.GAME.mm_wave_pity >= 4 then
            got_bw_joker = true

        elseif pseudorandom("blackshores_pack") < 0.25 then
            got_bw_joker = true
        end

        if got_bw_joker then
            G.GAME.mm_wave_pity = 0

            return create_card(
                "Joker",
                G.pack_cards,
                nil,
                nil,
                true,
                nil,
                pseudorandom_element(
                    bw_jokers,
                    pseudoseed("bw_pity")
                )
            )
        end

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity + 1

        return create_card(
            "ForgingTide",
            G.pack_cards,
            nil,
            nil,
            true,
            nil,
            nil,
            "blackshores_pack"
        )
    end
})

SMODS.Booster({
    key = "lahairoi_pack",
    atlas = "wuwa_boosters",
    loc_txt = {
        group_name = "Lahai-Roi Banner"
    },

    kind = "Weapon",

    pos = { x = 3, y = 0 },

    cost = 5,
    weight = 0.5,
    get_weight = function(self)
    return self.weight * (G.GAME.mm_banner_rate or 1)
end,

    config = {
        extra = 1,
        choose = 1
    },

    create_card = function(self, card, i)

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity or 0

        local bw_jokers = {
            "j_mm_cutter",
            "j_mm_colors",
            "j_mm_professor",
            "j_mm_doctor",
            "j_mm_soliskin",
            "j_mm_ghost",
            "j_mm_snow",
            "j_mm_head",
            "j_mm_artificial"
        }

        local got_bw_joker = false

        if G.GAME.mm_wave_pity >= 4 then
            got_bw_joker = true

        elseif pseudorandom("lahairoi_pack") < 0.25 then
            got_bw_joker = true
        end

        if got_bw_joker then
            G.GAME.mm_wave_pity = 0

            return create_card(
                "Joker",
                G.pack_cards,
                nil,
                nil,
                true,
                nil,
                pseudorandom_element(
                    bw_jokers,
                    pseudoseed("bw_pity")
                )
            )
        end

        G.GAME.mm_wave_pity = G.GAME.mm_wave_pity + 1

        return create_card(
            "ForgingTide",
            G.pack_cards,
            nil,
            nil,
            true,
            nil,
            nil,
            "lahairoi_pack"
        )
    end
})