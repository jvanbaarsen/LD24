/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Resources.as
 */
package nl.logiconline.ld24.utils {
	public class Resources {
		
		//Levels
		[Embed(source = '../res/levels/mapCSV_Base_foreground.csv', mimeType = 'application/octet-stream')] public static var base_map:Class;
		[Embed(source = '../res/levels/mapCSV_Base_background.csv', mimeType = 'application/octet-stream')] public static var base_background:Class;
		
		//Sprites
		[Embed(source = '../res/sprites/tiles.png')] public static var tiles:Class;
		[Embed(source = '../res/sprites/player.png')] public static var player:Class;
		[Embed(source = '../res/sprites/hud.png')] public static var hud:Class;
		[Embed(source = '../res/sprites/portrait.png')] public static var portrait:Class;
		[Embed(source = '../res/sprites/actions.png')] public static var actions:Class;
		
		//Bars
		[Embed(source = '../res/sprites/bar.png')] public static var bar:Class;
		[Embed(source = '../res/sprites/bar_glow.png')] public static var barGlow:Class;
		[Embed(source = '../res/sprites/bar_active.png')] public static var barActive:Class;
		
		
		
		public function Resources() {
		}
	}
}