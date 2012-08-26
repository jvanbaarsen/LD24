/**
 * @project LD24
 * @package nl.logiconline.ld24.states
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 26, 2012
 * @file EndState.as
 */
package nl.logiconline.ld24.states {
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.*;	
	
	public class EndState extends FlxState {
		public function EndState() {
			super();			
			add(new FlxSprite(0,0, Resources.theend));
		}
		
		override public function update():void {
			super.update();
			if(FlxG.keys.justPressed("SPACE")) {
				Globals.energy = 10;
				Globals.fun = 10;
				Globals.hunger = 10;
				Globals.hygiene = 10;
				Globals.intellect = 0;
				Globals.player = null;
				FlxG.switchState(new BaseState());
			}
		}
	}
}