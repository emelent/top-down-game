extends Node

func _input(event):
    if event.is_action_pressed("quit") and OS.is_debug_build():
        get_tree().quit()
