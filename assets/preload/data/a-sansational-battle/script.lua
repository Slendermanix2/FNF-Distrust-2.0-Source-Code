function start(song) -- do nothing

end

function update(elapsed)

end

function beatHit(beat) -- do nothing

end

function stepHit(step) -- do nothing

    if(step == 40) then
        noteTweenX()
    end
end

function playerTwoTurn()
    tweenCameraZoom(1.3,(crochet * 4) / 1000)
end

function playerOneTurn()
    tweenCameraZoom(1,(crochet * 4) / 1000)
end