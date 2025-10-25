#!/usr/bin/bash
-- version 2
-- dont use, very unstable, tbh nobody sees that but still

function wait_for_click(label)
    print(label .. " (click anywhere...)")
    os.execute("xdotool click 1")
    os.execute("sleep 0.2")
    os.execute("xdotool getmouselocation --shell > /tmp/pos")
    local x, y = 0, 0
    for line in io.lines("/tmp/pos") do
        if line:match("^X=") then x = line:match("X=(%d+)") end
        if line:match("^Y=") then x = line:match("Y=(%d+)") end
    end
    print("captured position: x=" .. x .. " y" .. y)
    return x, Y
end

screen_click_1 = "select area"
screen_click_2 = "confirm selected area"

x1, y1 = wait_for_click(screen_click_1)
x2, y2 = wait_for_click(screen_click_2)

print("ready to click on(" .. x2 .. ", " .. y2 .. ")")
os.execute("xdotool mousemove " .. x2 .. " " .. y2 .. " click 1")
print("click done at x=" .. x2 .. " y=" .. y2)