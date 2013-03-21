/*
 * The Gost by Konstantin Fick
 * resonate.io March 2013
 */

package io.resonate.asymmetric.projectiles {

	import org.flixel.*;

	import io.resonate.asymmetric.engine.*;

	public class ProjectileCircle extends Projectile {
		[Embed(source="../../../../../assets/graphics/circle.png")] public static var CircleGraphic:Class;
		public var graphicSize : Number = 128;		
		public var animationPos : int = 0;

				
		public function ProjectileCircle(x : Number, y : Number, direction : uint, playerId : int) : void {
			x -= graphicSize / 2;
			y -= graphicSize / 2;

			super(x, y, direction, playerId);

			damage = 60;
			disappearsOnCollision = false;
			lifetimeInSeconds = 0.25;
			
			loadGraphic(CircleGraphic, true, false, graphicSize, graphicSize);						
			addAnimation("step0", [0]);
			addAnimation("step1", [1]);
			addAnimation("step2", [2]);
			addAnimation("step3", [3]);
			addAnimation("step4", [4]);
			addAnimation("step5", [5]);
			addAnimation("step6", [6]);
			addAnimation("step7", [7]);
			
			play("step0");
					
			init();
		}
		
		override public function update() : void {
			animationPos++;
			
			var frame : int = (animationPos / (60.0 * lifetimeInSeconds)) * 8;			
			play("step" + frame);

		}
	}
}