package ui;

import flixel.graphics.FlxGraphic;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.ui.FlxVirtualPad;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

// copyed from flxvirtualpad
class Hitbox extends FlxSpriteGroup
{
    public var hitbox:FlxSpriteGroup;

    var sizex:Int = 320;

    var screensizey:Int = 720;

    var frameshb:FlxAtlasFrames;

    public var buttonLeft:FlxButton;
    public var buttonDown:FlxButton;
    public var buttonUp:FlxButton;
    public var buttonRight:FlxButton;

    public var buttonLeft2:FlxButton;
    public var buttonDown2:FlxButton;
    public var buttonRight2:FlxButton;
    public var buttonUp2:FlxButton;

    public var buttonSpace:FlxButton;
    
    public function new(type:HitboxType = DEFAULT)
    {
        super();

        trace(type);

        //add graphic
        hitbox = new FlxSpriteGroup();
        hitbox.scrollFactor.set();
        
        var hitbox_hint:FlxSprite = new FlxSprite(0, 0);
        hitbox_hint.alpha = 0.3;
        add(hitbox_hint);

        buttonLeft = new FlxButton(0, 0);
        buttonDown = new FlxButton(0, 0);
        buttonUp = new FlxButton(0, 0);
        buttonRight = new FlxButton(0, 0);

        buttonLeft2 = new FlxButton(0, 0);
        buttonDown2 = new FlxButton(0, 0);
        buttonRight2 = new FlxButton(0, 0);
        buttonUp2 = new FlxButton(0, 0);
    
        buttonSpace = new FlxButton(0, 0);

        switch (type){
            case NINE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox9k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox9k.png', 'assets/shared/images/hitbox/hitbox9k.xml');
                sizex = 98;

                hitbox.add(add(buttonLeft = createhitbox(0, "k1"))); 
                hitbox.add(add(buttonDown = createhitbox(sizex, "k2")));
                hitbox.add(add(buttonUp = createhitbox(sizex * 2, "k3"))); 
                hitbox.add(add(buttonRight = createhitbox(sizex * 3, "k4")));    
                
                hitbox.add(add(buttonDown2 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(buttonLeft2 = createhitbox(sizex * 5, "k6"))); 

                hitbox.add(add(buttonSpace = createhitbox(sizex * 6, "k7")));
                
                hitbox.add(add(buttonRight2 = createhitbox(sizex * 7, "k8")));
                hitbox.add(add(buttonUp2 = createhitbox(sizex * 8,    "k9"))); 

            }
			case EIGHT:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox8k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox8k.png', 'assets/shared/images/hitbox/hitbox8k.xml');
                sizex = 98;

                hitbox.add(add(buttonLeft = createhitbox(0, "k1"))); 
                hitbox.add(add(buttonDown = createhitbox(sizex, "k2")));
                hitbox.add(add(buttonUp = createhitbox(sizex * 2, "k3"))); 
                hitbox.add(add(buttonRight = createhitbox(sizex * 3, "k4")));    
                
                hitbox.add(add(buttonDown2 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(buttonLeft2 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(buttonRight2 = createhitbox(sizex * 6, "k7")));
                hitbox.add(add(buttonUp2 = createhitbox(sizex * 7,    "k8"))); 

            }
            case SEVEN:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox7k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox7k.png', 'assets/shared/images/hitbox/hitbox7k.xml');
                sizex = 182;
                
                hitbox.add(add(buttonLeft = createhitbox(0, "k1"))); 
                hitbox.add(add(buttonUp = createhitbox(sizex, "k2")));
                hitbox.add(add(buttonRight = createhitbox(sizex * 2, "k3"))); 
                
                hitbox.add(add(buttonSpace = createhitbox(sizex * 3, "k4")));    
                
                hitbox.add(add(buttonLeft2 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(buttonDown2 = createhitbox(sizex * 5, "k6"))); 
                hitbox.add(add(buttonRight2 = createhitbox(sizex * 6, "k7")));
            }
            case SIX:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox6k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox6k.png', 'assets/shared/images/hitbox/hitbox6k.xml');
                sizex = 213;
                
                hitbox.add(add(buttonLeft = createhitbox(0, "k1"))); 
                hitbox.add(add(buttonUp = createhitbox(sizex, "k2")));
                hitbox.add(add(buttonRight = createhitbox(sizex * 2, "k3"))); 

                hitbox.add(add(buttonLeft2 = createhitbox(sizex * 3, "k4")));    
                hitbox.add(add(buttonDown2 = createhitbox(sizex * 4, "k5")));
                hitbox.add(add(buttonRight2 = createhitbox(sizex * 5, "k6"))); 
            }
			case ONE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox1k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox1k.png', 'assets/shared/images/hitbox/hitbox1k.xml');
                sizex = 1280;

                hitbox.add(add(buttonSpace = createhitbox(0, "k1")));
            }
			case TWO:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox2k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox2k.png', 'assets/shared/images/hitbox/hitbox2k.xml');
                sizex = 640;

                hitbox.add(add(buttonLeft = createhitbox(0, "k1")));
				hitbox.add(add(buttonRight = createhitbox(sizex, "k2")));
            }
			case THREE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox3k_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox3k.png', 'assets/shared/images/hitbox/hitbox3k.xml');
                sizex = 426;

                hitbox.add(add(buttonLeft = createhitbox(0, "k1")));
				hitbox.add(add(buttonSpace = createhitbox(sizex, "k3")));
				hitbox.add(add(buttonRight = createhitbox(sizex * 2, "k2")));
            }
			case FIVE:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
                sizex = 256;

                hitbox.add(add(buttonLeft = createhitbox(0, "left")));
                hitbox.add(add(buttonDown = createhitbox(sizex, "down")));
				hitbox.add(add(buttonSpace = createhitbox(sizex * 2 "k3")));
                hitbox.add(add(buttonUp = createhitbox(sizex * 3, "up")));
                hitbox.add(add(buttonRight = createhitbox(sizex * 4, "right")));    
            }
            default:
            {
                hitbox_hint.loadGraphic('assets/shared/images/hitbox/hitbox_hint.png');

                frameshb = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
                sizex = 320;

                hitbox.add(add(buttonLeft = createhitbox(0, "left")));
                hitbox.add(add(buttonDown = createhitbox(sizex, "down")));
                hitbox.add(add(buttonUp = createhitbox(sizex * 2, "up")));
                hitbox.add(add(buttonRight = createhitbox(sizex * 3, "right")));    
            }
        }
    }

    public function createhitbox(X:Float, framestring:String) {
        var button = new FlxButton(X, 0);
        
        var graphic:FlxGraphic = FlxGraphic.fromFrame(frameshb.getByName(framestring));

        button.loadGraphic(graphic);

        button.alpha = 0;

    
        button.onDown.callback = function (){
            FlxTween.num(0, 0.75, .075, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        };

        button.onUp.callback = function (){
            FlxTween.num(0.75, 0, .1, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }
        
        button.onOut.callback = function (){
            FlxTween.num(button.alpha, 0, .2, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        return button;
    }

    override public function destroy():Void
        {
            super.destroy();
    
            buttonLeft = null;
            buttonDown = null;
            buttonUp = null;
            buttonRight = null;
        }
}

enum HitboxType {
    DEFAULT;
    SIX;
    SEVEN;
    EIGHT;
	NINE;
	ONE;
	TWO;
	THREE;
	FIVE;
}

/*if (widghtScreen == null)
widghtScreen = FlxG.width;*/