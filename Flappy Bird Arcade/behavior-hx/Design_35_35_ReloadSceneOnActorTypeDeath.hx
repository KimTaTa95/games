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



class Design_35_35_ReloadSceneOnActorTypeDeath extends SceneScript
{          	
	
public var _FadeOutTime:Float;

public var _FadeInTime:Float;

public var _ActorType:ActorType;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Fade Out Time", "_FadeOutTime");
_FadeOutTime = 0.0;
nameMap.set("Fade In Time", "_FadeInTime");
_FadeInTime = 0.0;
nameMap.set("Actor Type", "_ActorType");

	}
	
	override public function init()
	{
		    addWhenTypeGroupKilledListener(_ActorType, function(eventActor:Actor, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        switchScene(1, null,createCrossfadeTransition((1)));
}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}