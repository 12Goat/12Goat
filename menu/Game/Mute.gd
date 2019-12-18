extends Control

func _on_Mute_pressed():
	AudioServer.set_bus_mute(0,true)