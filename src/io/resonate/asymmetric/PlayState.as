package io.resonate.asymmetric
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{		
		private var _players: FlxGroup;

		override public function create():void
		{
			_players = new FlxGroup();
			add(_players);

			super.create();
		}

		override public function update():void
		{			
			super.update();
		}
	}
}