# Propeller Motion Shader
Another creation on my journey to learning shader programming. This shader was devised to simulate a propeller and its motion. The inspiration came from the [Archimedian Spiral](https://en.wikipedia.org/wiki/Archimedean_spiral) and some mathematics aid came from a post found in [Stack Exchange](https://gamedev.stackexchange.com/questions/188814/how-to-create-a-spiral-brightness-gradient). More information is found in the shader file itself. 

![PropForward](PropForward.gif)

## Have you ever heard of time going backwards?

The direction can be changed by adding a negative time (or subtracting time, if you will) component. This is essentially the opposite of what is seen above where the a time component is added.  

![PropBackwards](PropBackwards.gif)

## Squishing the propeller

The property _Aspect, visualized in the Inspector, can be used to zoom in or out.

![PropSquished](PropSquished.gif)

## Pseudo-randomness is quite cool

By introducing a bit of "randomness," we get this interesting effect. 

![PropRand](PropRand.gif)

## We have color!

Changing the color is as simple as modifying the .rgb of the output value. Here is color.r = 1.

![PropRed](PropRed.gif)

## Inverting colors

If we then let color = -color, we see color inversion as shown below. 

![PropIntertedColor](PropIntertedColor.gif)

## Inverting colors + randomness

What if we add randomness to it all?

![PropIntertedColorRand](PropIntertedColorRand.gif)

## Color + ramdoness

How mesmerizing, isn't it?

![PropRandBlue](PropRandBlue.gif)

## How to use:
1. Import this file (the shader) into your Unity project.
2. Attach the shader to a material.
3. Attach the material to an object.
4. Done :)




    
    
