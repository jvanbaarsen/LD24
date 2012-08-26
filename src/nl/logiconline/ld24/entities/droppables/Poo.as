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
	
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxParticle;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxTimer;
	
	public class Poo extends FlxGroup {
		private var sprite:FlxSprite;
		private var smokeEmitter:FlxEmitter;
		private var timer:FlxTimer = new FlxTimer();
		private var tooltip:FlxText;
		public var x:int;
		public function Poo(x:int, y:int) {
			sprite = new FlxSprite(x, y);
			this.x = x;
			sprite.loadGraphic(Resources.tiles, false, false, 10, 10);
			sprite.frame = 30;
			add(sprite);
		}		
		
		override public function kill():void {
			this.timer.start(1, 1, cleaned);
		}
		
		override public function update():void {
			super.update();
			if(this.timer != null) {
				this.sprite.alpha -= this.timer.progress;
			}
			
			if(FlxG.mouse.x > this.sprite.x && FlxG.mouse.x < this.sprite.x + 10 && FlxG.mouse.y > this.sprite.y && FlxG.mouse.y < this.sprite.y + 10) {
				if(FlxG.mouse.justPressed()) {
					Globals.player.clean(this);
				}
				if(this.tooltip == null) {
					this.tooltip = new FlxText(0, 50, FlxG.width, "Click to clean");
					this.tooltip.setFormat(null, 8, 0xffffff, "center");
					add(this.tooltip);	
					this.sprite.frame = 31;
				}				
			} else {
				if(this.tooltip != null) {
					this.tooltip.kill();
					this.tooltip = null;
					this.sprite.frame = 30;
				}
			}
			
		}
		
		public function cleaned(timer:FlxTimer):void {
			super.kill();
		}
	}
}