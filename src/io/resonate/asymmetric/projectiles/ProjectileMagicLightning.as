package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileMagicLightning extends Projectile
	{		
		public function ProjectileMagicLightning(x: Number, y: Number, direction: uint, playerId: int):void
		{	
			super(x, y, direction, playerId);
				damage = 10;

				if(direction == LEFT)
				{
					velocity.x = -1000;  			
					makeGraphic(18, 4, 0xFF1ecdff);
				}
				else if(direction == RIGHT)
				{
					velocity.x = 1000;
					makeGraphic(18, 4, 0xFF1ecdff);
				}
				else if(direction == UP)
				{
					velocity.y = -1000;
					makeGraphic(4, 18, 0xFF1ecdff);
				}
				else if(direction == DOWN)
				{
					velocity.y = 1000;        
					makeGraphic(4, 18, 0xFF1ecdff);
				}

				init();
		}
	}
}