/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Main.as
 */
package nl.logiconline.ld24 {
	import flash.display.Sprite;
	
	import nl.logiconline.ld24.states.BaseState;
	import nl.logiconline.ld24.states.MenuState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	public class Main extends FlxGame {
		public function Main() {
			super(320, 240, BaseState, 2, 60, 60, true);
			FlxG.debug = true;
		}
	}
}