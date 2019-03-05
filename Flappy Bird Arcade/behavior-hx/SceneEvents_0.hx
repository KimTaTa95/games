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



class SceneEvents_0 extends SceneScript
{          	
	
public var _HowOften:Float;

public var _Score:Float;

public var _RandomNumber:Actor;

public var _RandomNumber2:Float;

 
 	public function new(dummy:Int, engine:Engine)
	{
		super(engine);
		nameMap.set("How Often", "_HowOften");
_HowOften = 0.0;
nameMap.set("Score", "_Score");
_Score = 0.0;
nameMap.set("Random_Number", "_RandomNumber");
nameMap.set("Random_Number2", "_RandomNumber2");
_RandomNumber2 = 0.0;

	}
	
	override public function init()
	{
		            _Score = asNumber(0);
propertyChanged("_Score", _Score);
    runPeriodically(1000 * 2, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        _RandomNumber2 = asNumber(randomInt(Math.floor(0), Math.floor(9)));
propertyChanged("_RandomNumber2", _RandomNumber2);
        if((_RandomNumber2 == 0))
{
            createRecycledActor(getActorType(47), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 1))
{
            createRecycledActor(getActorType(35), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 2))
{
            createRecycledActor(getActorType(55), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 3))
{
            createRecycledActor(getActorType(53), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 4))
{
            createRecycledActor(getActorType(51), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 5))
{
            createRecycledActor(getActorType(49), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 6))
{
            createRecycledActor(getActorType(45), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 7))
{
            createRecycledActor(getActorType(43), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 8))
{
            createRecycledActor(getActorType(39), 740, 180, Script.FRONT);
}

        else if((_RandomNumber2 == 9))
{
            createRecycledActor(getActorType(37), 740, 180, Script.FRONT);
}

}
}, null);
    addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void {
if(wrapper.enabled){
        g.setFont(getFont(70));
        g.drawString("" + _Score, 360, 24);
        g.setFont(getFont(85));
        g.drawString("" + getGameAttribute("Coins"), 20, 20);
}
});
    addWhenKilledListener(getActor(4), function(list:Array<Dynamic>):Void {
if(wrapper.enabled){
        if((_Score > getGameAttribute("High Score")))
{
            setGameAttribute("High Score", _Score);
            saveGame("mySave", function(success:Bool):Void {
                setGameAttribute(getGameAttribute("High Score"), (getGameAttribute("High Score")));
});
}

        setGameAttribute("Coins", (getGameAttribute("Coins") - 1));
        setGameAttribute("New Score", _Score);
        switchScene(2, null,createCrossfadeTransition((1)));
}
});
    runPeriodically(1000 * 2, function(timeTask:TimedTask):Void {
if(wrapper.enabled){
        runLater(1000 * 3, function(timeTask:TimedTask):Void {
                    _Score = asNumber((_Score + 1));
propertyChanged("_Score", _Score);
                    playSound(getSound(24));
}, null);
}
}, null);

	}	      	
	
	override public function forwardMessage(msg:String)
	{
		
	}
}