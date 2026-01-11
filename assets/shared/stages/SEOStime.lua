function onCreate()
	-- background shit
	makeLuaSprite('1', 'bg/1', 0, 0);
	--setScrollFactor('garStagebg', 0.7, 0.7);
	--setBlendMode('1', 'darken')
	
	makeLuaSprite('2', 'bg/2', -150, -50);
	--setScrollFactor('garStage', 0.9, 0.9);
	--scaleObject('garStage', 0.9, 0.9);
	setBlendMode('2', 'add')

	makeLuaSprite('2alt', 'bg/2-alt', -150, -50);
	--setScrollFactor('garStage', 0.9, 0.9);
	--scaleObject('garStage', 0.9, 0.9);
	--setBlendMode('2alt', 'add')

	makeLuaSprite('3', 'bg/3', 0, 0);

	makeLuaSprite('4', 'bg/4', 0, 0);
	setScrollFactor('4', 0.8, 0.8);

	makeLuaSprite('4alt', 'bg/4-alt', 0, 0);
	setScrollFactor('4alt', 0.8, 0.8);

	makeLuaSprite('5', 'bg/5', -200, -100);
	setScrollFactor('5', 0.4, 0.4);

	makeLuaSprite('55', 'bg/5', -100, -100);
	scaleObject('55', 0.7, 0.7);
	setScrollFactor('55', 0.3, 0.3);
	setProperty('55.flipX', true)

	makeLuaSprite('6', 'bg/6', -300, -200);
	setScrollFactor('6', 0.2, 0.2);

	makeLuaSprite('bacl', 'bacl', 0, 0)
	setGraphicSize('bacl',1280,720)
	setObjectCamera('bacl','other')

	addLuaSprite('6', false);
	addLuaSprite('55', false);
	addLuaSprite('5', false);
	addLuaSprite('4', false);
	addLuaSprite('3', false);
	addLuaSprite('2', true);
	addLuaSprite('1', true);

	setObjectOrder('1', 9)
	--setObjectOrder('bacl', 9)
	setObjectOrder('2', 9) 
	--setObjectOrder('2alt', 9)
	setObjectOrder('3', 5)
	setObjectOrder('4', 4)
	setObjectOrder('4alt', 4)
	setObjectOrder('5', 3)
	setObjectOrder('55', 2)
	setObjectOrder('6', 1)


end



function turn(switch) --on or off
	if switch == 'off' then
		addLuaSprite('4alt', false)
		addLuaSprite('2alt', true)
		removeLuaSprite('2', false)
		removeLuaSprite('4', false)
		setObjectOrder('4alt', 5)
		addLuaSprite('bacl', true);
		setStrumAlpha(0.55)
	else
		removeLuaSprite('bacl', false)
		removeLuaSprite('2alt', false)
		addLuaSprite('2', true)
		addLuaSprite('4', false)
		removeLuaSprite('4alt', false)
		setObjectOrder('4', 5)
		setStrumAlpha(1)
	end
end

function onEvent(n,v1,v2)
	if n == 'Turn Lights' then
		if v1 == 'off' then
			turn('off')
		end
		if v1 == 'on' then
			turn('on')
		end
	end
end




--i just fuckin realized  that i could have done this with the strum visibilty i wanna cut my balls no w
--(i literally ended all the charts with the events 1 hour ago)
function setStrumAlpha(alpha)
	--alpha = tonumber(v1)


	setPropertyFromGroup('playerStrums', 0,'alpha' , alpha)
	setPropertyFromGroup('playerStrums', 1,'alpha' , alpha)
	setPropertyFromGroup('playerStrums', 2,'alpha' , alpha)
	setPropertyFromGroup('playerStrums', 3,'alpha' , alpha)

	setPropertyFromGroup('opponentStrums', 0,'alpha' , alpha)
	setPropertyFromGroup('opponentStrums', 1,'alpha' , alpha)
	setPropertyFromGroup('opponentStrums', 2,'alpha' , alpha)
	setPropertyFromGroup('opponentStrums', 3,'alpha' , alpha)
end
