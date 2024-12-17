extends Node2D

@export var dialog : Control
@export var left_eye_sprite : AnimatedSprite2D
@export var right_eye_sprite : AnimatedSprite2D
@export var mouth_sprite : AnimatedSprite2D
@export var timer_idle : Timer
@export var timer_idle_time := 5.0
var victory_condition : Array[bool]
@export var size_victory_array := 5
var input_table : Array[bool]
@export var size_input_table := 12
var idle_dialog : Array
var idle_dialog_index = 0

func _unhandled_input(event: InputEvent) -> void:
	check_input_table(event)
	if input_table.count(true) == 0:
		print("VICTORY")
func _ready() -> void:
	for i in size_input_table:
		input_table.append(false)
	victory_condition.resize(size_victory_array)
	timer_idle.wait_time = timer_idle_time
	choose_random_input()
	for j in dialog.dialog_dico.keys():
		if str(j).get_slice("e",0) == "Idl":
			idle_dialog.append(j)
	print(input_table)

func change_sprite(le = 0,re = 0,m = 0):
	left_eye_sprite.frame = le
	right_eye_sprite.frame = re
	mouth_sprite.frame = m
	
func rotate_sprite(le_rota = left_eye_sprite.rotation,re_rota = right_eye_sprite.rotation,m_rota = mouth_sprite.rotation):
	left_eye_sprite.rotation = deg_to_rad(le_rota)
	right_eye_sprite.rotation = deg_to_rad(re_rota)
	mouth_sprite.rotation = deg_to_rad(m_rota)

func talk(key):
	dialog.set_dialog_text(key)
	

func choose_random_input():
	while input_table.count(true) != size_victory_array :
		var ran = randi_range(0,11)
		input_table[ran] = true
		
func check_input_table(event):
	if event.is_action_pressed("input1"):
		input_table[0] = false
	if event.is_action_pressed("input2"):
		input_table[1] = false
	if event.is_action_pressed("input3"):
		input_table[2] = false
	if event.is_action_pressed("input4"):
		input_table[3] = false
	if event.is_action_pressed("input5"):
		input_table[4] = false
	if event.is_action_pressed("input6"):
		input_table[5] = false
	if event.is_action_pressed("input7"):
		input_table[6] = false
	if event.is_action_pressed("input8"):
		input_table[7] = false
	if event.is_action_pressed("input9"):
		input_table[8] = false
	if event.is_action_pressed("input10"):
		input_table[9] = false
	if event.is_action_pressed("input11"):
		input_table[10] = false
	if event.is_action_pressed("input12"):
		input_table[11] = false

func _on_timer_idle_timeout() -> void:

	if idle_dialog.size() > idle_dialog_index:
		print("feur")
		dialog.set_dialog_text(idle_dialog[idle_dialog_index])
		idle_dialog_index += 1
