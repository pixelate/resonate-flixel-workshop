/*
 * The Boom Man by Philip Wagner
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
	import org.flixel.*;
	import io.resonate.asymmetric.engine.*;
	import io.resonate.asymmetric.projectiles.*;
	
	public class CharacterBoomOperator extends Character
	{	
	  [Embed(source="../../../../../assets/sound/sword.mp3")] public static var SoundSword:Class;
	  [Embed(source="../../../../../assets/graphics/BoomOperator.png")] public static var GraphicBoomOperator:Class;

    public var isThrowing: Boolean = false;
    public var projectile: ProjectileBoomStick;
    
    protected var throwingCooldown: Number = 0.5;
    protected var throwingTimer: FlxTimer = new FlxTimer();
    
    protected var throwingDelay: Number = 0.4;
    protected var throwingDelayTimer: FlxTimer = new FlxTimer();
    
    protected var afterBoomDelay: Number = 0.8;
    protected var afterBoomDelayTimer: FlxTimer = new FlxTimer();

		public function CharacterBoomOperator( playerId: int )
		{
      super( playerId );
      
      characterName = "THE BOOM MAN";
      cooldownInSeconds = 0.2;
      speed = 150;
      
      loadGraphic( GraphicBoomOperator );
		  throwingTimer.start( throwingCooldown );
		  
		  afterBoomDelayTimer.finished = true;
		  
		  FlxG.watch( throwingTimer, "finished", "timer" );
		}

		override public function update():void
		{
		  if ( projectile != null && !projectile.alive ) {
		    isThrowing = false;
		  }
		  
		  if ( afterBoomDelayTimer.finished && cooldownTimer.finished ) {
		    moveAtConstantSpeed( speed );
		  }
		  else if ( !afterBoomDelayTimer.finished ) {
		    moveAtConstantSpeed( speed / 3 );
		  }
		  else {
		    moveAtConstantSpeed( 0 );
		  }
		  
		  super.update();
		}
		
		override protected function createProjectile():Projectile
		{
		  if ( !isThrowing && throwingTimer.finished ) {
		    FlxG.play( SoundSword );

  		  var posX: Number = x + width / 2;
  		  var posY: Number = y + height / 2;

        if ( facing == UP ) {
  		    posX += 3;
  		  }
  		  else if ( facing == DOWN ) {
  		    posX -= 6;
  		  }
  		  else if ( facing == LEFT ) {
  		    posY -= 6;
  		  }
  		  else if ( facing == RIGHT ) {
  		    posY += 3;
  		  }

        isThrowing = true;
  		  projectile = new ProjectileBoomStick( posX, posY, facing, playerId );
  		  
  		  throwingDelayTimer.start( throwingDelay );
  		  throwingTimer.start( throwingCooldown );
  		  
  		  return projectile;
		  }
		  else if ( throwingDelayTimer.finished ) {
		    if ( projectile.alive ) {
		      projectile.boom();
		      FlxG.play( SoundSword );
		      afterBoomDelayTimer.start( afterBoomDelay );
		    }
		    
		    FlxG.camera.shake( 0.02, 0.25, null );
		    
		    isThrowing = false;
		    throwingTimer.start( throwingCooldown );
		  }
		  
		  return new ProjectileBoomEmpty( 0, 0, facing, playerId );
		}
  }
}