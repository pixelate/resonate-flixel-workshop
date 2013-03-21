package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	public class ProjectileScream extends Projectile
	{		
		[Embed(source="../../../../../assets/graphics/scream.png")] public static var ImgScream:Class;
		[Embed(source="../../../../../assets/graphics/screamUP.png")] public static var ImgScreamUP:Class;
		[Embed(source="../../../../../assets/graphics/screamDWN.png")] public static var ImgScreamDWN:Class;
		[Embed(source="../../../../../assets/graphics/screamR.png")] public static var ImgScreamR:Class;
	
		public function ProjectileScream(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);
		
      if(direction == LEFT)
      {
        velocity.x = -80;  			
  			loadGraphic(ImgScream);
			}
      else if(direction == RIGHT)
      {
        velocity.x = 80;
  			loadGraphic(ImgScreamR);
		  }
      else if(direction == UP)
      {
        velocity.y = -80;
  			loadGraphic(ImgScreamUP);
      }
      else if(direction == DOWN)
      {
        velocity.y = 80;        
  			loadGraphic(ImgScreamDWN);
    	}

		  init();
		}
	}
}