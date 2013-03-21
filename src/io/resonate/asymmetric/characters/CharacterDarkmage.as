/*
 * The Dark Mage by Ákos Csertán
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterDarkmage extends Character
	{		
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;
		[Embed(source="../../../../../assets/graphics/magesprite.png")] public static var imgmage:Class;

		private var lastActionWasLightning: Boolean = false;
		
		public function CharacterDarkmage(playerId: int)
		{
      super(playerId);
      
      characterName = "THE DARK MAGE";
      cooldownInSeconds = 0.8;
      speed = 200;

      loadGraphic (imgmage, true, false, 32, 32);
		  addAnimation("basicleft",[0]);
		  addAnimation("attackleft",[1]);
		  addAnimation("basicright",[2]);
		  addAnimation("attackright",[3]);
		}

		override public function update():void
		{
    	if (cooldownTimer.finished == true) {
    		if(facing == LEFT)
    		{
    			play("basicleft");
    		}
    		else if(facing == RIGHT)
    		{
    			play("basicright");
    		}
    	}  
    	moveAtConstantSpeed(speed);
		  super.update();
		}
    
		override protected function createProjectile():Projectile
		{		  
			if(lastActionWasLightning == true) {
				// trigger fire action
				FlxG.play(SoundArrow);
					lastActionWasLightning = false;
					play("attack");  
					var projectileFire: Projectile = new ProjectileMagicFire(x + width / 2, y + height / 2, facing, playerId);  
					return projectileFire;
				}
			else {
				// trigger lightning action
				FlxG.play(SoundArrow);
				lastActionWasLightning = true;
				if(facing == LEFT)
				{
					play("attackleft");
				}
				else if(facing == RIGHT)
				{
					play("attackright");
				} 
				var projectileLightning: Projectile = new ProjectileMagicLightning(x + width / 2, y + height / 2, facing, playerId);  
				return projectileLightning;
			}		
		}
				
  }
}