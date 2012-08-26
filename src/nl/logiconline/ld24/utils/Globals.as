/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Globals.as
 */
package nl.logiconline.ld24.utils {
	import flashx.textLayout.formats.Float;
	
	import nl.logiconline.ld24.entities.Player;
	import nl.logiconline.ld24.levels.Level;
	
	import org.flixel.FlxG;

	public class Globals {
		public static var gameName:String = "Ludum Dare 24";
		public static var player:Player;
		public static var currentLevel:Level;
		public static var intellect:Number = 0.0;
		public static var fun:Number = 10.0;
		public static var hunger:Number = 10.0;
		public static var hygiene:Number = 10.0;		
		public static var energy:Number = 10.0;
		
		public static var poo:Array = new Array();
		
		public function Globals() {			
		}
		
		public static function alterIntellect(value:Number):void {
			Globals.intellect += value;
			if(Globals.intellect < 0) Globals.intellect = 0;
			if(Globals.intellect > 10) Globals.intellect = 10;
		}
		
		public static function alterFun(value:Number):void {
			Globals.fun += value;
			if(Globals.fun < 0) Globals.fun = 0;
			if(Globals.fun > 10) Globals.fun = 10;
		}
		
		public static function alterHunger(value:Number):void {
			Globals.hunger += value;
			if(Globals.hunger < 0) Globals.hunger = 0;
			if(Globals.hunger > 10) Globals.hunger = 10;
		}
		
		public static function alterHygiene(value:Number):void {
			Globals.hygiene += value;
			if(Globals.hygiene < 0) Globals.hygiene = 0;
			if(Globals.hygiene > 10) Globals.hygiene = 10;
		}
		
		public static function alterEnergy(value:Number):void {			
			Globals.energy = Globals.energy + value;
			if(Globals.energy < 0) Globals.energy = 0;
			if(Globals.energy > 10) Globals.energy = 10;
		}
		
	}
}