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
                $Control.output("[color=#FF5500]Boxes[/color]! Woop!/n you can push the boxes around")
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
    if not s["ground"]:
        h = [
            "Don't worry, I am here to [color=yellow]help[/color] you.",
            "Ask me for anything you need!",
            "You might want to stand on something",
            "Try adding [color=#FF5500]ground[/color]."
        ]
        return get_helped(h)


func get_helped(h):
    if help <= len(h) - 1:
        return h[help]
    else:
        return h[rng.randi_range(0, len(h)-1)]