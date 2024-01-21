-- Find the chat box and player detector peripherals
local chatBox = peripheral.find("chatBox")
local detector = peripheral.find("playerDetector")

-- Store the list of online players
local onlinePlayers = detector.getOnlinePlayers()

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

-- Main loop
while true do
    -- Get the current list of online players
    local currentPlayers = detector.getOnlinePlayers()

    -- Check for players who have joined
    for i, player in ipairs(currentPlayers) do
        if not table.contains(onlinePlayers, player) then
            local pos = detector.getPlayerPos(player)
            chatBox.sendMessage("Welcome " .. player .. " to the server. They logged in at x: " .. pos.x .. ", z: " .. pos.z)
            print("Player " .. player .. " joined at x" .. pos.x .. ", z: " .. pos.z)
        end
    end

    -- Update the list of online players
    onlinePlayers = currentPlayers

    -- Wait for a bit before checking again
    os.sleep(1)
end