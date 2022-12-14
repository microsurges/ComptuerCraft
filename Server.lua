peripheral.find("modem")
rednet.broadcast("Identify")

id, message = rednet.receive()
print(message)

function send(id, message)
    rednet.send(id, message)
end

function identify()
    rednet.broadcast("Identify")
    local id, message = rednet.receive()
    print(id)
end
