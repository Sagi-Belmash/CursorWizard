class_name TileObject
extends Node2D

@export var width: int = 1:
	set(value):
		width = value
		_build_box()

@export var height: int = 1:
	set(value):
		height = value
		_build_box()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_build_box()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#_build_box()
	#if Input.is_action_just_pressed("ScaleUp"):
		#v_resize(1)
	#if Input.is_action_just_pressed("ScaleDown"):
		#v_resize(-1)
		#pass

func _build_box():
	for child in get_children():
		child.queue_free()
	
	for x in range(width):
		for y in range(height):
			var TileScene = preload("res://scenes/tileScene.tscn")
			var new_tile = TileScene.instantiate()
			
			new_tile.position = Vector2(x * 16, y * -16)
			add_child(new_tile)


func h_resize(resize_Amount):
	width += resize_Amount
	
func v_resize(resize_Amount):
	height += resize_Amount
