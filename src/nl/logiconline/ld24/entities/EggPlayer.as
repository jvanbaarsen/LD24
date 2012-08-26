/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file EggPlayer.as
 */
package nl.logiconline.ld24.entities {
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class EggPlayer extends Player {
		public function EggPlayer(startPoint:FlxPoint)	{
			super(startPoint);
			this.loadGraphic(Resources.player, true, true, 32, 32, true);
			
			super.sitSprite = new FlxSprite(203,135);
			super.sitSprite.loadGraphic(Resources.player, true, false, 32, 32);
			super.sitSprite.frame = 20;
			
			this.addAnimation("clean", [10, 11], 10, true);
			this.addAnimation("walk", [0], 0, true);
			this.addAnimation("idle", [0], 0, true);
			this.frame = 0;
			
			
		}
	}
}