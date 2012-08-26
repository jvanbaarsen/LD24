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
	import org.flixel.FlxSprite;
	
	public class BlockyPlayer extends Player {
		public function BlockyPlayer(startPoint:FlxPoint) {
			super(startPoint);			
			super.PLAYER_RUN_SPEED = 45;			
			this.loadGraphic(Resources.player, true, true, 32, 32, true);
			this.addAnimation("idle", [4], 0, true);
			this.addAnimation("walk", [4, 5], 10, true);
			this.addAnimation("clean", [14, 15], 10, true);
			this.addAnimation("read", [28], 0, true);
			this.frame = 4;
			
			super.sitSprite = new FlxSprite(202,135);
			super.sitSprite.loadGraphic(Resources.player, true, false, 32, 32);
			super.sitSprite.frame = 22;
			
			super.eatSprite = new FlxSprite(145,159);
			super.eatSprite.loadGraphic(Resources.player, true, false, 32, 32);
			super.eatSprite.frame = 22;
			
			super.sleepSprite = new FlxSprite(17, 158);
			super.sleepSprite.loadGraphic(Resources.player, true, false, 32, 32);
			super.sleepSprite.frame = 25;
		}
		
		override public function update():void {
			super.update();
			if(!super.isInAnimation()) {
				if(this.acceleration.x != 0) {
					this.play("walk");
				} else {
					this.play("idle");
				}	
			}			
		}
	}
}