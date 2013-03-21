package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileMagicFire extends Projectile
	{		
		public function ProjectileMagicFire(x: Number, y: Number, direction: uint, playerId: int):void
		{	
			x-=50;
			y-=50;
			super(x, y, direction, playerId);
				damage = 30;

				if(direction == LEFT)
				{
					velocity.x = -300;  			
					makeGraphic(100, 100, 0xFF8e133c);
				}
				else if(direction == RIGHT)
				{
					velocity.x = 300;
					makeGraphic(100, 100, 0xFF8e133c);
				}
				else if(direction == UP)
				{
					velocity.y = -300;
					makeGraphic(100, 100, 0xFF8e133c);
				}
				else if(direction == DOWN)
				{
					velocity.y = 300;        
					makeGraphic(100, 100, 0xFF8e133c);
				}

				init();
		}
	}
}