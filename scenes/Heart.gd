extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal point_get

# Called when the node enters the scene tree for the first time.
func _ready():
    $Node/AnimationPlayer.play("rotate")
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Heart_body_entered(body):
    print(body)
    emit_signal("point_get")   
    queue_free()
