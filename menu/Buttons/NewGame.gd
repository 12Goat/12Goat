extends Button

export (String) var scene_to_load

func _on_Play_pressed():
	get_tree().change_scene('res://Game/NewGame.tscn')
