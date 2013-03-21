package io.resonate.asymmetric.engine
{
  import flash.display.StageDisplayState;
  import flash.utils.getDefinitionByName;
  import io.resonate.asymmetric.characters.*;
	import org.flixel.*;

	public class PlayState extends FlxState
	{		
		[Embed(source="../../../../../assets/sound/hurt.mp3")] public static var SoundHurt:Class;
		[Embed(source="../../../../../assets/sound/gameover.mp3")] public static var SoundGameOver:Class;

	  private var _projectiles: FlxGroup;
		private var _players: FlxGroup;
	  private var _playerEnergyDisplays: Array = new Array();
    private var _characterClasses: Array = [
      CharacterBirdman,
      CharacterScreamer,
      
      /*CharacterPera,
      CharacterYeti,
      CharacterDarkmage,
      CharacterPejs,
      CharacterBomberman,
      CharacterGhost*/
    ];
    
    private var _notifications: FlxText;
    private var _gameOver: Boolean;
    
		override public function create():void
		{
      FlxG.bgColor = 0xff222222;
      FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
      createPlayers();     
		  createProjectiles();
      createHud(); 
      _gameOver = false;
			super.create();
		}

		override public function update():void
		{			
			FlxG.collide(_players);			
			FlxG.overlap(_players, _projectiles, overlapPlayersProjectiles);
			updateHealth();
			
			if(_gameOver && FlxG.keys.R)
			{
			  FlxG.switchState(new PlayState());
			}
			
			super.update();
		}
		
		public function addProjectile(projectile: Projectile):void
		{
		  _projectiles.add(projectile);
		}
		
		private function overlapPlayersProjectiles(player: Character, projectile: Projectile):void
		{
		  // Make sure player can't hit him or herself and that projectile didn't already do damage
		  if(player.playerId != projectile.playerId && projectile.alive)
		  {
  		  player.hurt(projectile.damage);
  		  FlxG.play(SoundHurt);
  		  
  		  if(projectile.disappearsOnCollision)
  		  {
    		  projectile.kill();		      		    
  		  }
  		  else
  		  {
  		    projectile.alive = false;
  		  }
		  }
		}
		
		private function createProjectiles():void
		{
			_projectiles = new FlxGroup();
			add(_projectiles);
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
		
		private function createHud():void
		{
		  var hudPlayer1: FlxText = new FlxText(10, 10, 200, _players.members[0].characterName);
		  hudPlayer1.size = 16;
		  add(hudPlayer1);

		  var hudPlayer2: FlxText = new FlxText(FlxG.width - 210, 10, 200, _players.members[1].characterName);
		  hudPlayer2.alignment = "right";
		  hudPlayer2.size = 16;
		  add(hudPlayer2);

      var playerEnergyDisplay1: FlxSprite = new FlxSprite(12, 36);
      playerEnergyDisplay1.makeGraphic(200, 10);
      _playerEnergyDisplays.push(playerEnergyDisplay1);

      var playerEnergyDisplay2: FlxSprite = new FlxSprite(FlxG.width - 212, 36);
      playerEnergyDisplay2.makeGraphic(200, 10);
      _playerEnergyDisplays.push(playerEnergyDisplay2);

      _notifications = new FlxText(20, FlxG.height / 2, FlxG.width - 40, "");
		  _notifications.alignment = "center";
		  _notifications.size = 16;

      add(playerEnergyDisplay1);
      add(playerEnergyDisplay2);
      add(_notifications);
		}
		
		private function updateHealth():void
		{
		  for (var i:int = 0; i < 2; i++)
      {
        var health: int = _players.members[i].health;
        if(health <= 1) {
          gameOver();
          health = 1;
        }
        _playerEnergyDisplays[i].makeGraphic(200 * health/100, 10); 
      }
		}
		
		private function gameOver():void
		{
		  if(!_gameOver)
		  {
  		  _notifications.text = "GAME OVER\nPRESS R TO PLAY AGAIN";
  		  _gameOver = true;
  		  FlxG.play(SoundGameOver);		    
		  }
		}
	}
}