/**
 * @project LD24
 * @package nl.logiconline.ld24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 26, 2012
 * @file PreLoader.as
 */
package nl.logiconline.ld24 {
	import org.flixel.system.FlxPreloader;
	
	public class PreLoader extends FlxPreloader {
		public function PreLoader() {
			className = "nl.logiconline.ld24.Main";
			super();
		}
	}
}