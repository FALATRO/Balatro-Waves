SMODS.Atlas{
    key = "resonator",
    path = "resonatordeck.png",
    px = 71,
    py = 95,
}

SMODS.Back({
    key = "resonator",
    pos = { x = 0, y = 0 },
    atlas = "resonator",
    unlocked = true,

apply = function()
    G.E_MANAGER:add_event(Event({
        func = function()
            if G.consumeables then
                local pool = {}
                for k, v in pairs(G.P_CENTERS or {}) do
                    if type(k) == "string"
                       and k:sub(1,5) == "j_mm_"
                       and k ~= "j_mm_chosen"
                       and k ~= "j_mm_placeholder"
                       and k ~= "j_mm_FALATRO"
                       and k ~= "j_mm_KaitlynTheStampede" then
                        table.insert(pool, k)
                    end
                end
                local chosen_key
                if #pool > 0 then
                    if type(pseudorandom_element) == "function" then
                        chosen_key = pseudorandom_element(pool, pseudoseed("resonator"))
                    else
                        chosen_key = pool[math.random(#pool)]
                    end
                else
                    chosen_key = "j_mm_worker" 
                end

                SMODS.add_card({ key = chosen_key })
            end
            return true
        end
    }))
end,
})