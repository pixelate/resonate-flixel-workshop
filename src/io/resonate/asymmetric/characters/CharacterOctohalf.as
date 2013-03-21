/*
 * Octahalf by Aleksandra Cvetanovski
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterOctohalf extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
    [Embed(source="../../../../../assets/graphics/Octohalf.png")] public static var OctohalfGraphic:Class;
		
		public function CharacterOctohalf(playerId: int)
		{
      super(playerId);
      
      characterName = "OCTOHALF";
      cooldownInSeconds = 0.5;
      speed = 170;

		  loadGraphic(OctohalfGraphic);
		}

		override public function update():void
		{
		  moveAtConstantSpeed(speed);
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{		  
		  FlxG.play(SoundArrow);
			 
			health -= 2;
			 
			var XX:Number = x;
			var YY:Number = y;
      
      if (facing == LEFT){
      	XX = x - width;
      }
      if (facing == RIGHT){
      	XX = x + width;
      }
      if (facing == UP){
      	YY = y - height;
      }
      if (facing == DOWN){
      	YY = y + height;
      }

		  var projectile: Projectile = new ProjectileFlameSword(XX, YY, facing, playerId);
		  return projectile;
		}		
  }
}