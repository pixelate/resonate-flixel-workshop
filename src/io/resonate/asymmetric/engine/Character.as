package io.resonate.asymmetric.engine
{
	import org.flixel.*;
	
	public class Character extends FlxSprite
	{
	  public var playerId: int;
	  public var characterName: String = "CHARACTER";
	  public var speed: int = 200;
	  		
    protected var keyUp: String;
    protected var keyDown: String;
    protected var keyLeft: String;
    protected var keyRight: String;
    protected var keyAttack: String;

    // How many seconds the player has to wait before doing another attack
    protected var cooldownInSeconds: Number = 0.3;    
    protected var cooldownTimer: FlxTimer = new FlxTimer();

		public function Character(playerId: int)
		{		  
		  this.playerId = playerId;
		  
		  makeGraphic(16, 16, 0xffffffff);
      
		  mapControls(playerId);
		  setToStartPosition(playerId);
		  
      health = 100;

      FlxG.watch(this, "facing", "facing");

		  cooldownTimer.start(cooldownInSeconds);
		}

		override public function update():void
		{
		  if(FlxG.keys[keyAttack] && cooldownTimer.finished)
		  {
		    attack();
		  }
		  
		  updateFacing();
		  stayInsideLevel();
		  super.update();
		}
		
		protected function attack():void
		{
		  var projectile: Projectile = createProjectile();
		  
		  var state: PlayState = PlayState(FlxG.state);
		  state.addProjectile(projectile);
		  cooldownTimer.start(cooldownInSeconds);
		}
		
		protected function createProjectile():Projectile
		{		  
		  var projectile: Projectile = new Projectile(x + width / 2, y + height / 2, facing, playerId);
		  return projectile;
		}
		
		protected function moveAtConstantSpeed(speed: int):void
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
	
	  private function updateFacing():void
	  {
    	if(FlxG.keys[keyLeft])
			{
			  facing = LEFT;
			}
			else if(FlxG.keys[keyRight])
			{
			  facing = RIGHT;
			}
			else if(FlxG.keys[keyUp])
			{
			  facing = UP;
			}
			else if(FlxG.keys[keyDown])
			{
			  facing = DOWN;
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
  	    keyUp = "W";
  	    keyDown = "S";
  	    keyLeft = "A";
  	    keyRight = "D";	    
  	    keyAttack = "SHIFT";
  	  }
  	  else if(playerId == 2) {
  	    keyUp = "UP";
  	    keyDown = "DOWN";
  	    keyLeft = "LEFT";
  	    keyRight = "RIGHT";
  	    keyAttack = "SPACE";
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