package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileBoomBoom extends Projectile
	{
	  public var speed: int = 200;	  
	  public var sizeTimer: FlxTimer = new FlxTimer();
	  
		public function ProjectileBoomBoom( x: Number, y: Number, direction: FlxPoint, playerId: int ):void
		{
			super( x, y, LEFT, playerId );

      damage = 5;
      lifetimeInSeconds = 0.35;

      velocity.x = direction.x * speed;
      velocity.y = direction.y * speed;
      
      sizeTimer.start( lifetimeInSeconds );
      
      init();
    }
    
    override public function update():void
    {
      width = height = 16 - 10 * sizeTimer.progress;
      
      var color: uint = 0xffff0000 - 0x11000000 * sizeTimer.progress;
      makeGraphic( Math.floor( width ), Math.floor( height ), color );
      
      super.update();
    }
	}
}