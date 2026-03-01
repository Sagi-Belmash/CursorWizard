extends CanvasLayer

var tex_default = preload("res://Assets/Sprites/cursor_arrow.svg")
var tex_resize_h = preload("res://Assets/Sprites/cursor_arrow.svg")
var tex_resize_v = preload("res://Assets/Sprites/cursor_arrow.svg")

var hot_default = Vector2(0, 0)      # Top-left for an arrow
var hot_resize_h = Vector2(16, 16)   # Center for a resize handle
var hot_resize_v = Vector2(16, 16)   # Center for a resize handle

enum State {DEFAULT, RESIZE_H, RESIZE_V}

var _cursor_state : State
var _owned_states : Array[State]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init()


# Initialize the cursor.
func init() -> void:
	Input.set_custom_mouse_cursor(tex_resize_h, Input.CURSOR_ARROW, hot_default)
	_cursor_state = State.DEFAULT
	_owned_states = [State.DEFAULT]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# Turns the cursor into the respecting state.
# If the cursor doesn't own the desired state, it returns false.
func set_cursor_state(state: State) -> bool:
	if not state in _owned_states:
		return false
	match state:
		State.DEFAULT:
			Input.set_custom_mouse_cursor(tex_default)
		State.RESIZE_H:
			Input.set_custom_mouse_cursor(tex_resize_h)
		State.RESIZE_V:
			Input.set_custom_mouse_cursor(tex_resize_v)
	_cursor_state = state
	return true


# Adds the desired state to the owned states.
func add_state(state: State):
	if state not in _owned_states:
		_owned_states.append(state)
