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
import nme.display.BitmapData;
import nme.display.Bitmap;
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



class Design_12_12_CreateParticlesonClick extends ActorScript
{          	
	
public var _Particle:ActorType;

public var _NumberofParticles:Float;

public var _Velocity:Float;

public var _CreatingParticles:Bool;

 
 	public function new(dummy:Int, actor:Actor, engine:Engine)
	{
		super(actor, engine);	
		nameMap.set("Particle", "_Particle");
nameMap.set("Number of Particles", "_NumberofParticles");
_NumberofParticles = 0.0;
nameMap.set("Velocity", "_Velocity");
_Velocity = 0.0;
nameMap.set("Creating Particles", "_CreatingParticles");
_CreatingParticles = false;
nameMap.set("Actor", "actor");

	}
	
	override public function init()
	{
		    addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if(!(_CreatingParticles))
{
            _CreatingParticles = true;
propertyChanged("_CreatingParticles", _CreatingParticles);
            for(index0 in 0...Std.int(_NumberofParticles))
{
                createRecycledActor(_Particle, (actor.getXCenter() - 4), (actor.getYCenter() - 4), Script.FRONT);
                getLastCreatedActor().setVelocity(randomInt(Math.floor(180), Math.floor(360)), _Velocity);
                if((index0 == _NumberofParticles))
{
                    _CreatingParticles = false;
propertyChanged("_CreatingParticles", _CreatingParticles);
}

}

}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}