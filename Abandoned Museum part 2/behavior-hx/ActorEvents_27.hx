package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class ActorEvents_27 extends ActorScript
{
	public var _touchfloor:Bool;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("touch floor", "_touchfloor");
		_touchfloor = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		engine.cameraFollow(actor);
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isKeyDown("right"))
				{
					actor.setXVelocity(20);
					actor.setAnimation("" + "Left");
				}
				else if(isKeyDown("left"))
				{
					actor.setXVelocity(-20);
					actor.setAnimation("" + "Right");
				}
				else
				{
					actor.setXVelocity(0);
					actor.setAnimation("" + "Stance");
				}
			}
		});
		
		/* ======================== Actor of Type ========================= */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorType(10), event.otherActor.getType(),event.otherActor.getGroup()))
			{
				recycleActor(event.otherActor);
				Engine.engine.setGameAttribute("Flower Shard", (Engine.engine.getGameAttribute("Flower Shard") + 1));
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((getScreenHeight() < actor.getY()))
				{
					reloadCurrentScene(null, createCrossfadeTransition(.5));
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((actor.getScreenX() < 0))
				{
					actor.setX(1);
				}
				else if((actor.getScreenX() > (getScreenWidth() - (actor.getWidth()))))
				{
					actor.setX(((getScreenWidth() - (actor.getWidth())) - 1));
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((isKeyDown("up") && (_touchfloor == true)))
				{
					actor.setYVelocity(-30);
					_touchfloor = false;
					propertyChanged("_touchfloor", _touchfloor);
				}
			}
		});
		
		/* =========================== Keyboard =========================== */
		addKeyStateListener("up", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && released)
			{
				if((1 == Engine.engine.getGameAttribute("JumpTimes")))
				{
					Engine.engine.setGameAttribute("JumpTimes", 2);
				}
			}
		});
		
		/* ======================= Member of Group ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorGroup(1),event.otherActor.getType(),event.otherActor.getGroup()))
			{
				if((event.otherFromTop && event.thisFromBottom))
				{
					_touchfloor = true;
					propertyChanged("_touchfloor", _touchfloor);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}