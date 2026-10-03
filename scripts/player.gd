
extends CharacterBody2D

@onready var dialogue_controller : DialogueCotroller = $DialogueSystem

const SPEED = 200
var current_dir = "none"

var can_move: bool = true

func _ready() -> void:
	$AnimatedSprite2D.play("idle_front")

func _physics_process(delta: float) -> void:
	if can_move: 
		player_movements(delta)
	


func player_movements(delta):
	
	if Input.is_action_pressed("forward"):
		current_dir = "forward"
		play_animation(1)
		velocity.y = -SPEED 
		velocity.x = 0
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		play_animation(1)
		velocity.y = SPEED 
		velocity.x = 0
	elif Input.is_action_pressed("right"):
		current_dir = "right"
		play_animation(1)
		velocity.x = SPEED 
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		play_animation(1)
		current_dir = "left"
		velocity.x = -SPEED  
		velocity.y = 0
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
	
func play_animation(movements):
	var anim = $AnimatedSprite2D
	var dir = current_dir
	
	if dir == "right":
		if movements == 1:
			anim.play("walk_right")
		elif movements == 0:
			anim.play("idle_right_side")
	
	if dir == "left":
		if movements == 1:
			anim.play("walk_left")
		elif movements == 0:
			anim.play("idle_left_side")
	
	if dir == "down":
		if movements == 1:
			anim.play("walk_down")
		elif movements == 0:
			anim.play("idle_front")
	
	if dir == "forward":
		if movements == 1:
			anim.play("walk_up")
		elif movements == 0:
			anim.play("idle_back")
