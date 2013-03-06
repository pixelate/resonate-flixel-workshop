package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileArrow extends Projectile
	{		
		public function ProjectileArrow(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);

      damage = 10;

      if(direction == LEFT)
      {
        velocity.x = -1000;  			
  			makeGraphic(12, 2, 0xFFFFFFFF);
      }
      else if(direction == RIGHT)
      {
        velocity.x = 1000;
  			makeGraphic(12, 2, 0xFFFFFFFF);
      }
      else if(direction == UP)
      {
        velocity.y = -1000;
  			makeGraphic(2, 12, 0xFFFFFFFF);
      }
      else if(direction == DOWN)
      {
        velocity.y = 1000;        
  			makeGraphic(2, 12, 0xFFFFFFFF);
      }

      init();
    }
	}
}