extends RigidBody

const movementSpeed = 25

func _ready():
    pass

func _physics_process(delta):
    var xSpeed = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    var zSpeed = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    
    if get_parent().get_parent().s.dimension == 2:
        set_axis_lock(4, 1)
    
    var movementVec = Vector3(xSpeed, 0, zSpeed) * movementSpeed

    add_central_force(movementVec)