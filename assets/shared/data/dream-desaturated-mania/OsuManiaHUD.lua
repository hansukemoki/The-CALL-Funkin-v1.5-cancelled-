local characters = true            -- Set to false if you don't want the characters on the screen
local bgDim = 0.5                  -- Background Dim, 0 - No Dim, 1 - Completely Dark
local boxAlpha = 0.8               -- How visible the box around the arrows is, 0 - Not Visible, 1 - Fully Visible
local moreInfo = true              -- Set to true if you want to display how many 'Sicks, Goods, Bads, etc.' you've hit

function onCreate()
	makeLuaSprite('dim', '', 0, 0)
	makeGraphic('dim', 1280, 720, '000000')
	setObjectCamera('dim', 'CamHUD')
	screenCenter('dim')
	addLuaSprite('dim', true)
	setProperty('dim.alpha', bgDim)



	makeLuaText('score', '0', 0, -10, 0)
	setTextSize('score', 40)
	setObjectCamera('score', 'CamHUD')
	setProperty('score.fieldWidth', screenWidth)
	addLuaText('score')

	makeLuaText('accuracy', '0', 0, -10, 50)
	setTextSize('accuracy', 30)
	setObjectCamera('accuracy', 'CamHUD')
	setProperty('accuracy.fieldWidth', screenWidth)
	addLuaText('accuracy')

	makeLuaText('very cool', '0', 0, 0, 0)
	setTextSize('very cool', 20)
	setObjectCamera('very cool', 'CamHUD')
	screenCenter('very cool', 'Y')
	setTextAlignment('very cool', 'left')
	addLuaText('very cool')
	if not moreInfo then
		setProperty('very cool.visible', false)
	end
end

function onCreatePost()
	-- MiddleScroll
	for i=0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'x', -500)
	end
    
    setPropertyFromGroup('strumLineNotes', 4, 'x', 412)
    setPropertyFromGroup('strumLineNotes', 5, 'x', 524)
    setPropertyFromGroup('strumLineNotes', 6, 'x', 636)
    setPropertyFromGroup('strumLineNotes', 7, 'x', 748)

    -- Removing the base game HUD
    setProperty('scoreTxt.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)

    -- Getting rid of BF, GF and the opponent
    if not characters then
    	setProperty('boyfriend.visible', false)
    	setProperty('gf.visible', false)
    	setProperty('dad.visible', false)
    end

    -- Removing the timebar for now
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)

    setProperty('healthBar.angle', 90)
    setProperty('healthBarBG.angle', 90)
    setProperty('healthBarBG.x', 610)
    setProperty('healthBar.x', 610)
    setProperty('healthBarBG.y', 400)
    setProperty('healthBar.y', 400)
    setHealthBarColors('000000', 'FFFFFF')
end

function onUpdate(elapsed)
	setTextString('score', getProperty('songScore'))
	setTextAlignment('score', 'right')
	setTextString('accuracy', math.floor((getProperty('ratingPercent') * 100) * 10) / 10 .. '%')
	setTextAlignment('accuracy', 'right')
	setTextString('very cool', 'Sick: ' .. getProperty('sicks') .. '\nGood: ' .. getProperty('goods') .. '\nBad: ' .. getProperty('bads') .. '\nShit: ' .. getProperty('shits') .. '\nMisses: ' .. getProperty('songMisses'))
end