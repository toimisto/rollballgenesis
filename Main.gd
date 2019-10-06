extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
        _:
            $Control.output("[color=#FF0000]Nani?![/color]")