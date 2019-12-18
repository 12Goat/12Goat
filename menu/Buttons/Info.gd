extends Button

export (String) var scene_to_load

func _on_Info_pressed():
	get_tree().change_scene('res://Game/Info.tscn')