extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fadeaway = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if $Output.modulate.a < 1 and not fadeaway:
        $Output.modulate.a += 0.01
    elif $Output.modulate.a > 0 and fadeaway:
        $Output.modulate.a -= 0.005
    pass
#

func _on_Input_text_entered(new_text):
    $Output.clear()
    $Output.text = " "
    $Output.modulate.a = 0
    $FadeTimer.start()
    fadeaway = false
    match new_text.to_lower():
        "yes":
            $Output.append_bbcode("[color=#FF0000]NO![/color]")
        "no":
            $Output.append_bbcode("[color=#FFFF00]Yes![/color]")
        _:
            $Output.append_bbcode("[color=#88ffffff]Nani!?[/color]")
    $Output.margin_top = 320 + (4-$Output.get_line_count())*48
    $Input.text =""


func _on_FadeTimer_timeout():
    fadeaway = true
