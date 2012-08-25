/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file BaseState.as
 */
package nl.logiconline.ld24.states {
	import nl.logiconline.ld24.entities.EggPlayer;
	import nl.logiconline.ld24.entities.Player;
	import nl.logiconline.ld24.gui.Hud;
	import nl.logiconline.ld24.levels.BaseLevel;
	import nl.logiconline.ld24.utils.Globals;
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class BaseState extends FlxState {
		private var hud:Hud;
		public function BaseState() {
			super();
		}
		
		override public function create():void {
			super.create();
			Globals.currentLevel = new BaseLevel();
			this.add(Globals.currentLevel);			
			add(new FlxText(0,0,300, "Base State"));
			if(Globals.player == null) {
				Globals.player = new EggPlayer(Globals.currentLevel.getStartPoint());
			} else {
				Globals.player.setLocation(Globals.currentLevel.getStartPoint());
			}
			this.hud = new Hud();
			this.add(this.hud);
			add(Globals.player);
		}	
		
		override public function update():void {
			super.update();
			FlxG.collide(Globals.player, Globals.currentLevel);
			
			if(FlxG.keys.justPressed("SEVEN")) {
				Globals.intellect = Math.round(Math.random() * 10);
			}
			
		}
	}
}