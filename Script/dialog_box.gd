extends Control

var dialog_path := "res://Assets/dialog_box.txt"
var dialog_dico : Dictionary
@export var dialog_text : RichTextLabel
@export var end_rect : ColorRect
@export var end_text : RichTextLabel
@export var end_button : Button
var cd_text = 0
var index_text = 0
var has_text = false
var text_to_print = []

# temps_apparition contrôle après combien d'image la prochaine lettre du texte apparait
@export var temps_apparition := 2

signal finished_talking

func _ready() -> void:
	load_file()
	set_dialog_text("test_1")
	set_dialog_text("et la alors ?")

func _process(delta: float) -> void:
	cd_text += 1
	if cd_text % temps_apparition == 0 and has_text :
		if index_text >= text_to_print.size():
			has_text = false
			finished_talking.emit()
		if index_text < text_to_print.size():
			dialog_text.add_text(text_to_print[index_text])
			index_text += 1

func load_file():
	if not FileAccess.file_exists(dialog_path):
		return
	var file_access := FileAccess.open(dialog_path, FileAccess.READ)
	var string := file_access.get_line()
	while string != "":
		dialog_dico[string] = file_access.get_line()
		string = file_access.get_line()
	file_access.close()

func set_dialog_text(key):
	if dialog_dico.has(key):
		has_text = true
		cd_text = 0
		index_text = 0
		text_to_print.resize(0)
		dialog_text.text = ""
		for i in str(dialog_dico[key]).get_slice("\t",1):
			text_to_print.append(i)

func end_card():
	var tween = get_tree().create_tween()
	tween.tween_property(end_rect,"modulate", Color(end_rect.color,255.0),5.0)

func game_lost():
	pass
	end_card()
	end_text.text = "Le dernier ordinateur sous Windows Vista a rejoint le Cloud... Fin de la partie"
	end_button.disabled = false


func game_win():
	pass
	end_card()
	end_text.text = "BRAVO"
	end_button.disabled = false

func _on_replay_pressed() -> void:
	end_button.disabled = true
	get_tree().reload_current_scene()
