/**
 * @project LD24
 * @package nl.logiconline.ld24.gui
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Hud.as
 */
package nl.logiconline.ld24.gui {
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	public class Hud extends FlxGroup {
		private var hudImage:FlxSprite;
		private var intellectBar:Bar;
		private var hygieneBar:Bar;
		private var energyBar:Bar;
		private var funBar:Bar;
		private var hungerBar:Bar;
		private var portrait:Portrait;
		
		private var teachAction:ActionButton;
		private var cleanAction:ActionButton;
		private var sleepAction:ActionButton;
		private var playAction:ActionButton;
		private var feedAction:ActionButton;
		public function Hud() {
			this.hudImage = new FlxSprite(0, 0, Resources.hud);	
			this.add(hudImage);
			this.intellectBar = new Bar(69,20, Globals.intellect);
			this.add(this.intellectBar);
			
			this.hygieneBar = new Bar(117,20, Globals.hygiene);
			this.add(this.hygieneBar);
			
			this.energyBar = new Bar(165,20, Globals.energy);
			this.add(this.energyBar);			
			
			this.funBar = new Bar(213,20, Globals.fun);
			this.add(this.funBar);
			
			this.hungerBar = new Bar(261,20, Globals.hunger);
			this.add(this.hungerBar);
			
			this.portrait = new Portrait(20, 5);
			this.add(this.portrait);
			
			this.teachAction = new ActionButton(FlxG.width / 2 - 75,FlxG.height - 40, "teach");
			this.add(teachAction);
			
			this.cleanAction = new ActionButton(FlxG.width / 2 - 44,FlxG.height - 40, "clean");
			this.add(cleanAction);
			
			this.sleepAction = new ActionButton(FlxG.width / 2 - 13,FlxG.height - 40,"sleep");
			this.add(sleepAction);
			
			this.playAction = new ActionButton(FlxG.width / 2 + 18,FlxG.height - 40,"play");
			this.add(playAction);
			
			this.feedAction = new ActionButton(FlxG.width / 2 + 49,FlxG.height - 40,"feed");
			this.add(feedAction);
			
			
		}	
		
		override public function update():void {
			super.update();
			this.intellectBar.setValue(Math.round(Globals.intellect));
			this.hygieneBar.setValue(Math.round(Globals.hygiene));
			this.energyBar.setValue(Math.round(Globals.energy));
			this.funBar.setValue(Math.round(Globals.fun));
			this.hungerBar.setValue(Math.round(Globals.hunger));
		}
		
	}
}