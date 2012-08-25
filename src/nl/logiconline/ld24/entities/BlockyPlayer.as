/**
 * @project LD24
 * @package nl.logiconline.ld24.entities
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file BlockyPlayer.as
 */
package nl.logiconline.ld24.entities {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxPoint;
	
	public class BlockyPlayer extends Player {
		public function BlockyPlayer(startPoint:FlxPoint) {
			super(startPoint);			
			super.PLAYER_RUN_SPEED = 45;			
			this.loadGraphic(Resources.player, true, true, 32, 32, true);
			this.addAnimation("idle", [4], 0, true);
			this.addAnimation("walk", [4, 5], 10, true);
			this.frame = 4;
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