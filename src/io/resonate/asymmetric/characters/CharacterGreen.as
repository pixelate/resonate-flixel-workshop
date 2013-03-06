package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.Character;
	
	public class CharacterGreen extends Character
	{		
		public function CharacterGreen(playerId: int)
		{
      super(playerId);
		  makeGraphic(16, 16, 0xff00ff00);
		}

		override public function update():void
		{
		  super.update();
		}
  }
}