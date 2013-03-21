package io.resonate.asymmetric.projectiles
{
  import org.flixel.*;
  import io.resonate.asymmetric.engine.*;
  import io.resonate.asymmetric.characters.*;

  public class ProjectileDudeHammer extends Projectile
  {   
    private var _x: Number;
    private var _y: Number;
    private var _frameCounter: Number = 0;
    private var _charSize: Number = 16;
    private var _player: CharacterDude;
    private var hammerTime: Number = 3;
    private var hammerTimer: FlxTimer = new FlxTimer();
    private var frameCount: Number = 0;

    public function ProjectileDudeHammer(x: Number, y: Number, direction: uint, playerId: int, charSize: Number, player: CharacterDude ):void
    {
      super(x, y, direction, playerId);

      _x = x;
      _y = y;

      _player = player;
      _charSize = charSize;

      damage = 25;
      lifetimeInSeconds = 3;
      FlxG.bgColor = 0x77000000;
      makeGraphic( _charSize, _charSize, 0x33FF0000 );
      hammerTimer.start( hammerTime );

      _player.speed = Math.max( 50, _player._maxSpeed );

      init();
    }

    override public function update():void {

      if ( hammerTimer.finished ) return

      x = _player.x;
      y = _player.y;

      frameCount += .1;
      if ( frameCount % 2 < 1 ) {
        fill( 0xffff0000 )
      }
      else {
        fill( 0xffffffff )
      }

    }

    override public function kill():void {
      if ( alive ) {
        FlxG.bgColor = 0xff000000;
        hammerTimer.stop();
        _player.stopHammerTime();
        _player._size += 10;
        _player.x -= 7;
        FlxG.log(alive);
        _player.y -= 7;
        
        _player.makeGraphic( _player._size, _player._size, 0xffffffff);
        alive = false;
        exists = false;
      }

      super.kill();
    }

  }
}