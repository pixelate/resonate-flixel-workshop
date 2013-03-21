/*
 * The Yeti by Alberto Ribotta
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.Character;
	import io.resonate.asymmetric.engine.PlayState;
	import io.resonate.asymmetric.engine.Projectile;
	import io.resonate.asymmetric.projectiles.ProjectileArrow;
	import io.resonate.asymmetric.projectiles.ProjectileYetiStomp;
	import org.flixel.FlxG;

	public class CharacterYeti extends Character
	{
		[Embed(source="../../../../../assets/sound/hurt.mp3")] public static var SoundStomp : Class;
		[Embed(source="../../../../../assets/graphics/charanim.png")] public static var YetiAnim : Class;
		
		private var _isAttacking : Boolean = false;
		private var _attackSpeed : int;
		private var _jumpProgress : Number;
		private var _lastDirection : uint;
		private var _jumpTime : Number = .5;
		private var _storedY : Number;
		
		public function CharacterYeti(playerId : int)
		{
			super(playerId);
			//
			characterName = "THE YETI";
			cooldownInSeconds = 0.8;
			speed = 170;
			_attackSpeed = 260;
			//
			loadGraphic(YetiAnim, true, false, 38, 52);
			addAnimation('walkRight', [0, 1], 6, true);
			addAnimation('walkLeft', [2, 3], 6, true);
			addAnimation('stopL', [0]);
			addAnimation('stopR', [3]);
			addAnimation('jumpL', [1]);
			addAnimation('jumpR', [2]);
		}

		override public function update() : void
		{
			if(_isAttacking){
				doTheYetiStomp();
			} else {
				if(facing == RIGHT){
					play('walkRight');
					_lastDirection = RIGHT;
				} else if(facing == LEFT){
					play('walkLeft');
					_lastDirection = LEFT;
				} else {
					//
				}
				moveAtConstantSpeed(speed);
				if(velocity.x==0 && velocity.y==0){
					if(_lastDirection==RIGHT){
						play('stopL');
					} else if(_lastDirection==LEFT){
						play('stopR');
					}
				}
			}
			super.update();
		}

		private function doTheYetiStomp() : void
		{
			if(_jumpProgress>_jumpTime){
				var projectile: Projectile = createProjectile();
				//
				var state: PlayState = PlayState(FlxG.state);
				state.addProjectile(projectile);
				//
				_isAttacking = false;
			} else {
				if(_jumpProgress<_jumpTime*.5){
					y -=3;
				} else {
					y +=3;
				}
				if(_lastDirection==RIGHT){
					play('jumpL');
					x +=3;
				} else if(_lastDirection==LEFT){
					play('jumpR');
					x -=3;
				}
			}
			_jumpProgress = _jumpProgress + FlxG.elapsed;
		}
		
		override protected function attack():void
		{
			if(!_isAttacking){
				cooldownTimer.start(cooldownInSeconds);
				_jumpProgress = 0;
				_storedY = y;
				_isAttacking = true;
			}
		}

		override protected function createProjectile():Projectile
		{
			FlxG.play(SoundStomp);
			var projectile : Projectile = new ProjectileYetiStomp(x + width / 2, y + height / 2, _lastDirection, playerId);
			if(_lastDirection==RIGHT){
				projectile.x -=10;
				projectile.y -=10;
			} else if(_lastDirection==LEFT){
				projectile.x -=74;
				projectile.y -=10;
			}
			return projectile;
		}
	
	
	}
}
