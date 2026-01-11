function onCreate()
    makeLuaSprite('bartop')
    makeLuaSprite('barbottom')
    makeGraphic('bartop', 1, 1, '000000')
    makeGraphic('barbottom', 1, 1, '000000')
    setObjectCamera('bartop', 'camHUD')
    setObjectCamera('barbottom', 'camHUD')
    addLuaSprite('bartop', true)
    addLuaSprite('barbottom', true)
	setObjectOrder('bartop',getObjectOrder('healthBar')-1)
	setObjectOrder('barbottom',getObjectOrder('healthBar')-1)
end

function onEvent(n, v1, v2)
    if n == 'Cinematic' then
        offset = tonumber(v1)
        time = tonumber(v2)
	this = tonumber(v1)
        
        if this <= 0 then
            for i = 0,7 do
                noteTweenY('note' .. i, i, 50, time, 'backIn')
                doTweenY('bartop', 'bartop', 0 - getProperty('bartop.height'), time, 'backIn')
                doTweenY('barbottom', 'barbottom', screenHeight, time, 'backIn')
            end
        else
            for i = 0,7 do
                noteTweenY('note' .. i, i, offset + 10, time, 'bounceOut')
                doTweenY('bartop', 'bartop', -50, time, 'bounceOut')
                doTweenY('barbottom', 'barbottom', screenHeight - offset, time, 'bounceOut')

                setProperty('bartop.y', -50 - offset)
                setProperty('barbottom.y', screenHeight)

                setProperty('barbottom.x', -100)
                setProperty('bartop.x', -100)

                setGraphicSize('bartop', 2000, offset + 50)
                setGraphicSize('barbottom', 2000, offset + 50)

                updateHitbox('bartop')
                updateHitbox('barbottom')
            end
        end
    end
end