extends Control

var dialog_path := "res://Assets/dialog_box.txt"
var dialog_dico : Dictionary
@export var dialog_text : RichTextLabel

func _ready() -> void:
	load_file()
	set_dialog_text("complique")

func load_file():
	if not FileAccess.file_exists(dialog_path):
		return
	var file_access := FileAccess.open(dialog_path, FileAccess.READ)
	var string := file_access.get_line()
	print(string)
	while string != "":
		dialog_dico[string] = file_access.get_line()
		string = file_access.get_line()
		
	print("\t COUBEH")
	print(dialog_dico)
	file_access.close()
	
func set_dialog_text(key):
	if dialog_dico.has(key):
		dialog_text.text = str(dialog_dico[key]).get_slice("\t",1)
