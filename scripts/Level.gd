extends Spatial


var SAFESPACE = {}

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func select_dimension(dimension):
    if dimension == 2:
        $Shinji/Camera2D.make_current()
        $Shinji.set_axis_lock(4, 1)
    elif dimension == 3:
        $Shinji/Camera.make_current()
        $Shinji.set_axis_lock(4, 0)

func toggle_object(object):
    if get_node(object):
        SAFESPACE[object] = get_node(object)
        remove_child(get_node(object))
    else:
        add_child(SAFESPACE[object])

func toggle_gravity(gravity):
    $Shinji.set_gravity_scale(gravity)