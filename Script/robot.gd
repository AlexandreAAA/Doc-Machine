extends Node2D

@export var dialog : Control
@export var left_eye_sprite : AnimatedSprite2D
@export var right_eye_sprite : AnimatedSprite2D
@export var mouth_sprite : AnimatedSprite2D
@export var timer_idle : Timer
@export var timer_transi_end : Timer
@export var timer_idle_time := 5.0
@export var fenetre_handler : Node2D
var victory_condition : Array[bool]
var input_table : Array[bool]
var once_dialog_array : Array[bool]
@export var size_input_table := 12
@export var nb_victory_condition := 5
var idle_dialog : Array
var idle_dialog_index = 0
var win_achieved = false
var twist = false
var end_game = false

var goodending2 = false
var goodending3 = false
var goodendingfin = false

func _unhandled_input(event: InputEvent) -> void:
	check_input_table(event)
	if check_victory() :
		win_achieved = true

func _ready() -> void:
	dialog.finished_talking.connect(end_text_ending.bind())
	for i in size_input_table:
		input_table.append(false)
	victory_condition.resize(size_input_table)
	once_dialog_array.resize(size_input_table)
	timer_idle.wait_time = timer_idle_time
	choose_random_input()
	for k in size_input_table :
		victory_condition[k] = input_table[k]
		once_dialog_array[k] = true
	for j in dialog.dialog_dico.keys():
		if str(j).get_slice("e",0) == "Idl":
			idle_dialog.append(j)
	print(input_table)
	print(victory_condition)
	
func _process(delta: float) -> void:
	if dialog.has_text == false and win_achieved and !end_game:
		ending(true)

func change_sprite(le = 0,re = 0,m = 0):
	left_eye_sprite.frame = le
	right_eye_sprite.frame = re
	mouth_sprite.frame = m
	
func rotate_sprite(le_rota = left_eye_sprite.rotation,re_rota = right_eye_sprite.rotation,m_rota = mouth_sprite.rotation):
	left_eye_sprite.rotation = deg_to_rad(0)
	right_eye_sprite.rotation = deg_to_rad(0)
	mouth_sprite.rotation = deg_to_rad(0)	
	left_eye_sprite.rotation = deg_to_rad(le_rota)
	right_eye_sprite.rotation = deg_to_rad(re_rota)
	mouth_sprite.rotation = deg_to_rad(m_rota)

func talk(key):
	dialog.set_dialog_text(key)
	timer_idle.stop()
	print(victory_condition)

func choose_random_input():
	while input_table.count(true) != nb_victory_condition :
		var ran = randi_range(0,size_input_table - 1)
		input_table[ran] = true
		
