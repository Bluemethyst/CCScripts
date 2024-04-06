local chatBox = peripheral.find("chatBox")
while true do
    local event, username, message, uuid, isHidden = os.pullEvent("chat")
    local operationPattern = "(%d+%.?%d*)([%+%-%*/])(%d+%.?%d*)"
    local operationStart, operationEnd, num1, operator, num2 = string.find(message, operationPattern)

    if operationStart and operationEnd then
        num1 = tonumber(num1)
        num2 = tonumber(num2)
        local result
        if operator == "+" then
            result = num1 + num2
        elseif operator == "-" then
            result = num1 - num2
        elseif operator == "*" then
            result = num1 * num2
        elseif operator == "/" then
            result = num1 / num2
        else
            print("Unknown operator: " .. operator)
            return
        end
        if tostring(result) == "inf" then
            chatBox.sendMessage("DIVISION BY ZERO AAAAAAA PANIC", "Blueculator", "<>")
            chatBox.sendToastToPlayer("DIVISION BY ZERO AAAAAAA PANIC", "Math result", username, "Blueculator", "<>",
                "&c&l")
        else
            chatBox.sendMessage(tostring(result), "Blueculator", "<>")
            chatBox.sendToastToPlayer(tostring(result), "Math result", username, "Blueculator", "<>", "&c&l")
        end
    end
end
