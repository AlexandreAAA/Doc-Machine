extends Node2D

@export var dialog : Control
@export var left_eye_sprite : AnimatedSprite2D
@export var right_eye_sprite : AnimatedSprite2D
@export var mouth_sprite : AnimatedSprite2D



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
	
