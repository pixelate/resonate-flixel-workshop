package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	
	public class ProjectileFire extends Projectile
	{		
		
		[Embed(source="../../../../../assets/graphics/fire.png")] public static var PeraGraphic:Class;
		
		public function ProjectileFire(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);
			
			damage = 55;
			
			lifetimeInSeconds = 1;
			
			//makeGraphic(34, 34, 0xff00ff00);
			loadGraphic(PeraGraphic, true, false, 35, 35);
			addAnimation("anim", [3,2,1,0], 15, true);
			play("anim");
			
			init();

		}
		
	}
	

}