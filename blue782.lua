#!/usr/bin/bash
-- version 1
-- dont use, very unstable, tbh nobody sees that but still

screen_click_1="select area" -- click to begin confirmation
screen_click_2="confirm selected area" -- click again and confirm location

print(screen_click_1)
io.read()
os.execute("xdotoo getmouselocation --shell > /tmp/pos1")
local x1, y1 = 0, 0
for line in io.lines("/tmp/pos1") do
    if line:match("^X=") then x1 = line:match("X=(%d+)") end
    if line:match("^Y=") then y1 = line:match("Y=(%d+)") end
end
print("selected area: x=" .. x1 .. " y=" .. y1)

print(screen_click_2)
io.read()
os.execute("xdotool getmouselocation --shell > /tmp/pos2")
local x2, y2 = 0, 0
for line in io.lines("tmp/pos2") do
    if line:match("^X") then x2 = line:match("X=(%d+)") end
    if line:match("^Y") then y2 = line:match("Y=(%d+)") end
end
print("confirmed area: x=" .. x2 .. " y=" .. y2)

print("ready to click on (" .. x2 ..", " .. y2 .. ")")
io.read()
os.execute("xdotool mousemove " .. x2 .. " " .. y2 .. " click 1")
print("click done at x=" .. x2 .. " y=" .. y2)