extends Spatial

#state dict
var s = {
    ground = false,
    gravity = false,
    dimension = 2,
    goal = false
   }
var help = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    return
    $Level.toggle_gravity(0)
    $Level.toggle_object("Floor")
    $Level.toggle_object("Box")
    $Level.toggle_object("Walls")
    $Level.toggle_object("Goal")
    $Level.select_dimension(s.dimension)

func on_input(input):

     match input.to_lower():
        "yes":
            $Control.output("[color=#FF0000]NO![/color]")
        "no":
            $Control.output("[color=#FF0000]yes![/color]")
        "luuranki":
            $Control.output("[color=#FF0000]oispa![/color]")
            
            
        "help":
            $Control.output(get_help())
            help += 1
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
                s["gravity"] = false
                $Level.toggle_gravity(0)
            else:
                $Control.output("Now you have a [color=#FF5500]gravity[/color]. \n Very nice.")
                s["gravity"] = true
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