extends Label
var count = 0
var drawTextSpeed:int = 0
#the speed txt is drawn
var chatterLimit: int =56
#lmit of charchters allowed in box
#var chatList: Array = []
#called when the node enters the scene tree for the first time
func _ready():
	#self.text = chatList
	#changes dialog boxes text
	pass
func _showChatter():
	if drawTextSpeed < chatterLimit:
		drawTextSpeed += 1
		self.visible_characters = drawTextSpeed
		#this prints out chat dialog one char. at a timee
		pass
func _process(delta):
	_showChatter()
	pass
	


func _on_Button_pressed():
	#when button pressed it counts the dialog
	count+=1
	#dialog arrays
	var array = ["Such a nice day at the park.", "I wonder what the vibe is like right now.", "oh no siri says the vibe is bad!"]
	
	#printing dialog
	if count ==1:
		get_parent().get_node("dialogBox").text = array[0]
	#printing dialog
	if count == 2:
		get_parent().get_node("dialogBox").text = array[1]
	if count == 2:
		get_parent().get_node("dialogBox").text = array[2]

	
