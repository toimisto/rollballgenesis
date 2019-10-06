extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var DIM = 2

# Called when the node enters the scene tree for the first time.
func _ready():
    SelectCamera(DIM)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func SelectCamera(dimension):
    if dimension == 2:
        $Camera2D.make_current()
    elif dimension == 3:
        $Shinji/Camera.make_current()

func _on_Control_killshinji():
    if $Floor:
        get_node("Floor").queue_free()
    
