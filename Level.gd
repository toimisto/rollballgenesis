extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var DIM = 2
var SAFESPACE = {}

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

func ToggleObject(object):
    if get_node(object):
        SAFESPACE[object] = get_node(object)
        remove_child(get_node(object))
        $Shinji.add_central_force(Vector3(0, 0.00000001, 0))
    else:
        add_child(SAFESPACE[object])
    
