/*
 * Birdman by Jelena Perisic
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterBirdman extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
    [Embed(source="../../../../../assets/graphics/movements2.png")] public static var BirdmanGraphic:Class;

		public function CharacterBirdman(playerId: int)
		{
      super(playerId);
      
      characterName = "BIRDMAN";
      cooldownInSeconds = 0.5;
      speed = 100;
           
	    loadGraphic(BirdmanGraphic, true, false, 70, 50);
	    addAnimation("walkLeft", [0]);
      addAnimation("walkUp", [1]);
      addAnimation("walkDown", [2]);
      addAnimation("walkRight", [3]);
		}

		override public function update():void
		{
      if(facing == UP)
		  {
		    play("walkUp");
		  }
		  else if(facing == LEFT)
		  {
		    play("walkLeft");
		  }
		  else if(facing == RIGHT)
		  {
		    play("walkRight");
		  }
		  else if(facing == DOWN)
		  {
		    play("walkDown");
      }	
		
		  moveAtConstantSpeed(speed);
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{		  
      FlxG.play(SoundArrow);
		  var projectile: Projectile = new ProjectileLightning(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		  
		  var posX: Number = x + width / 2;
		  var posY: Number = y + height / 2;
    }		
  }
}