#!/usr/bin/bash
-- version 3
-- dont use, very unstable, tbh nobody sees that but still

function wait_for_click(label)
    print(label .. " (click anywhere...)")
    os.execute("xinput test-xi2 --root | grep --line-buffered 'ButtonPress' -m 1 > /tmp/click_detected")
    os.execute("sleep 0.2")
    os.execute("xdotool getmouselocation --shell > /tmp/pos")
    local x, y = 0, 0
    for line in io.lines("/tmp/pos") do
        if line:match("^X=") then x = line:match("X=(%d+)") end
        if line:match("^Y=") then Y = line:match("Y=(%d+)") end
    end
    print("captured position: x=" .. x .. " y=" .. y)
    return x, y
end

screen_click_1 = "select area"
screen_click_2 = "confirm selected area"

x1, y1 = wait_for_click(screen_click_1)
x2, y2 = wait_for_click(screen_click_2)

print("ready to click on(" .. x2 .. ", " .. y2 .. ")")
os.execute("xdotool mousemove " .. x2 .. " " .. y2 .. " click 1")
print("click done at x=" .. x2 .. " y=" .. y2)