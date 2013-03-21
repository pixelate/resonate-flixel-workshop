package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileBoomEmpty extends Projectile
	{
		public function ProjectileBoomEmpty( x: Number, y: Number, direction: uint, playerId: int ):void
		{
			super( x, y, direction, playerId );
      damage = 0;

      kill();
    }
	}
}