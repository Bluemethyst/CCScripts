-- Find the monitor and player detector peripherals
local monitor = peripheral.find("monitor")
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

-- Function to print the list of online players
local function printOnlinePlayers()
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write("Online Players:")
    for i, player in ipairs(onlinePlayers) do
        monitor.setCursorPos(1, i + 2)
        monitor.write(player)
    end
end

-- Print the initial list of online players
printOnlinePlayers()

-- Main loop
while true do
    -- Get the current list of online players
    local currentPlayers = detector.getOnlinePlayers()

    -- Check for players who have joined or left
    for i, player in ipairs(currentPlayers) do
        if not table.contains(onlinePlayers, player) then
            monitor.write(player .. " has joined the game.")
            print(player .. " has joined the game\n")
        end
    end
    for i, player in ipairs(onlinePlayers) do
        if not table.contains(currentPlayers, player) then
            monitor.write(player .. " has left the game.")
            print(player .. " has left the game\n")
        end
    end

    -- Update the list of online players
    onlinePlayers = currentPlayers

    -- Print the updated list of online players
    printOnlinePlayers()

    -- Wait for a bit before checking again
    os.sleep(5)
end