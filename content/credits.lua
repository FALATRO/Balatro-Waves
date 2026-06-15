SMODS.Atlas({
    key = "credits",
    path = "credits.png",
    px = 71,
    py = 95,
})

SMODS.Joker({
    key = "FALATRO",
    atlas = "credits",
    pos = { x = 0, y = 0 },

    loc_txt = {
        name = "FALATRO",
        text = {
            "Creator of {C:attention}Balatro Waves{}",
            "{C:inactive}(Programmer/Larper)"
        }
    },

    unlocked = true,
    discovered = true,
    no_collection = true,
    no_mod_badges = true,

    set_badges = function(self, card, badges)
        local rarity_badge = table.remove(badges, #badges)

        if rarity_badge
        and rarity_badge.nodes
        and rarity_badge.nodes[1]
        and rarity_badge.nodes[1].nodes
        and rarity_badge.nodes[1].nodes[2]
        then
            rarity_badge.nodes[1].nodes[2].config.object:remove()
        end
    end,

    in_pool = function(self, args)
        return false
    end,
})

SMODS.Joker({
    key = "KaitlynTheStampede",
    atlas = "credits",
    pos = { x = 1, y = 0 },

    loc_txt = {
        name = "KaitlynTheStampede",
        text = {
            "Hey!!!:33 I draw and stuff. And uh, {C:attention}Balatro Waves?",
            "{C:inactive}(Artist/Non-larper)"
        }
    },

    unlocked = true,
    discovered = true,
    no_collection = true,
    no_mod_badges = true,

    set_badges = function(self, card, badges)
        local rarity_badge = table.remove(badges, #badges)

        if rarity_badge
        and rarity_badge.nodes
        and rarity_badge.nodes[1]
        and rarity_badge.nodes[1].nodes
        and rarity_badge.nodes[1].nodes[2]
        then
            rarity_badge.nodes[1].nodes[2].config.object:remove()
        end
    end,

    in_pool = function(self, args)
        return false
    end,
})

G.UIDEF.mm_credits_tab = function()

    local title_box = {
        n = G.UIT.R,
        config = {
            colour = G.C.L_BLACK,
            padding = 0.1,
            emboss = 0.05,
            align = "cm",
            minw = 4,
            minh = 1,
            r = 0.1
        },

        nodes = {
            {
                n = G.UIT.T,
                config = {
                    text = "BALATRO WAVES CREDITS",
                    colour = G.C.UI.TEXT_LIGHT,
                    scale = 1.2,
                    padding = 0.1
                }
            }
        }
    }

    local credits_area = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
        G.ROOM.T.h,
        G.CARD_W * 3.5,
        0.95 * G.CARD_H,

        {
            card_limit = 1,
            type = 'title',
            highlight_limit = 0,
            collection = true
        }
    )

    local credits_centers = {
        "j_mm_FALATRO", "j_mm_KaitlynTheStampede"
    }

    for _, _key in ipairs(credits_centers) do

        local center = G.P_CENTERS[_key]

        if center then

            local card = Card(
                credits_area.T.x + credits_area.T.w / 2,
                credits_area.T.y,
                G.CARD_W,
                G.CARD_H,
                nil,
                center
            )

            card.sticker = get_joker_win_sticker(center)

            credits_area:emplace(card)
        end
    end

    local credits_card_box = {
        n = G.UIT.O,

        config = {
            r = 0.1,
            minw = 4,
            minh = 1,
            align = "cm",
            padding = 0.2,
            instance_type = "CARDAREA",
            object = credits_area
        }
    }

    return {
        n = G.UIT.ROOT,

        config = {
            r = 0.1,
            align = "tm",
            padding = 0,
            colour = G.C.BLACK
        },

        nodes = {
            {
                n = G.UIT.R,

                config = {
                    r = 0.1,
                    minh = 4,
                    h = 3.25,
                    align = "tm",
                    padding = 0,
                    colour = G.C.BLACK
                },

                nodes = {
                    {
                        n = G.UIT.C,

                        config = {
                            r = 0.1,
                            maxh = 3.25,
                            align = "tm",
                            emboss = 0.1,
                            padding = 0.1,
                            colour = G.C.BLACK
                        },

                        nodes = {

                            title_box,

                            {
                                n = G.UIT.R,

                                config = {
                                    r = 0.1,
                                    minw = 8,
                                    minh = 3,
                                    align = "tm",
                                    padding = 0,
                                    colour = G.C.BLACK
                                },

                                nodes = {
                                    credits_card_box
                                }
                            }
                        }
                    }
                }
            }
        }
    }
end

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = "Credits",
            tab_definition_function = G.UIDEF.mm_credits_tab
        }
    }
end