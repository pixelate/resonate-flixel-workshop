package io.resonate.asymmetric.engine
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{		
		private var _players: FlxGroup;

		override public function create():void
		{
			_players = new FlxGroup();
			add(_players);

			var playerOne: Character = new Character(1);
			_players.add(playerOne);

			var playerTwo: Character = new Character(2);
			_players.add(playerTwo);

			super.create();
		}

		override public function update():void
		{			
			FlxG.collide(_players);
			super.update();
		}
	}
}