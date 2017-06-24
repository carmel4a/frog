extends KinematicBody2D

var velocity = Vector2()
export var GRAVITY = 200.0
enum state {IDLE, AIM, JUMP, FLY}
var current_state = state.IDLE
var jumpVector = Vector2()

# signals
signal jump

func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	velocity.y += GRAVITY * delta
	if current_state == state.JUMP:
		velocity += jumpVector.normalized() * 250 * delta
		current_state = state.FLY
	var motion = velocity * delta
	move(motion)
	
func _input(event):
	if event.type == InputEvent.SCREEN_DRAG and event.index == 0:
		if current_state == state.IDLE:
			jumpVector = Vector2() + (event.pos + event.relative_pos) - event.relative_pos
			current_state = state.AIM
			
		if current_state == state.AIM:
			jumpVector += (event.pos + event.relative_pos) - event.relative_pos
			
		elif current_state == state.FLY:
			pass # ignore
			
	else: # no event
		if current_state == state.AIM:
			current_state == state.JUMP