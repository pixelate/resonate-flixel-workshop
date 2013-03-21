/*
 * The Monster by Anita Vaivode
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterMonster extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
    [Embed(source="../../../../../assets/graphics/pope.png")] public static var MonsterGraph:Class;
		
    public function CharacterMonster(playerId: int)
		{
      super(playerId);
      
      characterName = "THE MONSTER";
      cooldownInSeconds = 0.8;
      speed = 200;
      
      loadGraphic(MonsterGraph, true, false, 30, 30);
      addAnimation("walkLeft", [3]);
      addAnimation("walkUp", [0]);
      addAnimation("walkDown", [2]);
      addAnimation("walkRight", [1]);
    }

		override public function update():void
		{
			if(facing == UP)
			{
        play("walkUp");
			}
			else if(facing == DOWN)
			{
			  play("walkDown");
			}
			else if(facing == LEFT)
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
		  var projectile: Projectile = new ProjectileWave(x + width / 2, y + height / 2, facing, playerId);
		  
		  return projectile;
		}		
  }
}