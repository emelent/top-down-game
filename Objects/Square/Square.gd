tool
extends Node2D


export(float) var width = 10 setget set_width
export(float) var height = 10 setget set_height
export(Color) var color = Color.white setget set_color
export(float) var line_width = 1.0 setget set_line_width
export(bool) var outline = false setget set_outline

func _draw():
	var pos = -Vector2(width / 2.0, height/ 2.0)
	draw_rect(Rect2(pos, Vector2(width, height)), color, !outline, line_width)

func set_color(new_color):
	color = new_color
	update()

func set_width(new_width):
	width = new_width
	update()

func set_height(new_height):
	height = new_height
	update()

func set_line_width(new_line_width):
	line_width = abs(new_line_width)
	if outline:
		update()

func set_outline(new_outline):
	outline = new_outline
	update()
