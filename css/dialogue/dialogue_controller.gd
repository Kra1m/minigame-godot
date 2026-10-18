class_name DialogueCotroller
extends Node

var current_dialogue: Dialogue

@onready var dialogue_screen : Panel = $"../CanvasLayer/DialoguePanel"

@onready var npc_name_text : Label = $"../CanvasLayer/DialoguePanel/NPC_name"
@onready var npc_dialogue_text: Label = $"../CanvasLayer/DialoguePanel/Dialogue"

@onready var player: CharacterBody2D = $".."

var visible_chars: float
var current_line: int

#@export var TESTING: Dialogue 

func _ready() -> void:
	close_dialogue()
	#set_dialogue(TESTING)
	
func set_dialogue (dialogue: Dialogue):
	current_dialogue = dialogue
	
	player.can_move = false
	
	dialogue_screen.visible = true
	
	npc_name_text.text = dialogue.npc_name
	
	current_line = 0
	set_line(dialogue.lines[0])
	
func _process(delta: float) -> void:
	visible_chars += 30 * delta
	npc_dialogue_text.visible_characters = int(visible_chars)
	
	if not current_dialogue:
		return
	
	if Input.is_action_just_pressed("interact"):
		if len(current_dialogue.lines) == current_line + 1:
			close_dialogue()
		else:
			current_line += 1
			set_line(current_dialogue.lines[current_line])
	
func set_line(line: String):
	visible_chars = 0
	npc_dialogue_text.visible_characters = 0
	npc_dialogue_text.text = line
	
func close_dialogue():
	dialogue_screen.visible = false
	current_dialogue = null
	player.can_move = true
	
