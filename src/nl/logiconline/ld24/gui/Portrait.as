/**
 * @project LD24
 * @package nl.logiconline.ld24.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Portrait.as
 */
package nl.logiconline.ld24.gui {
	import nl.logiconline.ld24.entities.BlockyPlayer;
	import nl.logiconline.ld24.entities.BlubberPlayer;
	import nl.logiconline.ld24.entities.EggPlayer;
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;

	public class Portrait extends FlxGroup {
		private var portrait:FlxSprite;
		public function Portrait(x:int, y:int) {
			this.portrait = new FlxSprite(x, y);
			this.portrait.loadGraphic(Resources.portrait, true, false, 33, 32);
			if(Globals.player is EggPlayer) {
				this.portrait.frame = 0;	
			} else if(Globals.player is BlubberPlayer) {
				this.portrait.frame = 1;
			} else if(Globals.player is BlockyPlayer) {
				this.portrait.frame = 2;
			}
			
			this.add(this.portrait);
		}
		
		override public function update():void {
			super.update();
			if(Globals.player is EggPlayer) {
				this.portrait.frame = 0;	
			} else if(Globals.player is BlubberPlayer) {
				this.portrait.frame = 1;
			} else if(Globals.player is BlockyPlayer) {
				this.portrait.frame = 2;
			}
		}
	}
}