/*
 * The Bomber by Peter Holzkorn
 * resonate.io March 2013
 */
 
package io.resonate.asymmetric.characters {
	import org.flixel.*;

	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;

	public class CharacterBomberman extends Character {
		[Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow : Class;
		[Embed(source="../../../../../assets/sound/aah.mp3")] public static var SoundAah : Class;
		[Embed(source="../../../../../assets/graphics/bomber.png")] public static var BMGraphic : Class;
		
		public var status : int = 0;

		public function CharacterBomberman(playerId : int) {
			super(playerId);

			characterName = "THE BOMBER";
			cooldownInSeconds = 1.0;
			speed = 200;
			
			loadGraphic(BMGraphic, true, false, 32, 32);
			
			addAnimation("ok", [0]);
			addAnimation("bad", [1]);
			addAnimation("fubar", [2]);
			
			play("ok");

			//makeGraphic(16, 16, 0xffffaa00);
		}

		override public function update() : void {
			moveAtConstantSpeed(speed);
			
			if(status == 0 && this.health < 50) {
				play("bad");
				FlxG.play(SoundAah);
				status = 1;
				speed = 250;
				cooldownInSeconds = 0.8;
			}
			if( (status == 0 || status == 1) && this.health < 20) {
				play("fubar");
				FlxG.play(SoundAah);
				status = 2;
				speed = 400;
				cooldownInSeconds = 0.3;
			}
			
			
			super.update();
		}

		override protected function createProjectile() : Projectile {
			FlxG.play(SoundArrow);
			var projectile : Projectile = new ProjectileBomb(x + width / 2, y + height / 2, facing, 0); // player id 0 to enable friendly fire
			return projectile;
		}
	}
}