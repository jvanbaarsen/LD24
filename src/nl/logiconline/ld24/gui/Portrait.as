/**
 * @project LD24
 * @package nl.logiconline.ld24.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Portrait.as
 */
package nl.logiconline.ld24.gui {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	public class Portrait extends FlxGroup {
		private var portrait:FlxSprite;
		public function Portrait(x:int, y:int) {
			this.portrait = new FlxSprite(x, y);
			this.portrait.loadGraphic(Resources.portrait, true, false, 33, 32);
			this.portrait.frame = 0;
			this.add(this.portrait);
		}
	}
}