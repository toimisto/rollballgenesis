extends Area

func _ready():
    connect("body_entered", self, "on_body_enter")
    
func _on_body_enter(body):
    print(body)

