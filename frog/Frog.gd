extends KinematicBody2D

var velocity = Vector2()
export var GRAVITY = 200.0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y += GRAVITY * delta
	var motion = velocity * delta
	move(motion)