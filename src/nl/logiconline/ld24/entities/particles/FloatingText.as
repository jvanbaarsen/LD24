/**
 * @project LD24
 * @package nl.logiconline.ld24.entities.particles
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 26, 2012
 * @file FloatingText.as
 */
package nl.logiconline.ld24.entities.particles {
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	
	public class FloatingText extends FlxGroup {
		private var text:FlxText;
		private var duration:int;
		private var curDuration:Number = 0;
		private var speed:Number = 0;
		public function FloatingText(x:int, y:int, text:String, center:Boolean = false, textColor:uint = 0xffffffff, duration:int = 1, speed:Number = 0.01) {
			if(center) {
				this.text = new FlxText(0, y, FlxG.width, text);
				this.text.setFormat(null, 8, 0xffffff, "center");
			} else {
				this.text = new FlxText(x, y, text.length * 8, text);
			}
			
			this.text.color = textColor;
			this.speed = speed;			
			add(this.text);
		}
		
		override public function update():void {
			super.update();
			this.text.alpha -= speed;		
			this.text.y -= speed * 10;
			if(this.text.alpha <= 0) this.kill();
			
		}
	}
}