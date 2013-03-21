package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileZvezdica extends Projectile
	{		
	
	[Embed(source="../../../../../assets/graphics/zvezdica02.png")] public static var imgzvezdica:Class;
	[Embed(source="../../../../../assets/graphics/PRASINA.png")] public static var imgprasina:Class;
		public function ProjectileZvezdica(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);
			
		

      damage = 14;

      if(direction == LEFT)
      {
        velocity.x = -1000;  			
  			loadGraphic(imgzvezdica);
      }
      else if(direction == RIGHT)
      {
        velocity.x = 1000;
  			loadGraphic(imgzvezdica);
      }
     else if(direction == UP)
      {
        velocity.y = 0;
  			loadGraphic(imgprasina);
      }
      else if(direction == DOWN)
      {
        velocity.y = 0;        
  			loadGraphic(imgprasina);
      }

      init();
    }
	}
}