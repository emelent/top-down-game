extends Node2D


func is_offscreen(rect: Rect2):
	var screen_width = get_viewport_rect().size.x
	var screen_height = get_viewport_rect().size.y

	if rect.end.x < 0 or rect.position.x > screen_width:
		return true
	if rect.end.y < 0 or rect.position.y > screen_height:
		return true

	return false
