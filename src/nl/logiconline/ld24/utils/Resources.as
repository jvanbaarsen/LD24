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
		
		//Sprites
		[Embed(source = '../res/sprites/tiles.png')] public static var tiles:Class;
		[Embed(source = '../res/sprites/player.png')] public static var player:Class;
		[Embed(source = '../res/sprites/hud.png')] public static var hud:Class;
		[Embed(source = '../res/sprites/portrait.png')] public static var portrait:Class;
		[Embed(source = '../res/sprites/actions.png')] public static var actions:Class;
		[Embed(source = '../res/sprites/background.png')] public static var background:Class;
		[Embed(source = '../res/sprites/books.png')] public static var books:Class;
		[Embed(source = '../res/sprites/bottles.png')] public static var bottles:Class;
		[Embed(source = '../res/sprites/computer.png')] public static var computer:Class;
		[Embed(source = '../res/sprites/chair.png')] public static var chair:Class;
		[Embed(source = '../res/sprites/bed.png')] public static var bed:Class;
		[Embed(source = '../res/sprites/food.png')] public static var food:Class;
		[Embed(source = '../res/sprites/splash.png')] public static var splash:Class;
		[Embed(source = '../res/sprites/theend.png')] public static var theend:Class;
		
		//Bars
		[Embed(source = '../res/sprites/bar.png')] public static var bar:Class;
		[Embed(source = '../res/sprites/bar_glow.png')] public static var barGlow:Class;
		[Embed(source = '../res/sprites/bar_active.png')] public static var barActive:Class;
		
		//Audio
		[Embed(source = '../res/audio/music.mp3')] public static var music:Class;	
		
		
		public function Resources() {
		}
	}
}