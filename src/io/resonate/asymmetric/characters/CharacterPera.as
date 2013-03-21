/*
 * Pera by Mario Milojevic
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	import org.flixel.*;
	
	public class CharacterPera extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
		[Embed(source="../../../../../assets/graphics/Pera.png")] public static var PeraGraphic:Class;

		public function CharacterPera(playerId: int)
		{
      super(playerId);
      
      characterName = "THE PERA";
      cooldownInSeconds = 0.6;
      speed = 500;

      loadGraphic(PeraGraphic, true, false, 16, 16);
	    addAnimation("anim", [0,1,2,3], 11, true);
	    play("anim");
		}

		override public function update():void
		{
		  moveAtConstantSpeed(speed);
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{		  
      FlxG.play(SoundArrow);
	    speed = 50;
	    timer.start(5, 1, onTimer)
		  var projectile: Projectile = new ProjectileFire(x , y, facing, playerId);
		  return projectile;
		}		
		
		private var timer:FlxTimer = new FlxTimer();
		
		private function onTimer(Timer:FlxTimer):void{
			speed = 500
		}
  }
}