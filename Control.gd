extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fadeaway = false

signal killshinji

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
    $Input.text =""
    get_parent().on_input(new_text)
    



func output(text):
    $Output.clear()
    $Output.text = " "
    $Output.modulate.a = 0
    $FadeTimer.start()
    fadeaway = false
    $Output.append_bbcode(text)
    $Output.margin_top = 320 + (4-$Output.get_line_count())*48
    



func _on_FadeTimer_timeout():
    fadeaway = true
