/*
 * The Ghost by Konstantin Fick
 * resonate.io March 2013
 */
 
package io.resonate.asymmetric.characters {
	import org.flixel.*;

	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;

	public class CharacterGhost extends Character {
		[Embed(source="../../../../../assets/sound/hide.mp3")]
		public static var SoundHide : Class;
		[Embed(source="../../../../../assets/graphics/ghost.png")]
		public static var GhostGraphic : Class;
		public static var INVISIBLE : int = 1;
		public static var VISIBLE : int = 2;
		public static var ghostState : int;
		public static var cooldown2InSeconds : int = 6;
		public static var animationState : int = 0;
		public static var animationSteps : int = 0;
		public static var animationSpeed : int = 15;
		public static var player2Id : int;
		public static var orgPlayerId : int;

		public function CharacterGhost(playerId : int) {
			super(playerId);

			characterName = "THE GHOST";
			cooldownInSeconds = 6;
			speed = 150;

			ghostState = VISIBLE;

			loadGraphic(GhostGraphic, true, false, 32, 52);
			addAnimation("right0", [0]);
			addAnimation("right1", [1]);
			addAnimation("right2", [2]);
			addAnimation("left0", [3]);
			addAnimation("left1", [4]);
			addAnimation("left2", [5]);
			addAnimation("right3", [6]);
			addAnimation("right4", [7]);
			addAnimation("right5", [8]);
			addAnimation("left3", [9]);
			addAnimation("left4", [10]);
			addAnimation("left5", [11]);

			updateGraphics();

			if (playerId == 2)
				player2Id = 1;
			else
				player2Id = 2;

			orgPlayerId = playerId;
		}

		override public function update() : void {
			if (cooldownTimer.finished && ghostState == INVISIBLE)
				attack();

			updateGraphics();
			moveAtConstantSpeed(speed);

			super.update();
		}

		public function updateGraphics() : void {
			animationSteps++;
			if (animationSteps == animationSpeed) {
				animationSteps = 0;
				animationState = (animationState + 1) % 3;
				FlxG.log(animationState);
			}

			// if (oldGhostState == ghostState)
			// return;

			if (ghostState == VISIBLE) {
				if (facing == LEFT || facing == UP)
					play("left" + animationState);
				else
					play("right" + animationState);

				// makeGraphic(16, 16, 0xff00fff0);
			} else if (ghostState == INVISIBLE) {
				if (facing == LEFT || facing == UP)
					play("left" + (animationState + 3));
				else
					play("right" + (animationState + 3));

				// makeGraphic(16, 16, 0x0700fff0);
			}

			// oldGhostState = ghostState;
		}

		override protected function attack() : void {
			if (!cooldownTimer.finished)
				return;

			if (ghostState == VISIBLE) {
				hide();
				cooldownTimer.start(cooldownInSeconds);
			} else {
				show();
				var projectile : Projectile = createProjectile();
				var state : PlayState = PlayState(FlxG.state);
				state.addProjectile(projectile);
				cooldownTimer.start(cooldown2InSeconds);
			}
		}

		public function hide() : void {
			FlxG.play(SoundHide);

			ghostState = INVISIBLE;
			playerId = player2Id;
		}

		public function show() : void {
			ghostState = VISIBLE;
			playerId = orgPlayerId;
		}

		override protected function createProjectile() : Projectile {
			// FlxG.play(SoundExplode);
			var projectile : Projectile = new ProjectileCircle(x + width / 2, y + height / 2, facing, playerId);
			return projectile;
		}
	}
}