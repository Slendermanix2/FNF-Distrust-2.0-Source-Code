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

class InstructionsState extends MusicBeatState
{
	public static var leftState:Bool = false;
	public static var boyfriend:Boyfriend;
	public static var boyfriendTwo:Boyfriend;
	public static var warning:FlxSprite;
	public static var warningBlue:FlxSprite;
	public static var instructionFood:FlxSprite;
	public static var hitbox:FlxSprite;
	public static var pgNum:Float = 1;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	var txt:FlxText;
	var txt3:FlxText;
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();

		warning = new FlxSprite(-500, -310).loadGraphic(Paths.image('warning'));
		warning.updateHitbox();
		warning.screenCenter();
		warning.alpha = 0;
		add(warning);

		warningBlue = new FlxSprite(-500, -310).loadGraphic(Paths.image('warningBlue'));
		warningBlue.updateHitbox();
		warningBlue.screenCenter();
		warningBlue.alpha = 0;
		add(warningBlue);

		instructionFood = new FlxSprite(850, 200).loadGraphic(Paths.image('instruction_Food'));
		instructionFood.scale.set(2,2);
		instructionFood.screenCenter();
		add(instructionFood);
		
		txt = new FlxText(0, 680, Std.int(FlxG.width * 0.4),
			pgNum + "/3",
			24);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200));
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(txt);

		txt3 = new FlxText(0, 680, Std.int(FlxG.width * 0.8),
			"When you see this warning sign, press SPACE to dodge it" , 24);
		
		txt3.setFormat("VCR OSD Mono", 24, FlxColor.fromRGB(200, 200, 200));
		txt3.screenCenter(X);
		txt3.borderColor = FlxColor.BLACK;
		txt3.borderSize = 3;
		txt3.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(txt3);

		var txt2:FlxText = new FlxText(1170, 680, Std.int(FlxG.width * 0.4),
			"Press enter to continue" , 24);
		
		txt2.setFormat("VCR OSD Mono", 24, FlxColor.fromRGB(200, 200, 200));
		txt2.borderColor = FlxColor.BLACK;
		txt2.borderSize = 3;
		txt2.borderStyle = FlxTextBorderStyle.OUTLINE;
		add(txt2);
		
	}

	override function update(elapsed:Float)
	{
		switch(pgNum)
		{
			case 1:
				warning.alpha = 1;
				warningBlue.alpha = 0;
				instructionFood.alpha = 0;
				txt3.text = "When you see this warning sign, press SPACE to dodge it";
			case 2:
				warningBlue.alpha = 1;
				warning.alpha = 0;
				txt3.text = "When you see this warning sign, DONT press SPACE to dodge it";
				instructionFood.alpha = 0;
			case 3:
				warningBlue.alpha = 0;
				warning.alpha = 0;
				txt3.text = "Use these items to health up but use them wisely";
				instructionFood.alpha = 1;
		}
		if(FlxG.keys.justPressed.RIGHT)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			pgNum += 1;
			if(pgNum > 3)
				pgNum = 1;
			txt.text = pgNum + "/3";
		}
		if(FlxG.keys.justPressed.LEFT)
		{
			FlxG.sound.play(Paths.sound('scrollMenu'));
			pgNum -= 1;
			if(pgNum < 1)
				pgNum = 3;
			txt.text = pgNum + "/3";
		}	
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
