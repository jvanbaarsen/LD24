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
	
	import org.flixel.FlxG;
	import org.flixel.FlxSave;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.system.debug.Log;
	
	public class MenuState extends FlxState {
		public function MenuState() {			
		}
		
		override public function create():void {
			super.create();
			
			var title:FlxText = new FlxText(0, 20, FlxG.width, Globals.gameName);
			title.setFormat(null, 16, 0xffffffff, "center");
			add(title);
			
			var subTitle:FlxText = new FlxText(0, FlxG.height - 40, FlxG.width, "Press SPACE to play");
			subTitle.alignment = "center";
			add(subTitle);					
			
		}
		
		override public function update():void {
			super.update();
			
			if(FlxG.keys.justPressed("SPACE")) {
				FlxG.switchState(new BaseState);
			}
		}
	}
}