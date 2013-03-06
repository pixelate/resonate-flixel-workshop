package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterArcher extends Character
	{		
		public function CharacterArcher(playerId: int)
		{
      super(playerId);
      
      characterName = "THE ARCHER";
      cooldownInSeconds = 0.8;
      speed = 200;

		  makeGraphic(16, 16, 0xff00ff00);
		}

		override public function update():void
		{
		  moveAtConstantSpeed(speed);
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{		  
		  var projectile: Projectile = new ProjectileArrow(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		}		
  }
}