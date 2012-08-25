/**
 * @project LD24
 * @package nl.logiconline.ld24.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file ActionButton.as
 */
package nl.logiconline.ld24.gui {
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.osmf.net.SwitchingRuleBase;

	public class ActionButton extends FlxGroup {
		private var type:String;
		private var button:FlxSprite;
		private var origFrame:int = 0;
		public function ActionButton(x:int, y:int, type:String) {
			this.type = type;
			this.button = new FlxSprite(x, y);
			this.button.loadGraphic(Resources.actions, true, false, 26, 26);
				
			if(this.type == "teach") {
				this.button.frame = 0;
				this.origFrame = 0;
			} else if(this.type == "clean") {
				this.button.frame = 1;
				this.origFrame = 1;
			} else if(this.type == "sleep") {
				this.button.frame = 2;
				this.origFrame = 2;
			} else if(this.type == "play") {
				this.button.frame = 3;
				this.origFrame = 3;
			} else if(this.type == "feed") {
				this.button.frame = 4;
				this.origFrame = 4;
			}
			
			this.add(this.button);
		}
		
		override public function update():void {
			super.update();			
			if(FlxG.mouse.x > this.button.x && FlxG.mouse.x < this.button.x + 26 && FlxG.mouse.y > this.button.y && FlxG.mouse.y < this.button.y + 26) {
				if(FlxG.mouse.justPressed()) {
					if(this.type == "teach") {
						Globals.player.teach();
					} else if(this.type == "clean") {
						Globals.player.clean();
					} else if(this.type == "sleep") {
						Globals.player.sleep();
					} else if(this.type == "play") {
						Globals.player.fun();
					} else if(this.type == "feed") {
						Globals.player.feed();
					}
				}
				this.button.frame = this.origFrame + 5;
			} else {
				this.button.frame = this.origFrame;
			}			
		}		
	}
}