package io.resonate.asymmetric.engine
{
	import org.flixel.*;
	
	public class Character extends FlxSprite
	{		
    protected var keyUp: String;
    protected var keyDown: String;
    protected var keyLeft: String;
    protected var keyRight: String;

		public function Character(playerId: int)
		{
		  makeGraphic(16, 16, 0xffffffff);
      
		  mapControls(playerId);
		  setToStartPosition(playerId);
		  
      health = 100;
		}

		override public function update():void
		{
		  moveAtConstantSpeed(200);
		  stayInsideLevel();
		  super.update();
		}
		
		private function moveAtConstantSpeed(speed: int):void
		{
      velocity.x = 0;
      velocity.y = 0;

			if(FlxG.keys[keyLeft])
			{
				velocity.x -= speed;
			}
			else if(FlxG.keys[keyRight])
			{
				velocity.x += speed;
			}

			if(FlxG.keys[keyUp])
			{
				velocity.y -= speed;				
			}
			else if(FlxG.keys[keyDown])
			{
				velocity.y += speed;
			}		  
		}
	
	  private function stayInsideLevel():void
	  {
	    if(x < 0) {
	      x = 0;
	    }
	    else if(x > FlxG.width - width)
	    {
	      x = FlxG.width - width;
	    }
	    
	    if(y < 0) {
	      y = 0;
	    }
	    else if(y > FlxG.height - height)
	    {
	      y = FlxG.height - height;
	    }
	  }
	
  	private function mapControls(playerId:int):void
  	{
  	  if(playerId == 1) {
  	    keyUp = "UP";
  	    keyDown = "DOWN";
  	    keyLeft = "LEFT";
  	    keyRight = "RIGHT";
  	  }
  	  else if(playerId == 2) {
  	    keyUp = "W";
  	    keyDown = "S";
  	    keyLeft = "A";
  	    keyRight = "D";	    
  	  }
  	}
  	
  	private function setToStartPosition(playerId:int):void
  	{
  	  if(playerId == 1) {
  	    x = FlxG.width / 4 - width / 2;
  	    y = FlxG.height / 2 - height / 2;
  	  }
  	  else if(playerId == 2) {
  	    x = FlxG.width - FlxG.width / 4 - width / 2;
  	    y = FlxG.height / 2 - height / 2;
  	  }
  	}
  }
}