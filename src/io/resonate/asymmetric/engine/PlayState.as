package io.resonate.asymmetric.engine
{
  import flash.utils.getDefinitionByName;
  import io.resonate.asymmetric.characters.*;
	import org.flixel.*;

	public class PlayState extends FlxState
	{		
		private var _players: FlxGroup;
    private var _characterClasses: Array = [
      CharacterBlue,
      CharacterGreen,
      CharacterRed
    ];
    
		override public function create():void
		{
      createPlayers();      
			super.create();
		}

		override public function update():void
		{			
			FlxG.collide(_players);
			super.update();
		}
		
		private function createPlayers():void
		{
			_players = new FlxGroup();
			add(_players);

      var characterClasses: Array = selectCharacters();

      for(var i: int = 0; i < 2; i++)
      {
        var characterClass: Class = characterClasses[i];
  			var player: Character = new characterClass(i+1);
  			_players.add(player);
      }		  
		}
		
		private function selectCharacters():Array
		{
      if(_characterClasses.length < 2)
      {
        throw new Error("At least two character classes need to be defined in _characterClasses.");
      }
      
      var characterClasses: Array = _characterClasses.slice(); 
      var selectedCharacterClasses: Array = new Array(characterClasses.length);
      
      for (var i:int = 0; i < 2; i++)
      {
        var randomPos: int = int(Math.random() * characterClasses.length);
        selectedCharacterClasses[i] = characterClasses.splice(randomPos, 1)[0];
      }
      
      return selectedCharacterClasses;
		}
	}
}