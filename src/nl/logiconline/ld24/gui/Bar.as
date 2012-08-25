/**
 * @project LD24
 * @package nl.logiconline.ld24.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Bar.as
 */
package nl.logiconline.ld24.gui {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	public class Bar extends FlxGroup {
		private var value:int;
		private var bar:FlxSprite;
		private var bars:Array;
		private var barGlow:FlxSprite;
		public function Bar(x:int, y:int, initValue:int = 10) {
			this.value = initValue;
			this.bar = new FlxSprite(x, y, Resources.bar);
			this.add(this.bar);
			
			bars = new Array();
			for(var i:int = 1; i <= 10; i++) {
				bars[i] = new FlxSprite(x + (i * 3) - 2, y + 1, Resources.barActive);
			}
			this.barGlow = new FlxSprite(x + 1, y + 1, Resources.barGlow);
			
		}
		
		override public function draw():void {
			super.draw();
			for(var i:int = 1; i <= value; i++) {
				FlxSprite(bars[i]).draw();
			}						
		}
		
		public function setValue(value:int):void {
			this.value = value;
		}
	}
}