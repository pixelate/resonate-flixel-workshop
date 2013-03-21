package io.resonate.asymmetric.projectiles
{
	import io.resonate.asymmetric.engine.Projectile;
	
	public class ProjectileEarthquake extends Projectile
	{		

		[Embed(source="../../../../../assets/graphics/animation.png")] public static var SkinClass1:Class;
		[Embed(source="../../../../../assets/graphics/animationBlue.png")] public static var SkinClass2:Class;
		[Embed(source="../../../../../assets/graphics/animationYellow.png")] public static var SkinClass3:Class;
		[Embed(source="../../../../../assets/graphics/animationGreen.png")] public static var SkinClass4:Class;
		
		private var skins:Array = [SkinClass1,SkinClass2,SkinClass3,SkinClass4];
		
		public function ProjectileEarthquake(x: Number, y: Number, direction: uint, playerId: int):void
		{
			super(x, y, direction, playerId);
			
			damage = 10;
			
			lifetimeInSeconds = 4;
			
			var max:int = skins.length;
			var min:int = 0;
			var random:int = Math.floor(Math.random() * (max - min) + min)
			loadGraphic(skins[random], true, false, 36, 36);
			addAnimation("anim", [0,1,2,3], 60, true);
			play("anim");
			
			init();
		}
	}
}