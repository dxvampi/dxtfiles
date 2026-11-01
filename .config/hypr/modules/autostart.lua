-------------------
---- AUTOSTART ----
-------------------

-- System / Hyprland
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gapplication-service")
    hl.exec_cmd("hyprctl setcursor Bibata-Original-Classic 24")
    hl.exec_cmd("swaybg -i ~/walls/dark-waves.jpg & disown")
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
end)

-- Apps
hl.on("hyprland.start", function ()
    hl.exec_cmd("vesktop --start-minimized")
    hl.exec_cmd("steam -silent")
end)