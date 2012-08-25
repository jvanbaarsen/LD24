/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file BaseLevel.as
 */
package nl.logiconline.ld24.levels {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTilemap;

	public class BaseLevel extends Level {
		public function BaseLevel() {
			//Background
			add(new FlxSprite(9,49, Resources.background));
			
			//Foreground
			this.map = new FlxTilemap();
			this.map.loadMap(new Resources.base_map, Resources.tiles, 10, 10);
			this.add(this.map);
			
			this.startPoint.x = 20;
			this.startPoint.y = 160;
		}		
	}
}