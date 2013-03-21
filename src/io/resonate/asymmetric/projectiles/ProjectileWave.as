package io.resonate.asymmetric.projectiles
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;

	public class ProjectileWave extends Projectile
	{	
	
	public var leftrightshot:Boolean = false;
  	public var updownshot:Boolean = false;

		public function ProjectileWave(x: Number, y: Number, direction: uint, playerId: int ):void
		{
			super(x, y, direction, playerId);

      damage = 10;

      if(direction == LEFT)
      {
	      leftrightshot = true;
	      updownshot = false;
		
        velocity.x = -150;  
  			makeGraphic(3, 12, 0xFFFFFFFF);
      }
      else if(direction == RIGHT)
      {
        leftrightshot = true;
		    updownshot = false;
		
        velocity.x = 150;
  			makeGraphic(3, 12, 0xFFFFFFFF);
      }
      else if(direction == UP)
      {
        leftrightshot = false;
	      updownshot = true;
		
        velocity.y = -150;
  			makeGraphic(12, 3, 0xFFFFFFFF);
      }
      else if(direction == DOWN)
      {
        leftrightshot = false;
        updownshot = true;

        velocity.y = 150;        
  			makeGraphic(12, 3, 0xFFFFFFFF);
      }

      init();
    }
    
    override public function update():void {
      if(leftrightshot) {
    	  scale.y += FlxG.elapsed * 8;
    	}
    
      if(updownshot) {
    	  scale.x += FlxG.elapsed * 8;
    	}
    }
	}
}