local screenW, screenH = guiGetScreenSize() -- Tamanho da tela do usuário

-----------------------------------------------------------

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end

function isCursorOverText(posX, posY, sizeX, sizeY) -- codigo para pegar aposição do mouse
    if ( not isCursorShowing( ) ) then
        return false
    end
    local cX, cY = getCursorPosition()
    local screenWidth, screenHeight = guiGetScreenSize()
    local cX, cY = (cX*screenWidth), (cY*screenHeight)
    return ( (cX >= posX and cX <= posX+(sizeX - posX)) and (cY >= posY and cY <= posY+(sizeY - posY)) )
end

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

-----------------------------------------------------------

local cr1, cg1, cb1 = 26, 26, 26 -- variaveis para as cores RBG no botão
local cr2, cg2, cb2 = 26, 26, 26
local cr3, cg3, cb3 = 26, 26, 26
local cr4, cg4, cb4 = 26, 26, 26

-----------------------------------------------------------

    local button1 = guiCreateButton(0.31, 0.16, 0.06, 0.06, "", true) -- elementos gui para fazer o som ao passar o mouse por cima
    guiSetAlpha(button1, 0)

    local button2 = guiCreateButton(0.38, 0.16, 0.06, 0.06, "", true)
    guiSetAlpha(button2, 0)

    local button3 = guiCreateButton(0.44, 0.16, 0.06, 0.06, "", true)
    guiSetAlpha(button3, 0)

    local button4 = guiCreateButton(0.51, 0.16, 0.06, 0.06, "", true)
    guiSetAlpha(button4, 0)

    local buttonInfo = guiCreateButton(0.22, 0.17, 0.04, 0.07, "", true)
    guiSetAlpha(buttonInfo, 0)

-----------------------------------------------------------

local painel = false -- variavel para definir que o painel não esta visivel

