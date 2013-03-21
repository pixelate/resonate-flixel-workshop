/*
 * The Screamer by Nevena Dilparic
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterScreamer extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
		[Embed(source="../../../../../assets/graphics/screamer.png")] public static var ImageScreamer:Class;

		public function CharacterScreamer(playerId: int)
		{
      super(playerId);
      
      characterName = "THE SCREAMER";
      cooldownInSeconds = 0.1;
      speed = 200;

		  loadGraphic(ImageScreamer, true, false, 20, 30);
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
		  var projectile: Projectile = new ProjectileScream(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		}		
  }
}