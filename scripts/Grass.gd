extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func color(toggle):
    if toggle:
        $Sprite3D.modulate = Color(0,0.6,0,1)
    else:
        $Sprite3D.modulate = Color(1,1,1,1)