function PainelAjuda() -- Painel de ajuda em DX
    dxDrawRectangle(screenW * 0.2167, screenH * 0.1563, screenW * 0.5461, screenH * 0.6302, tocolor(177, 177, 177, 255), false)
    dxDrawRectangle(screenW * 0.2167, screenH * 0.1563, screenW * 0.5461, screenH * 0.0586, tocolor(26, 26, 26, 255), false)
    dxDrawImage(screenW * 0.2196, screenH * 0.1693, screenW * 0.0373, screenH * 0.0638, "img/info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawRectangle(screenW * 0.3097, screenH * 0.1563, screenW * 0.0593, screenH * 0.0586, tocolor(cr1, cg1, cb1, 255), false)
    dxDrawRectangle(screenW * 0.3763, screenH * 0.1563, screenW * 0.0593, screenH * 0.0586, tocolor(cr2, cg2, cb2, 255), false)
    dxDrawRectangle(screenW * 0.4429, screenH * 0.1563, screenW * 0.0593, screenH * 0.0586, tocolor(cr3, cg3, cb3, 255), false)
    dxDrawRectangle(screenW * 0.5095, screenH * 0.1563, screenW * 0.0593, screenH * 0.0586, tocolor(cr4, cg4, cb4, 255), false)
    dxDrawText("Duvidas", screenW * 0.3097, screenH * 0.1563, screenW * 0.3690, screenH * 0.2148, tocolor(255, 255, 255, 255), 1.30, "default", "center", "center", false, false, false, false, false)
    dxDrawText("Comandos", screenW * 0.3763, screenH * 0.1563, screenW * 0.4356, screenH * 0.2148, tocolor(255, 255, 255, 255), 1.30, "default", "center", "center", false, false, false, false, false)
    dxDrawText("Salários", screenW * 0.4429, screenH * 0.1563, screenW * 0.5022, screenH * 0.2148, tocolor(255, 255, 255, 255), 1.30, "default", "center", "center", false, false, false, false, false)
    dxDrawText("Veículos", screenW * 0.5095, screenH * 0.1563, screenW * 0.5688, screenH * 0.2148, tocolor(255, 255, 255, 255), 1.30, "default", "center", "center", false, false, false, false, false)

    if painel == true then -- se o mouse estiver no texto duvidas
        if isCursorOverText(screenW * 0.3097, screenH * 0.1563, screenW * 0.3690, screenH * 0.2148) then
            cr1, cg1, cb1 = 4, 111, 127
        else
            cr1, cg1, cb1 = 26, 26, 26
        end
    end

    if painel == true then -- se o mouse estiver no texto comandos
        if isCursorOverText(screenW * 0.3763, screenH * 0.1563, screenW * 0.4356, screenH * 0.214) then
            cr2, cg2, cb2 = 4, 111, 127
        else
            cr2, cg2, cb2 = 26, 26, 26
        end
    end

    if painel == true then -- se o mouse estiver no texto salários
        if isCursorOverText(screenW * 0.4429, screenH * 0.1563, screenW * 0.5022, screenH * 0.2148) then
            cr3, cg3, cb3 = 4, 111, 127
        else
            cr3, cg3, cb3 = 26, 26, 26
        end
    end

    if painel == true then -- se o mouse estiver no texto veículos
        if isCursorOverText(screenW * 0.5095, screenH * 0.1563, screenW * 0.5688, screenH * 0.2148) then
            cr4, cg4, cb4 = 4, 111, 127
        else
            cr4, cg4, cb4 = 26, 26, 26
        end
    end
end

-----------------------------------------------------------

bindKey("F6", "down", function()
    if painel == false then
        painel = true
        showCursor(true)
        addEventHandler("onClientRender", getRootElement(), PainelAjuda)
        local som = playSound("som/actionJoin.mp3", false)
    else
        painel = false
        showCursor(false)
        removeEventHandler("onClientRender", getRootElement(), PainelAjuda)
        local som = playSound("som/actionLeave.wav", false)

        if isEventHandlerAdded("onClientRender", getRootElement(), painelDuvida) then
            removeEventHandler("onClientRender", getRootElement(), painelDuvida)
        end

        if isEventHandlerAdded("onClientRender", getRootElement(), painelComandos) then
            removeEventHandler("onClientRender", getRootElement(), painelComandos)
        end

        if isEventHandlerAdded("onClientRender", getRootElement(), painelSalario) then
            removeEventHandler("onClientRender", getRootElement(), painelSalario)
        end

        if isEventHandlerAdded("onClientRender", getRootElement(), painelVeiculos) then
            removeEventHandler("onClientRender", getRootElement(), painelVeiculos)
        end

    end
end)

-----------------------------------------------------------

addEventHandler("onClientMouseEnter", button1, function()
    if painel == true then
        local som = playSound("som/option.wav", false)
        setSoundVolume(som, 0.2)
    end
end)

addEventHandler("onClientMouseEnter", button2, function()
    if painel == true then
        local som = playSound("som/option.wav", false)
        setSoundVolume(som, 0.2)
    end
end)

addEventHandler("onClientMouseEnter", button3, function()
    if painel == true then
        local som = playSound("som/option.wav", false)
        setSoundVolume(som, 0.2)
    end
end)

addEventHandler("onClientMouseEnter", button4, function()
    if painel == true then
        local som = playSound("som/option.wav", false)
        setSoundVolume(som, 0.2)
    end
end)

addEventHandler("onClientMouseEnter", buttonInfo, function()
    if painel == true then
        local som = playSound("som/option.wav", false)
        setSoundVolume(som, 0.2)
    end
end)

-----------------------------------------------------------

function painelDuvida ()
    dxDrawImage(screenW * 0.3324, screenH * 0.2201, screenW * 0.0132, screenH * 0.0260, "img/seta.png", 0, 0, 0, tocolor(78, 78, 78, 254), false)
    dxDrawRectangle(screenW * 0.2240, screenH * 0.2409, screenW * 0.5315, screenH * 0.5326, tocolor(66, 66, 66, 254), false)
    dxDrawImage(screenW * 0.2291, screenH * 0.2474, screenW * 0.5190, screenH * 0.5130, "img/duvida.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function painelComandos ()
    dxDrawImage(screenW * 0.3982, screenH * 0.2201, screenW * 0.0132, screenH * 0.0260, "img/seta.png", 0, 0, 0, tocolor(78, 78, 78, 254), false)
    dxDrawRectangle(screenW * 0.2240, screenH * 0.2409, screenW * 0.5315, screenH * 0.5326, tocolor(66, 66, 66, 254), false)
    dxDrawImage(screenW * 0.2291, screenH * 0.2474, screenW * 0.5190, screenH * 0.5130, "img/comandos.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function painelSalarios ()
    dxDrawImage(screenW * 0.4649, screenH * 0.2201, screenW * 0.0132, screenH * 0.0260, "img/seta.png", 0, 0, 0, tocolor(78, 78, 78, 254), false)
    dxDrawRectangle(screenW * 0.2240, screenH * 0.2409, screenW * 0.5315, screenH * 0.5326, tocolor(66, 66, 66, 254), false)
    dxDrawImage(screenW * 0.2291, screenH * 0.2474, screenW * 0.5190, screenH * 0.5130, "img/salarios.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function painelVeiculos ()
    dxDrawImage(screenW * 0.5300, screenH * 0.2201, screenW * 0.0132, screenH * 0.0260, "img/seta.png", 0, 0, 0, tocolor(78, 78, 78, 254), false)
    dxDrawRectangle(screenW * 0.2240, screenH * 0.2409, screenW * 0.5315, screenH * 0.5326, tocolor(66, 66, 66, 254), false)
    dxDrawImage(screenW * 0.2291, screenH * 0.2474, screenW * 0.5190, screenH * 0.5130, "img/veiculos.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

-----------------------------------------------------------

addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button == "left" and state == "down" then
        if painel == true then
            if isCursorOverText(screenW * 0.3097, screenH * 0.1563, screenW * 0.3690, screenH * 0.2148) then
                local som = playSound("som/actionJoin.mp3", false)
                setSoundVolume(som, 0.5)

                if isEventHandlerAdded("onClientRender", getRootElement(), painelComandos) then
                    removeEventHandler("onClientRender", getRootElement(), painelComandos)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelSalarios) then
                    removeEventHandler("onClientRender", getRootElement(), painelSalarios)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelVeiculos) then
                    removeEventHandler("onClientRender", getRootElement(), painelVeiculos)
                end

                if not isEventHandlerAdded("onClientRender", getRootElement(), painelDuvida) then
                    addEventHandler("onClientRender", getRootElement(), painelDuvida)
                end

            end
        end
    end
end)


addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button == "left" and state == "down" then
        if painel == true then
            if isCursorOverText(screenW * 0.3763, screenH * 0.1563, screenW * 0.4356, screenH * 0.2148) then
                local som = playSound("som/actionJoin.mp3", false)
                setSoundVolume(som, 0.5)

                if isEventHandlerAdded("onClientRender", getRootElement(), painelDuvida) then
                    removeEventHandler("onClientRender", getRootElement(), painelDuvida)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelSalarios) then
                    removeEventHandler("onClientRender", getRootElement(), painelSalarios)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelVeiculos) then
                    removeEventHandler("onClientRender", getRootElement(), painelVeiculos)
                end

                if not isEventHandlerAdded("onClientRender", getRootElement(), painelComandos) then
                    addEventHandler("onClientRender", getRootElement(), painelComandos)
                end

            end
        end
    end
