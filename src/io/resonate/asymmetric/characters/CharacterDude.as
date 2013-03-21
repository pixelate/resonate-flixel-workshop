/*
 * The Dude by Malte Buttjer
 * resonate.io March 2013
 */

package io.resonate.asymmetric.characters
{
  import org.flixel.*;
  import io.resonate.asymmetric.engine.*;
  import io.resonate.asymmetric.projectiles.*;
  
  public class CharacterDude extends Character
  {   
    [Embed(source="../../../../../assets/sound/arrow.mp3")] public static var SoundArrow:Class;

    private var _freaking: Boolean = false;
    public var _size: Number = 16;
    private var hammerText: FlxText = new FlxText(0, 450, 840, 'HAMMER TIME');
    private var hammerTime: Number = 3;
    public var hammerTimer: FlxTimer = new FlxTimer();
    private var frameCount: Number = 0;
    private var _first: Boolean = true;
    public var _maxSpeed: Number = 350;
    public var _ownCoolDown: FlxTimer = new FlxTimer();

    public function CharacterDude(playerId: int)
    {
      super(playerId);
      
      characterName = "THE DUDE";
      cooldownInSeconds = 5;
      speed = 30;

      makeGraphic(_size, _size, 0xffff0000);

      hammerText.size = 60;
      hammerText.alignment = 'center';
      hammerText.color = 0xffff0000;

    }

    public function stopHammerTime():void {
      hammerTimer.stop();
      
    }

    override public function update():void
    {
      var state: PlayState = PlayState(FlxG.state);

      if ( !hammerTimer.finished ) {
        frameCount += .1;
        if ( frameCount % 2 < 1 ) {
          hammerText.color = 0xffffffff;
        }
        else {
          hammerText.color = 0xffff0000;
        }
      }
      else {
        FlxG.camera.shake( .012, 0 );
        state.remove( hammerText );
        speed = 30;

        var color: uint;
        if ( _ownCoolDown.finished ) {
          color = 0xffff0000;
        }
        else {
          color = 0xffffffff - ( 0x00001111 * _ownCoolDown.progress );
        }
        fill( color );
      }

      moveAtConstantSpeed(speed);
      super.update();
    }

    override public function hurt( Damage:Number ):void {
      super.hurt( Damage );
    }

    override protected function createProjectile():Projectile
    {     
      FlxG.play(SoundArrow);
      hammerTimer.start( hammerTime );
      FlxG.camera.shake( .012, hammerTime );

      _maxSpeed -= 30;

      var state: PlayState = PlayState( FlxG.state );
      state.add( hammerText );
      _ownCoolDown.start( cooldownInSeconds );

      return new ProjectileDudeHammer(x + width / 2, y + height / 2, facing, playerId, _size, this );
    }
  }
}