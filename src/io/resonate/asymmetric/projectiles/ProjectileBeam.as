package io.resonate.asymmetric.projectiles {
	import org.flixel.*;

	import io.resonate.asymmetric.engine.*;

	public class ProjectileBeam extends Projectile {
		
		public static var LENGTH : int = 480;
		public static var WIDTH : int = 6;
		
		private var elapsedLifetime : Number = 0.0;
		
		public function ProjectileBeam(x : Number, y : Number, direction : uint, playerId : int) : void {
			super(x, y, direction, playerId);
			
			
			
			this.disappearsOnCollision = false;

			damage = 30;
			this.lifetimeInSeconds = 1.0;
			this.facing = direction;

			var col : uint = 0xFFFFBB00;
			
			//var state : PlayState = PlayState(FlxG.state);
			var lenR : int = FlxG.width - x;
			var lenL : int = x;
			var lenU : int = y;
			var lenD : int = FlxG.height - y;
			
			if (direction == UP) {
				this.y -= lenU;
			} else if (direction == LEFT) {
				this.x -= lenL;
			}

			if (direction == LEFT) {
				makeGraphic(lenL, WIDTH, col);
			} else if (direction == RIGHT) {
				makeGraphic(lenR, WIDTH, col);
			} else if (direction == UP) {
				makeGraphic(WIDTH, lenU, col);
			} else if (direction == DOWN) {
				makeGraphic(WIDTH, lenD, col);
			}

			init();
		}
		
		override public function update():void
		{
			elapsedLifetime += FlxG.elapsed;
			this.alpha = Math.sqrt((this.lifetimeInSeconds - elapsedLifetime) / this.lifetimeInSeconds);
			
			super.update();
		}
	}
}