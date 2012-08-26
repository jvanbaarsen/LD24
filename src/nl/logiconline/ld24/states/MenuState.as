/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file MenuState.as
 */
package nl.logiconline.ld24.states {
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.system.debug.Log;
	
	public class MenuState extends FlxState {		
		private var splash:FlxSprite;
		public function MenuState() {	
			this.splash = new FlxSprite(0,0, Resources.splash);
			add(this.splash);
		}
		
		override public function create():void {
			super.create();			
			
//			var copy:FlxText = new FlxText(0, FlxG.height - 30, FlxG.width, "By: J. van Baarsen for LudumDare 24");
//			copy.setFormat(null, 7);
//			add(copy);
//			
//			var subTitle:FlxText = new FlxText(0, FlxG.height - 20, FlxG.width, "Press SPACE to play");
//			subTitle.alignment = "center";
//			add(subTitle);					
//			
		}
		
		override public function update():void {
			super.update();
			
			if(FlxG.keys.justPressed("SPACE")) {
				FlxG.switchState(new BaseState);
			}
		}
	}
}