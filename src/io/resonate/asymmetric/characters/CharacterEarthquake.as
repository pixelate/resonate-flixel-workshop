/*
 * Earthquaky by Milos Roglic
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.Character;
	import io.resonate.asymmetric.engine.Projectile;
	import io.resonate.asymmetric.projectiles.ProjectileEarthquake;
	
	import org.flixel.FlxG;
	import org.flixel.FlxTimer;
	public class CharacterEarthquake extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
		[Embed(source="../../../../../assets/graphics/earthy.png")] public static var SkinClass:Class;
		
		public function CharacterEarthquake(playerId: int)
		{
			super(playerId);
			characterName = "EARTHQUAKY";
			cooldownInSeconds = 0.1;
			speed = 200;
			loadGraphic(SkinClass, true, false, 16, 16);
			addAnimation("animNormal", [0]);
			addAnimation("animShaking", [1]);
		}
		
		override public function update():void
		{
			moveAtConstantSpeed(speed);
			super.update();
		}
		
		private var timer:FlxTimer = new FlxTimer();
		
		override protected function createProjectile():Projectile
		{		  
			FlxG.play(SoundArrow);
			var projectile: Projectile = new ProjectileEarthquake(x - width / 2, y - height / 2, facing, playerId);
			if (isReverse == false){
				play("animShaking");
				timer.start(3, 1, onTimer);
				isReverse = true;
				reverseControls();
			}
			
			return projectile;
		}	
		
		private function onTimer(Timer:FlxTimer):void{
			isReverse = false;
			play("animNormal");
			reverseControls();
		}
		
		private var isReverse:Boolean = false;
		
		private function reverseControls():void{
			var tempkeyUp:String = keyUp;
			var tempkeyDown:String = keyDown;
			var tempkeyLeft:String = keyLeft;
			var tempkeyRight:String = keyRight;
			
			keyUp = keyDown;
			keyDown = tempkeyUp;
			keyLeft = keyRight;
			keyRight = tempkeyLeft;			
		}
	}
}