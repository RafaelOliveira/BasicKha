package;

import kha.Assets;
import kha.Framebuffer;
import kha.Image;
import kha.input.Keyboard;
import kha.input.Mouse;
import kha.Key;
import kha.Scaler;
import kha.System;

class BasicKha 
{
	var backbuffer:Image;	
	var initialized: Bool = false;
	
	var ball:Image;
	var xPos:Float;
	var yPos:Float;
	
	var keys:Array<Bool> = [for(i in 0...4) false];
	
	public function new() 
	{
		backbuffer = Image.createRenderTarget(800, 600);		
		
		var keyboard = Keyboard.get();
		keyboard.notify(keyDown, keyUp);
		
		var mouse = Mouse.get();
		mouse.notify(null, null, mouseMove, null);

		Assets.loadEverything(loadingFinished);
	}

	private function loadingFinished():Void
	{
		initialized = true;
		
		ball = Assets.images.ball;
		xPos = (System.pixelWidth / 2) - (ball.width / 2);
		yPos = (System.pixelHeight / 2) - (ball.width / 2);
	}
	
	function keyDown(key:Key, char:String):Void
	{
		switch(key)
		{
			case Key.LEFT:  keys[0] = true;
			case Key.RIGHT: keys[1] = true;
			case Key.UP:    keys[2] = true;
			case Key.DOWN:  keys[3] = true;
			default: return;
		}
	}
	
	function keyUp(key:Key, char:String):Void
	{
		switch(key)
		{
			case Key.LEFT:  keys[0] = false;
			case Key.RIGHT: keys[1] = false;
			case Key.UP:    keys[2] = false;
			case Key.DOWN:  keys[3] = false;
			default: return;
		}
	}
	
	function mouseMove(x:Int, y:Int, movementX:Int, movementY:Int):Void
	{
		xPos = x - (ball.width / 2);
		yPos = y - (ball.height / 2);
	}
	
	public function update():Void
	{
		if (!initialized)
			return;
			
		if (keys[0])
			xPos -= 3;
		else if (keys[1])
			xPos += 3;
			
		if (keys[2])
			yPos -= 3;
		else if (keys[3])
			yPos += 3;
	}
	
	public function render(framebuffer:Framebuffer):Void 
	{
		if (!initialized)
			return;
		
		backbuffer.g2.begin(true);
		backbuffer.g2.drawImage(ball, xPos, yPos);
		backbuffer.g2.end();		
		
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}	
}