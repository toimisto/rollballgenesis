extends Spatial

#state dict
var s = {
    ground = false,
    gravity = false,
    dimension = false,
    goal = false
   }
var help = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

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
                #call for removing ground (level.remove("ground"))
            else:
                $Control.output("Now you have a [color=#FF5500]ground[/color]. \n Very nice.")
                s["ground"] = true
                #call for level.add("ground") ?
            
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