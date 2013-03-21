package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileFlameSword extends Projectile
	{		
	[Embed(source="../../../../../assets/graphic/FlameSword.png")] public static var OctohalfGraphic:Class;
	[Embed(source="../../../../../assets/graphic/flame.png")] public static var FlameGraphic:Class;
	
	
	 private var timer: FlxTimer = new FlxTimer();
	 
	 
		public function ProjectileFlameSword(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);

      damage = 40;
      disappearsOnCollision = false;
      lifetimeInSeconds = 3;

		// sword
		  loadGraphic(OctohalfGraphic);
		  timer.start(0.5, 1, onTimer);
		  
		  
      init();
		}
		
		private function onTimer(Timer:FlxTimer):void
		{
		damage = 20;
		  // animation of flame
		  loadGraphic(FlameGraphic, true, false, 30, 16);
		  addAnimation("flameAnim", [0,1,2,3], 15, true);
		  play("flameAnim");
		}
	}
}