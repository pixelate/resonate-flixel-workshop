package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileSword extends Projectile
	{		
		public function ProjectileSword(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);

      damage = 50;
      disappearsOnCollision = false;
      lifetimeInSeconds = 0.5;

      if(direction == LEFT || direction == RIGHT)
      {
  			makeGraphic(24, 4, 0xFFCCCCCC);
      }
      else if(direction == UP || direction == DOWN)
      {
  			makeGraphic(4, 24, 0xFFCCCCCC);
      }
      
      init();
		}
	}
}