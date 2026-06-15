SMODS.Atlas({
    key = "wuwa_blinds",
    path = "blinds.png",
    px = 34,
    py = 34,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 1
})

SMODS.Blind({
    key = "goat",
    atlas = "wuwa_blinds",
    pos = { x = 0, y = 0 },
    dollars = 5,
    mult = 2,
    boss = {
        min = 1,
        max = 0,
    },
    boss_colour = HEX('8B0000'), 

    recalc_debuff = function(self, card, from_blind)
    
        if card:get_id() == 2 or card:get_id() == 3 or card:get_id() == 4 or card:get_id() == 5 or card:get_id() == 6 or card:get_id() == 7 then
            return true 
        end
        return false
    end
})

local MELODY_ODDS = 4

SMODS.Blind({
    key = "melody",
    atlas = "wuwa_blinds",
    pos = { x = 0, y = 1 },
    dollars = 5,
    mult = 2,
    boss = { min = 2, max = 0 },
    boss_colour = HEX("3C1361"),
    config = { extra = { odds = MELODY_ODDS } },
    vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), MELODY_ODDS },

    loc_vars = function(self)
        return { vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), self.config.extra.odds } }
    end,

    press_play = function(self)
        if G.hand and G.hand.highlighted then
            for _, card in ipairs(G.hand.highlighted) do
                if pseudorandom(pseudoseed("melody")) < G.GAME.probabilities.normal / self.config.extra.odds then
                    card:set_debuff(true)
                    if G.GAME and G.GAME.blind then
                        G.GAME.blind:wiggle()
                        G.GAME.blind.triggered = true
                    end
                end
            end
        end
    end,

    drawn_to_hand = function(self, cards)
        if not cards or type(cards) ~= "table" then return end
        for _, card in ipairs(cards) do
            if pseudorandom(pseudoseed("melody")) < G.GAME.probabilities.normal / self.config.extra.odds then
                card:set_debuff(true)
                if G.GAME and G.GAME.blind then
                    G.GAME.blind:wiggle()
                    G.GAME.blind.triggered = true
                end
            end
        end
    end,
})

SMODS.Blind({
    key = "play",
    atlas = "wuwa_blinds",
    pos = { x = 0, y = 2 },

    dollars = 5,
    mult = 1.5,

    boss = {
        min = 4,
        max = 0,
    },

    boss_colour = HEX('b38f00'),

    set_blind = function(self)

        self._chosen_joker = nil

        if not G.jokers or not G.jokers.cards then
            return
        end

        local max_rarity = -math.huge

        for _, j in ipairs(G.jokers.cards) do
            local rarity = j.config.center.rarity or 0

            if rarity > max_rarity then
                max_rarity = rarity
            end
        end

        local candidates = {}

        for _, j in ipairs(G.jokers.cards) do
            local rarity = j.config.center.rarity or 0

            if rarity == max_rarity then
                table.insert(candidates, j)
            end
        end

        if #candidates > 0 then
            self._chosen_joker =
                pseudorandom_element(
                    candidates,
                    pseudoseed("play_blind_" .. tostring(G.GAME.round_resets.ante))
                )
        end
    end,

    recalc_debuff = function(self, card, from_blind)

        if (card.area == G.jokers)
        and not G.GAME.blind.disabled then

            if self._chosen_joker
            and card == self._chosen_joker then
                return true
            end
        end

        return false
    end,

    disable = function(self)
        self._chosen_joker = nil
    end
})

local CORRUPTION_ODDS = 2

SMODS.Blind({
    key = "corruption",
    atlas = "wuwa_blinds",
    pos = { x = 0, y = 3 },

    dollars = 8,
    mult = 2,

    boss = { showdown = true },
    boss_colour = HEX('000000'),

    config = {
        extra = {
            mode = nil,
            odds = CORRUPTION_ODDS
        }
    },

in_pool = function(self)

    self.corruption_mode =
        pseudorandom("corruption_mode", 1, 3)

    return true
end,

loc_vars = function(self)

    local text = "???"

    if G.GAME
    and G.GAME.blind
    and G.GAME.blind.config
    and G.GAME.blind.config.blind
    and G.GAME.blind.config.blind.key == "bl_mm_corruption" then

        local mode = G.GAME.blind.config.blind.corruption_mode

        if mode == 1 then
            text = "Ranks 2-7 and enhanced cards are debuffed"

        elseif mode == 2 then
            text = "Cards played have a 1 in 2 chance to become debuffed"

        elseif mode == 3 then
            text = "Debuffs your highest and lowest rarity Joker"
        end
    end

    return { vars = { text } }
end,
collection_loc_vars = function(self) 
    return { vars = { "???" } } 
end,


set_blind = function(self)

    self._highest = nil
    self._lowest = nil

    if not self.corruption_mode then
        self.corruption_mode =
            pseudorandom("corruption_mode", 1, 3)
    end

    if self.corruption_mode == 3 then
        G.GAME.blind.chips =
            math.floor(G.GAME.blind.chips * 0.75)
    end
end,
   recalc_debuff = function(self, card, from_blind)

    if self.corruption_mode == 1 then

        local id = card:get_id()

        if id and id >= 2 and id <= 7 then
            return true
        end

       if next(SMODS.get_enhancements(card)) then
    return true
end
end

if self.corruption_mode == 3 then

            if (card.area == G.jokers)
            and not G.GAME.blind.disabled then

                local highest_rarity = -math.huge
                local lowest_rarity = math.huge

                for _, j in ipairs(G.jokers.cards) do
                    if j.config.center.rarity then

                        if j.config.center.rarity > highest_rarity then
                            highest_rarity = j.config.center.rarity
                        end

                        if j.config.center.rarity < lowest_rarity then
                            lowest_rarity = j.config.center.rarity
                        end
                    end
                end

                local highest_candidates = {}
                local lowest_candidates = {}

                for _, j in ipairs(G.jokers.cards) do

                    if j.config.center.rarity == highest_rarity then
                        table.insert(highest_candidates, j)
                    end

                    if j.config.center.rarity == lowest_rarity then
                        table.insert(lowest_candidates, j)
                    end
                end

                if not self._highest
                and #highest_candidates > 0 then

                    self._highest =
                        pseudorandom_element(
                            highest_candidates,
                            pseudoseed("corruption_high")
                        )
                end

                if not self._lowest
                and #lowest_candidates > 0 then

                    self._lowest =
                        pseudorandom_element(
                            lowest_candidates,
                            pseudoseed("corruption_low")
                        )
                end

                if card == self._highest
                or card == self._lowest then
                    return true
                end
            end
        end

        return false
    end,

    press_play = function(self)

        if self.corruption_mode ~= 2 then
            return
        end

        if G.hand and G.hand.highlighted then

            for _, card in ipairs(G.hand.highlighted) do

                if pseudorandom(pseudoseed("corruption")) <
                    G.GAME.probabilities.normal / self.config.extra.odds then

                    card:set_debuff(true)

                    if G.GAME and G.GAME.blind then
                        G.GAME.blind:wiggle()
                        G.GAME.blind.triggered = true
                    end
                end
            end
        end
    end,

    disable = function(self)
        self._highest = nil
        self._lowest = nil
    end
})