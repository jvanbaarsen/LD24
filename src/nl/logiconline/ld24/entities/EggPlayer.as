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

	public class EggPlayer extends Player {
		public function EggPlayer(startPoint:FlxPoint)	{
			super(startPoint);
			this.loadGraphic(Resources.player, false, true, 16, 16, true);
			
		}
	}
}