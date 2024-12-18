extends Node2D

@export var dialog : Control
@export var left_eye_sprite : AnimatedSprite2D
@export var right_eye_sprite : AnimatedSprite2D
@export var mouth_sprite : AnimatedSprite2D
@export var timer_idle : Timer
@export var timer_idle_time := 5.0
var victory_condition : Array[bool]
var input_table : Array[bool]
@export var size_input_table := 12
@export var nb_victory_condition := 5
var idle_dialog : Array
var idle_dialog_index = 0

func _unhandled_input(event: InputEvent) -> void:
	check_input_table(event)
	if input_table.count(true) == 0:
		print("VICTORY")

func _ready() -> void:
	for i in size_input_table:
		input_table.append(false)
	victory_condition.resize(size_input_table)
	timer_idle.wait_time = timer_idle_time
	choose_random_input()
	victory_condition = input_table
	for j in dialog.dialog_dico.keys():
		if str(j).get_slice("e",0) == "Idl":
			idle_dialog.append(j)
	print(input_table)
	print(victory_condition)

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
	print(victory_condition)

func choose_random_input():
	while input_table.count(true) != nb_victory_condition :
		var ran = randi_range(0,size_input_table - 1)
		input_table[ran] = true
		
func check_input_table(event):
	if event.is_action_pressed("ram"):
		input_table[0] = false
		if victory_condition[0] :
			talk("GoodRam")
		else:
			talk("BadRam")
	if event.is_action_pressed("jack"):
		input_table[1] = false
		print(victory_condition[1])
		if victory_condition[1] :
			print("COUBEH")
			talk("GoodJack")
		else:
			talk("BadJack")
	if event.is_action_pressed("ventilo"):
		input_table[2] = false
		print(victory_condition[2])
		if victory_condition[2] :
			talk("GoodVentilo")
		else:
			talk("BadVentilo")
	if event.is_action_pressed("dessous_de_plat"):
		input_table[3] = false
		if victory_condition[3] :
			talk("GoodDessous_de_plat")
		else:
			talk("BadDessous_de_plat")
	if event.is_action_pressed("gpu"):
		input_table[4] = false
		if victory_condition[4] :
			talk("GoodGpu")
		else:
			talk("BadGpu")
	if event.is_action_pressed("cable_alu"):
		input_table[5] = false
		if victory_condition[5] :
			talk("GoodCable_alu")
		else:
			talk("BadCable_alu")
	if event.is_action_pressed("enceinte"):
		input_table[6] = false
		if victory_condition[6] :
			talk("GoodEnceinte")
		else:
			talk("BadEnceinte")
	if event.is_action_pressed("bouton"):
		input_table[7] = false
		if victory_condition[7] :
			talk("GoodBouton")
		else:
			talk("BadBouton")
	if event.is_action_pressed("fil"):
		input_table[8] = false
		if victory_condition[8] :
			talk("GoodFil")
		else:
			talk("BadFil")
	if event.is_action_pressed("grille"):
		input_table[9] = false
		if victory_condition[9] :
			talk("GoodGrille")
		else:
			talk("BadGrille")


func _on_timer_idle_timeout() -> void:

	if idle_dialog.size() > idle_dialog_index:
		print("feur")
		dialog.set_dialog_text(idle_dialog[idle_dialog_index])
		idle_dialog_index += 1
