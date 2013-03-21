package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileBoomStick extends Projectile
	{
	  public var speed: int = 400;
	  
		public function ProjectileBoomStick(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super( x, y, direction, playerId );

      damage = 0;

      if ( direction == LEFT ) {
        velocity.x = -speed;
      }
      else if ( direction == RIGHT ) {
        velocity.x = speed;
      }
      else if ( direction == UP ) {
        velocity.y = -speed;
      }
      else if ( direction == DOWN ) {
        velocity.y = speed;        
      }
      
      makeGraphic( 5, 4, 0xaaff0000 );

      init();
    }
    
    override public function update():void
    {
      if ( x < 0 || x > FlxG.width - width || y < 0 || y > FlxG.height - height ) {
	      kill();
	    }
    }
    
    public function boom():void
    {
      kill();
      
      var state: PlayState = PlayState( FlxG.state );
      
      var pi:Number = 6.2831853;
      var num:int = 8;
      
      for ( var i: int = 0; i < num; i++ ) {
        var angle:Number = pi / num * i;
        var dir:FlxPoint = new FlxPoint( Math.cos( angle ), Math.sin( angle ) );

        var projectile:ProjectileBoomBoom = new ProjectileBoomBoom( x, y, dir, playerId );
        state.addProjectile( projectile );
      }
    }
	}
}