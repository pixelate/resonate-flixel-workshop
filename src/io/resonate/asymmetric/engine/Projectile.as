package io.resonate.asymmetric.engine
{
	import org.flixel.*;

	public class Projectile extends FlxSprite
	{		
	  public var playerId: int;
	  public var damage: Number = 0;
	  public var disappearsOnCollision: Boolean = true;

    // How many seconds the projectile is alive
    protected var lifetimeInSeconds: Number = 5;
    
    private var _lifetimeTimer: FlxTimer = new FlxTimer();

	  
		public function Projectile(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y);
      this.playerId = playerId;
		}
		
		protected function init():void
		{
      _lifetimeTimer.start(lifetimeInSeconds, 1, onLifetimeTimer);		  
		}
		
		private function onLifetimeTimer(Timer:FlxTimer):void
		{
		  kill();
		}
	}
}