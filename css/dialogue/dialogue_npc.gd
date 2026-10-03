extends Node2D
class_name DialogueNPC


@export var dialogue: Dialogue
@onready var interactable : InteractableObject = $chat_detection

func _ready() -> void:
	interactable.interact = on_interact


func on_interact (player : CharacterBody2D):
	player.dialogue_controller.set_dialogue(dialogue)
