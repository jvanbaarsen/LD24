/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file BaseState.as
 */
package nl.logiconline.ld24.states {
	import mx.resources.ResourceBundle;
	
	import nl.logiconline.ld24.entities.BlockyPlayer;
	import nl.logiconline.ld24.entities.BlubberPlayer;
	import nl.logiconline.ld24.entities.EggPlayer;
	import nl.logiconline.ld24.entities.Player;
	import nl.logiconline.ld24.entities.droppables.Poo;
	import nl.logiconline.ld24.entities.interactables.Books;
	import nl.logiconline.ld24.entities.interactables.Bottles;
	import nl.logiconline.ld24.entities.interactables.Computer;
	import nl.logiconline.ld24.entities.particles.FloatingText;
	import nl.logiconline.ld24.gui.Hud;
	import nl.logiconline.ld24.levels.BaseLevel;
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class BaseState extends FlxState {
		private var hud:Hud;
		private var books:Books;
		private var bottles:Bottles;
		private var computer:Computer;
		private var chair:FlxSprite;
		public function BaseState() {
			super();
		}
		
		override public function create():void {
			super.create();
			Globals.currentLevel = new BaseLevel();
			this.add(Globals.currentLevel);		
			
			if(Globals.player == null) {
				Globals.player = new EggPlayer(Globals.currentLevel.getStartPoint());
			} else {
				Globals.player.setLocation(Globals.currentLevel.getStartPoint());
			}
			this.hud = new Hud();
			this.add(this.hud);
			
			
			this.books = new Books(70, 134);
			add(this.books);
			
			this.bottles = new Bottles(70, 166);
			add(this.bottles);
			
			this.computer = new Computer(202, 131);
			add(this.computer);
			
			this.chair = new FlxSprite(206,151, Resources.chair);
			add(this.chair);
			
			add(Globals.player);		
		}	
		
		override public function update():void {
			super.update();
			FlxG.collide(Globals.player, Globals.currentLevel);			
			
			if(FlxG.keys.justPressed("SIX")) {
				//add some poo...
				add(new Poo(Globals.player.x, Globals.player.y + 23));
			}
			
			if(FlxG.keys.justPressed("SEVEN")) {
				remove(Globals.player);
				Globals.player = new EggPlayer(Globals.currentLevel.getStartPoint());
				add(Globals.player);
			}
			
			if(FlxG.keys.justPressed("EIGHT")) {
				remove(Globals.player);
				Globals.player = new BlubberPlayer(Globals.currentLevel.getStartPoint());
				add(Globals.player);
			}
			
			if(FlxG.keys.justPressed("NINE")) {
				remove(Globals.player);
				Globals.player = new BlockyPlayer(Globals.currentLevel.getStartPoint());
				add(Globals.player);
			}
			
		}
	}
}