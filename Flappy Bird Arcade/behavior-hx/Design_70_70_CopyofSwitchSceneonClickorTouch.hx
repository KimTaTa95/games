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



class Design_70_70_CopyofSwitchSceneonClickorTouch extends SceneScript
{          	
	
public var _NextScene:Scene;

public var _OutTime:Float;

public var _InTime:Float;

public var _TransitionStyle:String;
    public function _customEvent_SwitchScene():Void
{
        if(((hasValue(_NextScene) != false) && !(isTransitioning())))
{
            if((_TransitionStyle == "Fade"))
{
                switchScene(_NextScene.getID(), createFadeOut((_OutTime)),createFadeIn((_InTime)));
}

            else if((_TransitionStyle == "Blinds"))
{
                switchScene(_NextScene.getID(), createBlindsOut((_OutTime)),createBlindsIn((_InTime)));
}

            else if((_TransitionStyle == "Bubbles"))
{
                switchScene(_NextScene.getID(), createBubblesOut((_OutTime)),createBubblesIn((_InTime)));
}

            else if((_TransitionStyle == "Spotlight"))
{
                switchScene(_NextScene.getID(), createCircleOut((_OutTime)),createCircleIn((_InTime)));
}

            else if((_TransitionStyle == "Blur"))
{
                switchScene(_NextScene.getID(), createPixelizeOut((_OutTime)),createPixelizeIn((_InTime)));
}

            else if((_TransitionStyle == "Box"))
{
                switchScene(_NextScene.getID(), createRectangleOut((_OutTime)),createRectangleIn((_InTime)));
}

            else if((_TransitionStyle == "Crossfade"))
{
                switchScene(_NextScene.getID(), null,createCrossfadeTransition((_OutTime)));
}

            else if((_TransitionStyle == "Slide Up"))
{
                switchScene(_NextScene.getID(), null,createSlideUpTransition((_OutTime)));
}

            else if((_TransitionStyle == "Slide Down"))
{
                switchScene(_NextScene.getID(), null,createSlideDownTransition((_OutTime)));
}

            else if((_TransitionStyle == "Slide Left"))
{
                switchScene(_NextScene.getID(), null,createSlideLeftTransition((_OutTime)));
}

            else if((_TransitionStyle == "Slide Right"))
{
                switchScene(_NextScene.getID(), null,createSlideRightTransition((_OutTime)));
}

}

}


 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("Next Scene", "_NextScene");
nameMap.set("Out Time", "_OutTime");
_OutTime = 0.5;
nameMap.set("In Time", "_InTime");
_InTime = 0.5;
nameMap.set("Transition Style", "_TransitionStyle");
_TransitionStyle = "";

	}
	
	override public function init()
	{
		    addKeyStateListener("Fly", function(pressed:Bool, released:Bool, list:Array<Dynamic>):Void {
if(wrapper.enabled && pressed){
        if((getGameAttribute("Coins") > 0))
{
            recycleActor(getLastCreatedActor());
            switchScene(0, null,createCrossfadeTransition((0.5)));
}

}
});
    addMousePressedListener(function(list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((getGameAttribute("Coins") > 0))
{
            recycleActor(getLastCreatedActor());
            switchScene(0, null,createCrossfadeTransition((0.5)));
}

}
});

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}