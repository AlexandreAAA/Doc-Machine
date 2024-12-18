extends AnimatedSprite2D

@export var texture_base : Texture2D
@export var texture_hovered : Texture2D
@export var base : Sprite2D
@export var hovered : Sprite2D

func _ready() -> void:
	base.texture = texture_base
	hovered.texture = texture_hovered

func hovering():
	scale = Vector2(0.4,0.4)
	base.hide()
	hovered.show()
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "scale", Vector2(1.2,1.2),0.1)
	
func dehovering():
	scale = Vector2(0.3,0.3)
	base.show()
	hovered.hide()
	#var tweeen = get_tree().create_tween()
	#tweeen.tween_property(self, "scale", Vector2(0.3,0.3),0.1)
	
