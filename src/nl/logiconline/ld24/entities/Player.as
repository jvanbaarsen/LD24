/**
 * @project LD24
 * @package LD24
 * @author Jeroen van Baarsen <jeroen@logiconline.nl>
 * @copyright LogicOnline 2012
 * @created Aug 25, 2012
 * @file Player.as
 */
package nl.logiconline.ld24.entities {
	import flash.utils.Timer;
	
	import nl.logiconline.ld24.entities.droppables.Poo;
	import nl.logiconline.ld24.entities.particles.FloatingText;
	import nl.logiconline.ld24.utils.Globals;
	import nl.logiconline.ld24.utils.Resources;
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxTimer;
	import org.flixel.system.debug.Log;

	public class Player extends FlxSprite {
		protected var PLAYER_RUN_SPEED:int = 50;
		protected var GRAVITY_ACCELERATION:Number = 450;
		protected var JUMP_ACCELERATION:Number = 260;
		private var direction:int = 1;
		private var timer:FlxTimer = new FlxTimer();
		private var inAnimation:Boolean = false;
		
		protected var sitSprite:FlxSprite;
		private var chair:FlxSprite = new FlxSprite(206,151, Resources.chair);
		
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
			if(!this.inAnimation) {
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
				
				Globals.alterEnergy(-Math.random() / 600);	
				Globals.alterFun(-Math.random() / 500);
				Globals.alterHunger(-Math.random() / 400);				
				this.getFilthy();
			}
			
		}
		
		public function getFilthy():void {
			var curHygiene:int = Math.round(Globals.hygiene);
			Globals.alterHygiene(-Math.random() / 350);
			if(Math.round(Globals.hygiene) < curHygiene) {
				this.inAnimation = true;
				this.play("idle");
				Globals.poo[Globals.poo.length] = new Poo(this.x, this.y + 23);
				FlxG.state.add(Globals.poo[Globals.poo.length - 1]);				
				this.timer.start(1, 1, stopPooAnimation); 
				
			}
		}
		
		public function stopPooAnimation(timer:FlxTimer):void {
			this.inAnimation = false;
		}
		
		public function teach():void {
			if(Globals.player.isInAnimation()) {
				FlxG.state.add(new FloatingText(FlxG.mouse.x - 30, FlxG.mouse.y - 30, "Allready busy!"));
				return
			}
			if(Math.round(Globals.energy) <= 1) {
				FlxG.state.add(new FloatingText(this.x, this.y - 80, "Im to tired to learn!", true));
				return;
			} else if(Math.round(Globals.fun) <= 1) {
				FlxG.state.add(new FloatingText(this.x, this.y - 80, "Im way to depressed to learn!", true));
				return;
			}
			Globals.alterFun(-4);
			Globals.alterEnergy(-2);
			Globals.alterIntellect(1);
			this.inAnimation = true;
			this.timer.start(2, 1, stopTeaching);
		}
		
		public function stopTeaching(timer:FlxTimer):void {
			this.inAnimation = false;
			FlxG.state.add(new FloatingText(this.x, this.y, "+1 wisdom"));
		}
		
		public function clean(pooClicked:Poo = null):void {
			if(Globals.player.isInAnimation()) {
				FlxG.state.add(new FloatingText(FlxG.mouse.x - 30, FlxG.mouse.y - 30, "Allready busy!"));
				return
			}
			if(Math.round(Globals.hygiene) == 10) {
				FlxG.state.add(new FloatingText(this.x, this.y - 80, "Its allready clean here!", true));
				return;
			}
			this.inAnimation = true;
			Globals.alterFun(-1);
			Globals.alterHygiene(1);
			if(pooClicked != null) {
				pooClicked.kill();
			} else {
				if(Globals.poo.length > 0) {	
					var poo:Poo = Globals.poo.pop();
					if(poo != null) {
						poo.kill();	
					}					
				}		
			}
			this.play("clean");					
			this.timer.start(2, 1, stopCleaning);
		}
		
		public function stopCleaning(timer:FlxTimer):void {
			this.inAnimation = false;
			FlxG.state.add(new FloatingText(this.x, this.y, "+1 hygiene"));
			this.play("idle");
		}
		
		public function sleep():void {
			if(Globals.player.isInAnimation()) {
				FlxG.state.add(new FloatingText(FlxG.mouse.x - 30, FlxG.mouse.y - 30, "Allready busy!"));
				return
			}
			this.inAnimation = true;
			Globals.alterEnergy(1);			
			this.timer.start(2, 1, stopSleeping);
		}
		
		public function stopSleeping(timer:FlxTimer):void {
			this.inAnimation = false;
			FlxG.state.add(new FloatingText(this.x, this.y, "+1 energy"));
			
		}
		
		public function fun():void {
			if(Globals.player.isInAnimation()) {
				FlxG.state.add(new FloatingText(FlxG.mouse.x - 30, FlxG.mouse.y - 30, "Allready busy!"));
				return
			}
			if(Math.round(Globals.fun) == 10) {
				FlxG.state.add(new FloatingText(this.x, this.y - 80, "I had way to much fun allready!", true));
				return
			}
			this.inAnimation = true;
			Globals.alterFun(1);			
			this.visible = false;
			FlxG.state.add(this.sitSprite);
			FlxG.state.add(this.chair);
			this.timer.start(2, 1, stopFun);
		}
		
		public function stopFun(timer:FlxTimer):void {
			this.inAnimation = false;
			FlxG.state.remove(this.sitSprite);
			FlxG.state.remove(this.chair);
			this.visible = true;
			this.setLocation(new FlxPoint(206, 151));
			
		}
		
		public function feed():void {
			if(Globals.player.isInAnimation()) {
				FlxG.state.add(new FloatingText(FlxG.mouse.x - 30, FlxG.mouse.y - 30, "Allready busy!"));
				return
			}
			if(Math.round(Globals.hunger) == 10) {
				FlxG.state.add(new FloatingText(this.x, this.y - 80, "Im not hungry!", true));
				return;
			}
			Globals.alterHunger(1);
		}
		
		public function isInAnimation():Boolean {
			return this.inAnimation;
		}
		
		
	}
}