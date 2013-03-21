package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileLightning extends Projectile
	{	

		[Embed(source="../../../../../assets/graphics/lightning_down.png")] public static var BirdmanLightingDown:Class;
		[Embed(source="../../../../../assets/graphics/lightning_up.png")] public static var BirdmanLightingUp:Class;
		[Embed(source="../../../../../assets/graphics/lightning_left.png")] public static var BirdmanLightingLeft:Class;
		[Embed(source="../../../../../assets/graphics/lightning_right.png")] public static var BirdmanLightingRight:Class;

		public function ProjectileLightning(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);

      damage = 50;

      if(direction == LEFT)
      {
  	    loadGraphic(BirdmanLightingLeft);
	      velocity.x = -Math.cos(40*3.14/180)*100;	         
      }
      else if(direction == RIGHT)
      {
  	    loadGraphic(BirdmanLightingRight);
        velocity.x = Math.cos(40*3.14/180)*100;
      }
      else if(direction == UP)
      {
  	    loadGraphic(BirdmanLightingUp);
        velocity.y = -Math.sin(60*3.14/180)*200;
	    }
      else if(direction == DOWN)
      {
  	    loadGraphic(BirdmanLightingDown);
        velocity.y = Math.sin(20*3.14/180)*300;
      }

      init();
    }
	}
}