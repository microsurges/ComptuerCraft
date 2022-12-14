peripheral.find("modem")


print("Waiting for commands")
-- id is the computer that sent it
local id, message = rednet.receive()
if message == "Identify" then
    rednet.send(id, os.getComputerID())
end

function test()
    id, message = rednet.receive()
    term.clear()
    if message == "Hello" then
        print('Received "Hello"')
    else
        print("DNC")
    end
end