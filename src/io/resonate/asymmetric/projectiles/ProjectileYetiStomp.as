package io.resonate.asymmetric.projectiles
{
	import io.resonate.asymmetric.engine.Projectile;

	public class ProjectileYetiStomp extends Projectile
	{
		[Embed(source="../../../../../assets/graphics/stompfx.png")] public static var StompFx : Class;
		
		public function ProjectileYetiStomp(x : Number, y : Number, direction : uint, playerId : int)
		{
			super(x, y, direction, playerId);
			//
			damage = 55;
			disappearsOnCollision = false;
			lifetimeInSeconds = 0.2;
			//
			if (direction == LEFT || direction == RIGHT) {
				loadGraphic(StompFx, true, false, 80, 80);
				scale.x = scale.y = .2;
			} else if (direction == UP || direction == DOWN) {
				loadGraphic(StompFx, true, false, 80, 80);
			}
			//
			init();
		}
		
		override public function update():void
		{
			if(scale.x<1){
				scale.y = scale.x +=.12;
			}
		}
	}
}
