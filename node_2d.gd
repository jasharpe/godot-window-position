extends Node2D

@export var fix: bool

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var toggle_fix: Button = $Control/ToggleFix

func _ready() -> void:
	toggle_fix.toggled.connect(func(on: bool) -> void:
		fix = on
		toggle_fix.text = "FIX IS ON" if on else "FIX IS OFF"
	)
	toggle_fix.set_pressed_no_signal(fix)
	toggle_fix.text = "FIX IS ON" if fix else "FIX IS OFF"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fix:
		var window = get_viewport() as Window
		window.position = DisplayServer.window_get_position(window.get_window_id())
	sprite_2d.global_position = get_global_mouse_position()
