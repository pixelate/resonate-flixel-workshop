/*
 * Pejs by Zorana Luzanin
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterPejs extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
    [Embed(source="../../../../../assets/graphics/pejs06.png")] public static var imgpejs:Class;

		public function CharacterPejs(playerId: int)
		{
      super(playerId);
      
      characterName = "PEJS";
      cooldownInSeconds = 0.8;
      speed = 450;
	  
		  loadGraphic(imgpejs, true, false, 30, 30);
		  addAnimation("walkLeft",[0]);
		  addAnimation("walkRight",[1]);
		}
    
		override public function update():void
		{
			if(facing == LEFT)
			{
				play("walkLeft");
			}
			else if(facing == RIGHT)
			{
				play("walkRight");
			}
			
			moveAtConstantSpeed(speed);
		  super.update();
		}

		override protected function createProjectile():Projectile
		{		  
      FlxG.play(SoundArrow);
		  var projectile: Projectile = new ProjectileZvezdica(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		}		
  }
}