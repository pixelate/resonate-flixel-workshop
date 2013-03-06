package io.resonate.asymmetric.characters
{
	import io.resonate.asymmetric.engine.Character;
	
	public class CharacterBlue extends Character
	{		
		public function CharacterBlue(playerId: int)
		{
      super(playerId);
		  makeGraphic(16, 16, 0xff0000ff);
		}

		override public function update():void
		{
		  super.update();
		}
  }
}