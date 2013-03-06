package io.resonate.asymmetric.engine
{
	import org.flixel.*;

	public class Projectile extends FlxSprite
	{		
	  public var damage: Number = 20;
	  public var playerId: int;
	  
		public function Projectile(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y);
      this.playerId = playerId;

      if(direction == LEFT)
      {
        velocity.x = -1000;  			
  			makeGraphic(8, 1, 0xFFFFFFFF);
      }
      else if(direction == RIGHT)
      {
        velocity.x = 1000;
  			makeGraphic(8, 1, 0xFFFFFFFF);
      }
      else if(direction == UP)
      {
        velocity.y = -1000;
  			makeGraphic(1, 8, 0xFFFFFFFF);
      }
      else if(direction == DOWN)
      {
        velocity.y = 1000;        
  			makeGraphic(1, 8, 0xFFFFFFFF);
      }
		}
	}
}