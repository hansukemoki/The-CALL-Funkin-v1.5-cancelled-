function onEvent(name, value1, value2)
    if name == 'HideCharacters' then
        -- Ẩn các nhân vật
        setProperty('boyfriend.visible', false)
        setProperty('dad.visible', false)
        setProperty('gf.visible', false)

        -- Đặt thời gian hiển thị lại
        runTimer('showCharacters', tonumber(value1))
    end
end

function onTimerCompleted(tag)
    if tag == 'showCharacters' then
        -- Hiển thị lại nhân vật
        setProperty('boyfriend.visible', true)
        setProperty('dad.visible', true)
        setProperty('gf.visible', true)
    end
end
