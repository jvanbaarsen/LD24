/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Level.as
 */
package nl.logiconline.ld24.levels {
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
	
	public class Level extends FlxGroup {
		protected var map:FlxTilemap;
		protected var background:FlxTilemap;
		protected var startPoint:FlxPoint = new FlxPoint(0, 0);
		
		public function Level() {			
		}
		
		public function getMap():FlxTilemap {
			return this.map;
		}
		
		public function getStartPoint():FlxPoint {
			return this.startPoint;
		}
	}
}