end)


addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button == "left" and state == "down" then
        if painel == true then
            if isCursorOverText(screenW * 0.4429, screenH * 0.1563, screenW * 0.5022, screenH * 0.2148) then
                local som = playSound("som/actionJoin.mp3", false)
                setSoundVolume(som, 0.5)

                if isEventHandlerAdded("onClientRender", getRootElement(), painelDuvida) then
                    removeEventHandler("onClientRender", getRootElement(), painelDuvida)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelComandos) then
                    removeEventHandler("onClientRender", getRootElement(), painelComandos)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelVeiculos) then
                    removeEventHandler("onClientRender", getRootElement(), painelVeiculos)
                end

                if not isEventHandlerAdded("onClientRender", getRootElement(), painelSalarios) then
                    addEventHandler("onClientRender", getRootElement(), painelSalarios)
                end

            end
        end
    end
end)


addEventHandler("onClientClick", getRootElement(), function(button, state)
    if button == "left" and state == "down" then
        if painel == true then
            if isCursorOverText(screenW * 0.5095, screenH * 0.1563, screenW * 0.5688, screenH * 0.2148) then
                local som = playSound("som/actionJoin.mp3", false)
                setSoundVolume(som, 0.5)

                if isEventHandlerAdded("onClientRender", getRootElement(), painelDuvida) then
                    removeEventHandler("onClientRender", getRootElement(), painelDuvida)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelComandos) then
                    removeEventHandler("onClientRender", getRootElement(), painelComandos)
                end
        
                if isEventHandlerAdded("onClientRender", getRootElement(), painelSalarios) then
                    removeEventHandler("onClientRender", getRootElement(), painelSalarios)
                end

                if not isEventHandlerAdded("onClientRender", getRootElement(), painelVeiculos) then
                    addEventHandler("onClientRender", getRootElement(), painelVeiculos)
                end

            end
        end
    end
end)

-----------------------------------------------------------