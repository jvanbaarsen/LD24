/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Player.as
 */
package nl.logiconline.ld24.entities {
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class Player extends FlxSprite {
		protected const PLAYER_RUN_SPEED:int = 50;
		protected const GRAVITY_ACCELERATION:Number = 450;
		protected const JUMP_ACCELERATION:Number = 260;
		private var direction:int = 1;
		public function Player(startPoint:FlxPoint) {
			this.x = startPoint.x;
			this.y = startPoint.y;
			
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
		}
		
		public function teach():void {
			
		}
		
		public function clean():void {
			
		}
		
		public function sleep():void {
			
		}
		
		public function fun():void {
			
		}
		
		public function feed():void {
			
		}
		
		
	}
}