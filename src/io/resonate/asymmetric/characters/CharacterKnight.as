package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterKnight extends Character
	{		
		public function CharacterKnight(playerId: int)
		{
      super(playerId);
      
      characterName = "THE KNIGHT";
      cooldownInSeconds = 0.5;
      speed = 150;
      
		  makeGraphic(16, 16, 0xff0000ff);
		}

		override public function update():void
		{
		  // The Knight is slower when attacking, he can't move during the cooldown period
		  if(cooldownTimer.finished)
		  {
  		  moveAtConstantSpeed(speed);		    
		  }
		  else
		  {
		    moveAtConstantSpeed(0);		    
		  }
		  
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{		  
		  var posX: Number = x + width / 2;
		  var posY: Number = y + height / 2;
		  
		  if(facing == UP)
		  {
		    posY -= 24;
		  }
		  else if(facing == LEFT)
		  {
		    posX -= 24
		  }
		  
		  var projectile: Projectile = new ProjectileSword(posX, posY, facing, playerId);
		  return projectile;
		}
  }
}