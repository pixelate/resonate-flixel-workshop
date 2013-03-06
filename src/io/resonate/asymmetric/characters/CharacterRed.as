package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.Character;
	
	public class CharacterRed extends Character
	{		
		public function CharacterRed(playerId: int)
		{
      super(playerId);
		  makeGraphic(16, 16, 0xffff0000);
		}

		override public function update():void
		{
		  super.update();
		}
  }
}