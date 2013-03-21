/*
PLEASE ADD YOUR FULL NAME TO YOUR CHARACTER CLASS

e.g.
Boxer, by Andreas Zecher
*/

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterBoxer extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
		[Embed(source="../../../../../assets/graphics/boxer.png")] public static var BoxerGraphic:Class;

		public function CharacterBoxer(playerId: int)
		{
      super(playerId);
      
      characterName = "THE BOXER";
      cooldownInSeconds = 1;
      speed = 100;

      loadGraphic(BoxerGraphic, true, false, 16, 16);
  		addAnimation("walkLeft", [0]); 
  		addAnimation("walkRight", [1]);
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
		  var projectile: Projectile = new ProjectilePunch(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		}		
  }
}