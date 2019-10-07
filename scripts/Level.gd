extends Spatial

export (PackedScene) var Grass

var SAFESPACE = {}
var grasses = []



# Called when the node enters the scene tree for the first time.
func _ready():
    SAFESPACE["Shinji"] = $Shinji.get_global_transform()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func toggle_grass(toggle):
    if toggle:
        for i in range(500):
            var grass = Grass.instance()
            add_child(grass)
            grasses.append(grass)
            grass.set_global_transform(Transform(Vector3(1,0,0),Vector3(0,1,0),Vector3(0,0,1),Vector3(randf()*150-75,0,randf()*150-75)))
    else:
        for grass in grasses:
            remove_child(grass)

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

func toggle_color(color):
    if color:
        $Floor/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(0,0.8,0,1)
        $Walls/wall/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(0.7,0,0,1)
        $Box/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(0.67,0.54,0.18,1)
        $Shinji/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(.5,0,1,1)
        $Goal/Flag1.mesh.surface_get_material(0).albedo_color = Color(1,0,1,1)
        $Goal/Flag2.mesh.surface_get_material(0).albedo_color = Color(1,0,1,1)
        $Goal/Flag3.mesh.surface_get_material(0).albedo_color = Color(1,0,1,1)
        $Goal/Flag4.mesh.surface_get_material(0).albedo_color = Color(1,0,1,1)
        $Goal/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(.2,.2,.2,1)
        $WorldEnvironment.environment.background_color = Color(.6,.6,1,1)
    else:
        $Floor/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Walls/wall/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Box/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Shinji/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Goal/Flag1.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Goal/Flag2.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Goal/Flag3.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Goal/Flag4.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $Goal/MeshInstance.mesh.surface_get_material(0).albedo_color = Color(1,1,1,1)
        $WorldEnvironment.environment.background_color = Color(1,1,1,1)

func toggle_gravity(gravity):
    $Shinji.set_gravity_scale(gravity)

func reset_shinji():
    $Shinji.set_global_transform(SAFESPACE["Shinji"])
    $Shinji.set_angular_velocity(Vector3(0, 0, 0))
    $Shinji.set_linear_velocity(Vector3(0, 0, 0))

func _on_Goal_body_entered(body):
    print("testi")
