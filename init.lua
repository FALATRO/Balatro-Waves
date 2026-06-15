assert(SMODS.load_file("content/jokers.lua"))()
assert(SMODS.load_file("content/back.lua"))()
assert(SMODS.load_file("content/blinds.lua"))()
assert(SMODS.load_file("content/boosters.lua"))()
assert(SMODS.load_file("content/consumables.lua"))()
assert(SMODS.load_file("content/credits.lua"))()
assert(SMODS.load_file("content/challenges.lua"))()
assert(SMODS.load_file("content/editions.lua"))()
assert(SMODS.load_file("content/enhancements.lua"))()
assert(SMODS.load_file("content/tarots.lua"))()
assert(SMODS.load_file("content/vouchers.lua"))()
assert(SMODS.load_file("content/misc.lua"))()

SMODS.optional_features.retrigger_joker = true

BALATROWAVES = SMODS.current_mod

BALATROWAVES.draw_mode = "stretch"

BALATROWAVES.border_colour = { 0., 0., 0., 1. }

local file_data = assert(NFS.newFileData(BALATROWAVES.path.."background.png"),("Image should exist at background.png"))
local tempimagedata = assert(love.image.newImageData(file_data),("Image should be an image?"))

BALATROWAVES.bg_image = (assert(love.graphics.newImage(tempimagedata),("Image should be an image?")))
iw, ih = BALATROWAVES.bg_image:getDimensions() 

BALATROWAVES.draw_background = function ()

    if G.STAGE ~= G.STAGES.MAIN_MENU then
        return
    end

    love.graphics.push()

    love.graphics.setColor(BALATROWAVES.border_colour)
    love.graphics.rectangle("fill", 0, 0, 9999, 9999)

    local w, h = love.graphics.getDimensions()

    love.graphics.setColor(1, 1, 1, 1)

        if BALATROWAVES.draw_mode == "stretch" then
        love.graphics.scale(w / iw, h / ih)
        love.graphics.draw(BALATROWAVES.bg_image)
    end
    if BALATROWAVES.draw_mode == "scale_small" then
        local w_scale = w / iw
        local h_scale = h / ih

        local scale, target = w_scale, "w"
        if w_scale >= h_scale then
            scale, target = h_scale, "h"
        end

        local w_offset = target == "w" and 0 or (w - iw * h_scale) / 2
        local h_offset = target == "h" and 0 or (h - ih * w_scale) / 2

        love.graphics.scale(scale, scale)
        love.graphics.translate(w_offset, h_offset)
        love.graphics.draw(BALATROWAVES.bg_image)
    end
    if BALATROWAVES.draw_mode == "scale_large" then
        local w_scale = w / iw
        local h_scale = h / ih

        local scale, target = w_scale, "w"
        if w_scale <= h_scale then
            scale, target = h_scale, "h"
        end

        local w_offset = target == "w" and 0 or (w - iw * h_scale) / 2
        local h_offset = target == "h" and 0 or (h - ih * w_scale) / 2

        love.graphics.scale(scale, scale)
        love.graphics.translate(w_offset, h_offset)
        love.graphics.draw(BALATROWAVES.bg_image)
    end
    if BALATROWAVES.draw_mode == "center" then
        local w_offset, h_offset = (w - iw) / 2, (h - ih) / 2
        love.graphics.translate(w_offset, h_offset)
        love.graphics.draw(BALATROWAVES.bg_image)
    end

    love.graphics.pop()
end

