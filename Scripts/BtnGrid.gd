extends GridContainer
signal answer(value)
signal activate

var answers=DummyServer.answers
var questionNumber = str(DummyServer.questionNumber)

export (Vector2) var btnSize = Vector2(225,50)

var gridTheme=preload("res://Styles/GridBtns.tres")
var btnGroup = ButtonGroup.new()

func _ready():
	for a in answers[questionNumber].size():
		var btn = Button.new()
		btn.theme=gridTheme
		btn.rect_min_size=btnSize
		btn.text=answers[questionNumber][a].keys()[0]
		btn.group=btnGroup
		btn.connect("pressed",self,"btnPressed")
		add_child(btn)
		pass

func btnPressed():
	emit_signal("answer",btnGroup.get_pressed_button().text)
	pass

func _on_ProgressBar_done():
	for btn in btnGroup.get_buttons():
		for a in answers[questionNumber]:
			if a.get(btn.text):
				btn.toggle_mode=true
				btn.pressed=true
				break
			else:
				btn.focus_mode=false
				pass
	
