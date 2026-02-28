extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = 0
	if Input.is_key_pressed(KEY_A):
		direction = -1
	elif Input.is_key_pressed(KEY_D):
		direction = 1

	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = direction == -1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction != 0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")

	move_and_slide()
