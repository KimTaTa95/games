package scripts;

import com.stencyl.graphics.G;

import com.stencyl.behavior.Script;
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

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.utils.Utils;

import nme.ui.Mouse;
import nme.display.Graphics;
import nme.display.BlendMode;
import nme.events.Event;
import nme.events.TouchEvent;
import nme.net.URLLoader;

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



class Design_27_27_BackandForthVertically extends ActorScript
{          	
	
public var _DistanceUp:Float;

public var _Speed:Float;

public var _InitialDirection:Float;

public var _DistanceDown:Float;

public var _ChangeDirectiononCollision:Bool;

public var _Start:Float;

public var _End:Float;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Distance Up", "_DistanceUp");
_DistanceUp = 100.0;
nameMap.set("Speed", "_Speed");
_Speed = 10.0;
nameMap.set("Initial Direction", "_InitialDirection");
_InitialDirection = 0.0;
nameMap.set("Distance Down", "_DistanceDown");
_DistanceDown = 100.0;
nameMap.set("Change Direction on Collision", "_ChangeDirectiononCollision");
_ChangeDirectiononCollision = true;
nameMap.set("Start", "_Start");
_Start = 0.0;
nameMap.set("End", "_End");
_End = 0.0;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		            _Start = asNumber((actor.getYCenter() - _DistanceUp));
propertyChanged("_Start", _Start);
        _End = asNumber((actor.getYCenter() + _DistanceDown));
propertyChanged("_End", _End);
        actor.setYVelocity((_InitialDirection * _Speed));
    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((actor.getYCenter() > _End))
{
            actor.setYVelocity(-(_Speed));
}

        else if((actor.getYCenter() < _Start))
{
            actor.setYVelocity(_Speed);
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}