func check_input_table(event):
	if event.is_action_pressed("ram"):
		fenetre_handler.scale_up(0)
		if !dialog.has_text:
			if once_dialog_array[0]:
				once_dialog_array[0] = false
				input_table[0] = false
				if victory_condition[0] :
					change_sprite(4,4,2)
					rotate_sprite(0,0,0)
					talk("GoodRam")
				else:
					change_sprite(5,5,4)
					rotate_sprite(0,0,0)
					talk("BadRam")
	if event.is_action_released("ram"):
		fenetre_handler.scale_down(0)
	if event.is_action_pressed("jack"):
		fenetre_handler.scale_up(1)
		if !dialog.has_text:
			if once_dialog_array[1]:
				once_dialog_array[1] = false
				input_table[1] = false
				if victory_condition[1] :
					print("COUBEH")
					rotate_sprite(0,0,180)
					change_sprite(15,15,9)
					talk("GoodJack")
				else:
					rotate_sprite(0,0,180)
					change_sprite(6,7,7)
					talk("BadJack")
	if event.is_action_released("jack"):
		fenetre_handler.scale_down(1)
	if event.is_action_pressed("ventilo"):
		fenetre_handler.scale_up(2)
		if !dialog.has_text:
			if once_dialog_array[2]:
				once_dialog_array[2] = false
				input_table[2] = false
				if victory_condition[2] :
					rotate_sprite(0,0,0)
					change_sprite(11,10,2)
					talk("GoodVentilo")
				else:
					rotate_sprite(0,0,0)
					change_sprite(13,13,1)
					talk("BadVentilo")
	if event.is_action_released("ventilo"):
		fenetre_handler.scale_down(2)
	if event.is_action_pressed("dessous_de_plat"):
		fenetre_handler.scale_up(3)
		if !dialog.has_text:
			if once_dialog_array[3]:
				once_dialog_array[3] = false
				input_table[3] = false
				if victory_condition[3] :
					change_sprite(4,4,3)
					rotate_sprite(180,180,0)
					talk("GoodDessous_de_plat")
				else:
					change_sprite(3,3,2)
					talk("BadDessous_de_plat")
	if event.is_action_released("dessous_de_plat"):
		fenetre_handler.scale_down(3)
	if event.is_action_pressed("gpu"):
		fenetre_handler.scale_up(4)
		if !dialog.has_text:
			if once_dialog_array[4]:
				once_dialog_array[4] = false
				input_table[4] = false
				if victory_condition[4] :
					change_sprite(14,14,4)
					rotate_sprite(0,0,180)
					talk("GoodGpu")
				else:
					rotate_sprite(0,0,0)
					change_sprite(16,16,2)
					talk("BadGpu")
	if event.is_action_released("gpu"):
		fenetre_handler.scale_down(4)
	if event.is_action_pressed("cable_alu"):
		fenetre_handler.scale_up(5)
		if !dialog.has_text:
			if once_dialog_array[5]:
				once_dialog_array[5] = false
				input_table[5] = false
				if victory_condition[5] :
					change_sprite(4,4,9)
					rotate_sprite(0,0,180)
					talk("GoodCable_alu")
				else:
					change_sprite(4,4,3)
					rotate_sprite(180,180,0)
					talk("BadCable_alu")
	if event.is_action_released("cable_alu"):
		fenetre_handler.scale_down(5)
	if event.is_action_pressed("enceinte"):
		fenetre_handler.scale_up(6)
		if !dialog.has_text:
			if once_dialog_array[6]:
				once_dialog_array[6] = false
				input_table[6] = false
				if victory_condition[6] :
					rotate_sprite(0,0,0)
					change_sprite(1,2,0)
					talk("GoodEnceinte") #garder les mains
				else:
					rotate_sprite(0,0,0)
					change_sprite(1,2,8)
					talk("BadEnceinte") #espagnol
	if event.is_action_released("enceinte"):
		fenetre_handler.scale_down(6)
	if event.is_action_pressed("bouton"):
		fenetre_handler.scale_up(7)
		if !dialog.has_text:
			if once_dialog_array[7]:
				once_dialog_array[7] = false
				input_table[7] = false
				if victory_condition[7] :
					change_sprite(12,12,9)
					rotate_sprite(0,0,180)
					talk("GoodBouton")
				else:
					rotate_sprite(0,0,0)
					change_sprite(10,11,5)
					talk("BadBouton")
	if event.is_action_released("bouton"):
		fenetre_handler.scale_down(7)
	if event.is_action_pressed("fil"):
		fenetre_handler.scale_up(8)
		if !dialog.has_text:
			if once_dialog_array[8]:
				once_dialog_array[8] = false
				input_table[8] = false
				if victory_condition[8] :
					rotate_sprite(0,0,0)
					change_sprite(15,15,0)
					talk("GoodFil") #doigté
				else:
					rotate_sprite(0,0,0)
					change_sprite(5,5,4)
					talk("BadFil") #faux contact
	if event.is_action_released("fil"):
		fenetre_handler.scale_down(8)
	if event.is_action_pressed("grille"):
		fenetre_handler.scale_up(9)
		if !dialog.has_text:
			if once_dialog_array[9]:
				once_dialog_array[9] = false
				input_table[9] = false
				if victory_condition[9] :
					change_sprite(12,12,4)
					rotate_sprite(0,0,180)
					talk("GoodGrille") #chatouille gratouille
				else:
					change_sprite(14,14,3)
					rotate_sprite(0,0,180)
					talk("BadGrille") #plafond
	if event.is_action_released("grille"):
		fenetre_handler.scale_down(9)

func check_victory() -> bool:
	if input_table.count(true) == 0:
		return true
	return false

func ending(twis  = false) :
	twist = twis
	end_game = true
	talk("BadEnding")
	
func end_text_ending():
	if end_game and goodendingfin != true:
		if goodending2 :
			timer_transi_end.start(2)
		timer_transi_end.start()
	if !end_game:
		timer_idle.start()
		
func _on_timer_idle_timeout() -> void:
	if idle_dialog.size() > idle_dialog_index:
		dialog.set_dialog_text(idle_dialog[idle_dialog_index])
		idle_dialog_index += 1

func _on_timer_transi_end_timeout() -> void:
	if twist :
		#BONNE FIN
		if goodending3:
			talk("GoodEnding3")
			goodendingfin = true
		elif goodending2:
			talk("GoodEnding2")
			goodending3 = true
		else :
			talk("GoodEnding1")
			goodending2 = true
	else :
		#MAUVAISE FIN
		pass
