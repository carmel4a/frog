tool
extends Node2D

export var polygon = Vector2Array([])
export var lenght = 200
export var width = 100
export var e_width = 150
export var e_lenght = 150

func _ready():
	
	polygon = Vector2Array([\
	Vector2(0,round(width/2)),
	Vector2(lenght,round(width/2)),
	Vector2(lenght,round(e_width/2)),
	Vector2(lenght+e_lenght,0),
	Vector2(lenght,round(-e_width/2)),
	Vector2(lenght,round(-width/2)),
	Vector2(0,round(-width/2)),
	])
	get_node("Polygon2D").set_polygon(polygon)