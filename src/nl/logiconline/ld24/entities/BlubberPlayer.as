/**
 * @project LD24
 * @package nl.logiconline.ld24.entities
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file BlubberPlayer.as
 */
package nl.logiconline.ld24.entities {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxPoint;
	
	public class BlubberPlayer extends Player {		
		public function BlubberPlayer(startPoint:FlxPoint) {
			super(startPoint);
			super.PLAYER_RUN_SPEED = 30;
			this.loadGraphic(Resources.player, true, true, 32, 32, true);
			this.addAnimation("idle", [2], 0, true);
			this.addAnimation("walk", [2,3], 10, true);
			this.frame = 2;
		}
		
		override public function update():void {
			super.update();
			if(this.acceleration.x != 0) {
				this.play("walk");
			} else {
				this.play("idle");
			}
		}
	}
}