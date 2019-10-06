extends RigidBody

const movementSpeed = 50

func _ready():
    set_angular_damp(0.1)

func _physics_process(delta):
    var xSpeed = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    var zSpeed = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    
    var movementVec = Vector3(xSpeed, 0, zSpeed) * movementSpeed

    if get_axis_lock(4):
        zSpeed = 0
    
    
    add_torque(Vector3(-zSpeed, 0, xSpeed) * movementSpeed * -1)
    if gravity_scale != 0:
        add_central_force(movementVec)
