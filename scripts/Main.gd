extends Spatial

#state dict
var s = {
    ground = false,
    gravity = 0,
    dimension = 2,
    goal = false,
    color = false,
    grass = false,
    music = false,
    walls = false,
    boxes = false,
    ramps = false,
    hearts = false,
    bridges = false
    }

var help = 0
var challenge = 0
var freedom = 0
var environment = 0

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    
    $Level.toggle_gravity(0)
    $Level.toggle_object("Floor")
    $Level.toggle_object("Boxes")
    $Level.toggle_object("Walls")
    $Level.toggle_object("Hearts")
    $Level.toggle_object("Ramps")
    $Level.toggle_object("Goal")
    $Level.toggle_object("Bridges")
    $Level.select_dimension(s.dimension)

func on_input(input):
    input = input.to_lower()
    match input:
        "yes":
            $Control.output("[color=#FF0000]NO![/color]")
        "no":
            $Control.output("[color=#FF0000]yes![/color]")
        "luuranki":
            $Control.output("[color=#FF0000]oispa![/color]")
            
            
        "help":
            $Control.output(get_help())
            help += 1
        "challenge":
            help = 0
            if challenge:
                $Control.output("Would you like to hear about [color=yellow]freedom[/color] or [color=yellow]environment[/color] instead?")
            else:
                $Control.output("[color=yellow]Challenge[/color]s are nice indeed \n ask [color=yellow]help[/color] for more information on them.")
                challenge = 1
                environment = 0
                freedom = 0
                
        "freedom":
            help = 0
            if freedom:
                $Control.output("Would you like to hear about [color=yellow]challenge[/color] or [color=yellow]environment[/color] instead?")
            else:
                $Control.output("[color=yellow]Freedom[/color] is the ability to go somewhere else. \n ask [color=yellow]help[/color] for more.")
                challenge = 0
                environment = 0
                freedom = 1     
        "environment":
            help = 0
            if environment:
                $Control.output("Would you like to hear about [color=yellow]challenge[/color] or [color=yellow]freedom[/color] instead?")
            else:
                $Control.output("[color=yellow]challenge[/color]s are nice indeed \n ask [color=yellow]help[/color] for more information on them.")
                challenge = 0
                environment = 1
                freedom = 0
            
            
        "music":
            help = 0
            if s["music"]:
                $Control.output("ssshhhhh.")
                s["music"] = false
                $AudioStreamPlayer.stop()
            else:
                $Control.output("Thank Mr. Pene.")
                s["music"] = true
                $AudioStreamPlayer.play()
        "objectives":
            help = 0
            if s["hearts"]:
                $Control.output("[color=#FF5500]Objectives[/color] removed. \n Do what ever you want")
                s["hearts"] = false
                $Level.toggle_object("Hearts")
            else:
                $Control.output("A reason to do, a reason to be")
                s["hearts"] = true
                $Level.toggle_object("Hearts")
        "walls":
            help = 0
            if s[input]:
                $Control.output("Without [color=#FF5500]walls[/color] its easier.")
                s[input] = false
                $Level.toggle_object("Walls")
            else:
                $Control.output("Now there are [color=#FF5500]walls[/color].")
                s[input] = true
                $Level.toggle_object("Walls")
        "bridges":
            help = 0
            if s[input]:
                $Control.output("I hope you wont fall")
                s[input] = false
                $Level.toggle_object("Bridges")
            else:
                $Control.output("[color=#FF5500]bridge[/color]builder 2.0")
                s[input] = true
                $Level.toggle_object("Bridges")
        "boxes":
            help = 0
            if s[input]:
                $Control.output("Out of the [color=#FF5500]boxes[/color] thinking")
                s[input] = false
                $Level.toggle_object("Boxes")
                
            else:
                $Control.output("[color=#FF5500]Boxes[/color]! Woop!\n you can push the boxes around")
                s[input] = true
                $Level.toggle_object("Boxes")
                $Level.toggle_gravity(s["gravity"])
                
        "ramps":
            help = 0
            if s[input]:
                $Control.output("I'll take the [color=#FF5500]ramps[/color] away.")
                s[input] = false
                $Level.toggle_object("Ramps")
            else:
                $Control.output("Time to fly!")
                s[input] = true
                $Level.toggle_object("Ramps")
                $Level.toggle_gravity(s["gravity"])
        "goal":
            help = 0
            if s[input]:
                $Control.output("Without a [color=#FF5500]goal[/color], life might feel empty.")
                s[input] = false
                $Level.toggle_object("Goal")
            else:
                $Control.output("Nice. Life needs [color=#FF5500]goal[/color]s!")
                s[input] = true
                $Level.toggle_object("Goal")
        "color":
            help = 0
            if s["color"]:
                $Control.output("I agree, that was bit too much.")
                s["color"] = false
                $Level.toggle_color(false)
            else:
                $Control.output("Wow. Such [color=#FF5500]color[/color]s.")
                s["color"] = true
                $Level.toggle_color(true)
        
        "grass":
            help = 0
            if s["grass"]:
                $Control.output("Good bye [color=#FF5500]grass[/color].")
                s["grass"] = false
                $Level.toggle_grass(false)
            else:
                $Control.output("The [color=#FF5500]grass[/color] tickles your body as you roll by.")
                s["grass"] = true
                $Level.toggle_grass(true)
                
        "ground":
            help = 0
            if s["ground"]:
                $Control.output("Removed [color=#FF5500]ground[/color].")
                s["ground"] = false
                $Level.toggle_object("Floor")
            else:
                $Control.output("Now you have a [color=#FF5500]ground[/color]. \n Very nice.")
                s["ground"] = true
                $Level.toggle_object("Floor")
        "gravity":
            help = 0
            if s["gravity"]:
                $Control.output("Removed [color=#FF5500]gravity[/color].")
                s["gravity"] = 0
                $Level.toggle_gravity(0)
            else:
                $Control.output("Now you have a [color=#FF5500]gravity[/color]. \n Very nice.")
                s["gravity"] = 1
                $Level.toggle_gravity(1)
        "dimension":
            help = 0
            if s["dimension"] == 2:
                $Control.output("[color=#FF5500]3D[/color].")
                s["dimension"] = 3
                $Level.select_dimension(3)
            else:
                $Control.output("[color=#FF5500]2D[/color].")
                s["dimension"] = 2
                $Level.select_dimension(2)
        "reset":
            $Control.output("[color=#FF5500]Reset[/color].")
            $Level.reset_shinji()
        "quit":
            get_tree().quit()
        _:
            $Control.output("[color=#FF0000]Nani?![/color]")
            

