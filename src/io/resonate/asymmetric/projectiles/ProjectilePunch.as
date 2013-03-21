package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectilePunch extends Projectile
	{		
		public function ProjectilePunch(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);

      damage = 25;
      disappearsOnCollision = false;
      lifetimeInSeconds = 2;

      if(direction == LEFT || direction == RIGHT)
      {
  			makeGraphic(16, 4, 0xFFCCCCCC);
      }
      else if(direction == UP || direction == DOWN)
      {
  			makeGraphic(4, 16, 0xFFCCCCCC);
      }
      
      init();
		}
	}
}