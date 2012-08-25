/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Player.as
 */
package nl.logiconline.ld24.entities {
	import nl.logiconline.ld24.entities.droppables.Poo;
	import nl.logiconline.ld24.utils.Globals;
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTimer;

	public class Player extends FlxSprite {
		protected var PLAYER_RUN_SPEED:int = 50;
		protected var GRAVITY_ACCELERATION:Number = 450;
		protected var JUMP_ACCELERATION:Number = 260;
		private var direction:int = 1;
		private var timer:FlxTimer;
		
		public function Player(startPoint:FlxPoint) {
			this.x = startPoint.x;
			this.y = startPoint.y;
			this.timer = new FlxTimer();
			
			//Set physics
			this.maxVelocity.x = this.PLAYER_RUN_SPEED;   
			this.maxVelocity.y = this.JUMP_ACCELERATION;  
			this.acceleration.y = this.GRAVITY_ACCELERATION; 
			this.drag.x = this.maxVelocity.x*8;	
			
			
		}
		
		public function setLocation(newPos:FlxPoint):void {
			this.x = newPos.x;
			this.y = newPos.y;
		}
		
		override public function update():void {
			super.update();	
			this.acceleration.x = 0;	
			if(this.direction == 1) {
				this.acceleration.x = drag.x;	
			} else if(this.direction == 0) {
				this.acceleration.x = -drag.x;
			}
			
			if(this.acceleration.x > 0) {
				this.facing = LEFT;
			} else if(this.acceleration.x < 0) {
				this.facing = RIGHT;
			}
			
			if(this.isTouching(FlxObject.RIGHT)) {
				this.direction = 0;				
			} else if(this.isTouching(FlxObject.LEFT)) {
				this.direction = 1;				
			}
			
			
			Globals.alterEnergy(-Math.random() / 400);	
			Globals.alterFun(-Math.random() / 500);
			Globals.alterHunger(-Math.random() / 400);			
			Globals.alterIntellect(-Math.random() / 400);
			this.getFilthy();
			
		}
		
		public function getFilthy():void {
			var curHygiene:int = Math.round(Globals.hygiene);
			Globals.alterHygiene(-Math.random() / 350);
			if(Math.round(Globals.hygiene) < curHygiene) {
				FlxG.state.add(new Poo(this.x, this.y + 23));
			}
		}
		
		public function teach():void {
			Globals.alterIntellect(1);
		}
		
		public function clean():void {
			Globals.alterHygiene(1);
		}
		
		public function sleep():void {
			Globals.alterEnergy(1);
		}
		
		public function fun():void {
			Globals.alterFun(1);
		}
		
		public function feed():void {
			Globals.alterHunger(1);
		}
		
		
	}
}