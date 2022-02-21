package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIInputText;
import Achievements;


class SITSState extends MusicBeatState
{

	var txt3:FlxText;
	

	override function create()
	{
		super.create();
	
		FlxG.mouse.visible = true;
		
		var txt:FlxText = new FlxText(0, 300, FlxG.width, "Slaughter In The Spotlight", 32);		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(txt);
		
		txt3 = new FlxText(0, 0, FlxG.width, "Press Enter To Begin", 32);		
		txt3.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt3.borderColor = FlxColor.BLACK;
		txt3.borderSize = 3;
		txt3.screenCenter();
		txt3.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(txt3);


		
	}

	override function update(elapsed:Float)
	{
        FlxG.camera.shake(0.001);
		FlxG.sound.music.stop();
		if(FlxG.keys.justPressed.ENTER)
		{
			PlayState.SONG = Song.loadFromJson("slaughter-in-the-spotlight-hard", "slaughter-in-the-spotlight");
			PlayState.isStoryMode = false;
			PlayState.storyWeek = 3;
			FlxG.switchState(new LoadingState(new PlayState(), false, 'shared'));
		}	 		
		super.update(elapsed);
	}
}