func get_help():
    var h = []
    if $Level.is_shinji_falling():
        h = [
            "So you fell?",
            "Wheeeee",
            "Okay. Sorry for that.\n Type [color=yellow]reset[/color] anytime to get back up!"        
        ]
        return get_helped(h)
    
    if not s["ground"] and not s["gravity"]:
        h = [
            "Don't worry, I am here to [color=yellow]help[/color] you.",
            "Ask me for anything you need!",
            "You can rotate yoursefl with arrow keys",
            "You might want to stand on something",
            "Try adding [color=#FF5500]ground[/color].",
            "Just type [color=#FF5500]ground[/color] instead of [color=yellow]help[/color]."
        ]
        return get_helped(h)
    if not s["gravity"] and s["ground"]:
        h = [
            "You might have a [color=#FF5500]ground[/color] to stand on\n but what is standing anyways?",
            "Try adding a force to pull you down.",
            "Or is it a force to pull down to you?",
            "C'mon dude.. \n Have you heard of [color=#FF5500]gravity[/color]?",
            "Okay.. float away if you want.."
        ]
        return get_helped(h)
    if s["gravity"] and not s["ground"]:
        h = [
            "uh oh. I see you added [color=#FF5500]gravity[/color] but no a [color=#FF5500]ground[/color].",
        ]
        return get_helped(h)
    if s["gravity"] and s["ground"] and s["dimension"] == 2 and not challenge and not freedom and not environment:        
        h = [
            "whoa. Now you can go anywhere we want!",
            "And with anywhere I mean left and right..",
            "What do you like? For now I can tell you about few things:\n [color=yellow]challenge[/color], [color=yellow]freedom[/color] or [color=yellow]environment[/color]",
            "Would you like to hear a [color=yellow]story[/color] instead?"
        ]
        return get_helped(h)
    if challenge and not s["goal"]:
        h = [
            "Challenges are about doing something. \n They might be easy or hard.",
            "To make a challenge: add a [color=#FF5500]goal[/color]!"
        ]
        return get_helped(h)
    if challenge and s["goal"]:
        h = [
            "Try reaching the flag!"
        ]
        if s["dimension"] == 2:
            h = ["You might not be able to reach the goal with the [color=yellow]freedom[/color] that you have."]
        return get_helped(h)
    if freedom and s["dimension"] == 2:
        h = [
            "Until now I have only quided you to restrict your [color=yellow]freedom[/color].",
            "With [color=yellow]freedom[/color] comes responsibility, I'm sure you can take it.",
            "Try adding another [color=#FF5500]dimension[/color]"
        ]
        return get_helped(h)
    if freedom and s["dimension"] == 3:
        h = [
            "Thats all the [color=yellow]freedom[/color] I can give to you.",
            "Would you like to hear about [color=yellow]challenge[/color] or [color=yellow]environment[/color] instead?"
        ]
        return get_helped(h)
    if environment:
        h = [
            "[color=yellow]Environment[/color] is all around you",
            "You can add [color=#FF5500]grass[/color] and [color=#FF5500]color[/color] to make it feel nicer",
            "Oh and there is also [color=#FF5500]music[/color]"
        ]
        return get_helped(h)
    return "Sorry I am a derp."


func get_helped(h):
    if help <= len(h) - 1:
        return h[help]
    else:
        return h[rng.randi_range(0, len(h)-1)]