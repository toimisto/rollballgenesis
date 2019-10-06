extends RigidBody

const movementSpeed = 25

func _ready():
    set_angular_damp(1)

func _physics_process(delta):
    var xSpeed = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    var zSpeed = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
    
    var movementVec = Vector3(xSpeed, 0, zSpeed) * movementSpeed

    add_central_force(movementVec)