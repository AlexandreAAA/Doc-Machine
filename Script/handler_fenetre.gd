extends Node2D

@export var cable_alu : AnimatedSprite2D
@export var fil : AnimatedSprite2D
@export var ram : AnimatedSprite2D
@export var gpu : AnimatedSprite2D
@export var ventilo : AnimatedSprite2D
@export var grille : AnimatedSprite2D
@export var bouton : AnimatedSprite2D
@export var enceinte : AnimatedSprite2D
@export var dessous_de_plat : AnimatedSprite2D
@export var jack : AnimatedSprite2D

var tab_fenetre = []
func _ready() -> void:
	tab_fenetre.resize(10)
	tab_fenetre[5] = cable_alu
	tab_fenetre[9] = fil
	tab_fenetre[0] = ram
	tab_fenetre[4] = gpu
	tab_fenetre[2] = ventilo
	tab_fenetre[8] = grille
	tab_fenetre[7] = bouton
	tab_fenetre[6] = enceinte
	tab_fenetre[3] = dessous_de_plat
	tab_fenetre[1] = jack

func scale_up(choix_fenetre):
	tab_fenetre[choix_fenetre].hovering()

func scale_down(choix_fenetre):
	tab_fenetre[choix_fenetre].dehovering()
