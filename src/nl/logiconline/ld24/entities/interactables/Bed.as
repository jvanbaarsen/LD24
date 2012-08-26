/**
 * @project LD24
 * @package nl.logiconline.ld24.entities.interactables
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 26, 2012
 * @file Bed.as
 */
package nl.logiconline.ld24.entities.interactables {
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	public class Bed extends FlxGroup {
		private var sprite:FlxSprite;
		private var tooltip:FlxText;
		public function Bed(x:int, y:int)	{			
			this.sprite = new FlxSprite(x, y);
			this.sprite.loadGraphic(Resources.bed, true, false, 35, 12);
			this.sprite.frame = 1;
			this.sprite.width = 35;
			this.sprite.height = 12;
			add(this.sprite);
		}
		
		override public function update():void {
			super.update();
			if(FlxG.mouse.x > this.sprite.x && FlxG.mouse.x < this.sprite.x + this.sprite.width && FlxG.mouse.y > this.sprite.y && FlxG.mouse.y < this.sprite.y + this.sprite.height) {
				if(FlxG.mouse.justPressed()) {
					Globals.player.sleep();
				}
				if(this.tooltip == null) {
					this.tooltip = new FlxText(0, 50, FlxG.width, "Click to sleep");
					this.tooltip.setFormat(null, 8, 0xffffff, "center");
					add(this.tooltip);					
				}
				this.sprite.frame = 0;
			} else {
				this.sprite.frame = 1;
				if(this.tooltip != null) {
					this.tooltip.kill();
					this.tooltip = null;					
				}
			}
		}
	}	
}