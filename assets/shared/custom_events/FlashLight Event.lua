function onCreate()
	makeAnimatedLuaSprite('wait', 'wait', 0, 0)
	addAnimationByPrefix('wait', 'wait', 'wait', 24, false);
	setObjectCamera('wait', 'hud');
end




function onEvent(n,v1,v2)

	if n == 'FlashLight Event' then
		
		
		addLuaSprite('wait', true);
		doTweenAlpha('wait', 'wait', 0, 1, 'linear')
	end

end

function onTweenCompleted(tag)
	if tag == 'wait' then
		removeLuaSprite('wait', false)
		doTweenAlpha('wait2', 'wait', 1, 0.1, 'linear')
	end
end