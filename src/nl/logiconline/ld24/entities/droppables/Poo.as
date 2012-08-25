/**
 * @project LD24
 * @package nl.logiconline.ld24.entities.droppables
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Poo.as
 */
package nl.logiconline.ld24.entities.droppables {
	import flash.display.Sprite;
	
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxGroup;
	import org.flixel.FlxParticle;
	import org.flixel.FlxSprite;
	
	public class Poo extends FlxGroup {
		private var sprite:FlxSprite;
		private var smokeEmitter:FlxEmitter;
		public function Poo(x:int, y:int) {
			sprite = new FlxSprite(x, y);
			sprite.loadGraphic(Resources.tiles, false, false, 10, 10);
			sprite.frame = 30;
			add(sprite);
		}		
	}
}