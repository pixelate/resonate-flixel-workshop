package io.resonate.asymmetric.projectiles
{
	import flash.geom.ColorTransform;
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileBomb extends Projectile {
		
		[Embed(source="../../../../../assets/sound/explode.mp3")] public static var SoundExplode : Class;
		
		private var elapsedLifetime : Number = 0.0;
		
		public function ProjectileBomb(x : Number, y : Number, direction : uint, playerId : int) : void {
			super(x, y, direction, playerId);

			damage = 0;
			
			this.lifetimeInSeconds = 2.0;
			this.disappearsOnCollision = false;
			
			makeGraphic(6, 6, 0xFFFFFFFF);
			init();
		}
		
		
		
		override protected function onLifetimeTimer(Timer : FlxTimer) : void 
		{
			kill();
			
			FlxG.play(SoundExplode);
			
			createBeams(LEFT);
			createBeams(RIGHT);
			createBeams(UP);
			createBeams(DOWN);
			
			
		}
		
		private function createBeams(dir : uint) : void {
			
			var posX : uint = x + width / 2;
			var posY : uint = y + height / 2;
			
			var projectile : Projectile = new ProjectileBeam(posX, posY, dir, playerId);

			var state : PlayState = PlayState(FlxG.state);
			state.addProjectile(projectile);
		}
		
		override public function update():void
		{
			elapsedLifetime += FlxG.elapsed;
			var red : uint = 255 * ((elapsedLifetime) / this.lifetimeInSeconds);
			
			this.color = 0xFF002200 + (red << 16);// ((this.lifetimeInSeconds - elapsedLifetime) / this.lifetimeInSeconds)*;
			
			
			super.update();
		}
	}
}