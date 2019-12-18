extends Control

func _on_Sound_pressed():
	AudioServer.set_bus_mute(0,false)