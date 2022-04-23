extends Node2d

onready var target :Node2d= null
onready var object :Node2d=null

export var threshold :=1.0
export var global:= true
export var follow_x:= true
export var follow_y := true

var _delta:=0.0
func _process(delta):
    _delta = delta
  move_and_slide()

func follow():
    if target != null and object != null:
        var path = target.position-object.position
        if path.length >threshold:
            move()

func move(direction:=VECTOR2.ONE):
    if object !=null:
        if object is RigidBody2d:
            object.linear_velocity = direction
        elif object is kinematicbody2d:
            object.move_and_slide(direction)
        else:
            object.position += direction*_delta
