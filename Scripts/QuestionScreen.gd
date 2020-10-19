extends Control

onready var questionNumber = str(DummyServer.questionNumber)

var questions=DummyServer.questions
var answers=DummyServer.answers
var selected
var rigth=false

func _ready():
	print(DummyServer.score)
	$Control/VBoxContainer/QuestionZone/Label.text=questions[questionNumber]

func checkAnswer():
	for a in answers[questionNumber].size():
		if  answers[questionNumber][a].values()[0]:
			if selected == answers[questionNumber][a].keys()[0]:
				rigth=true
	DummyServer.score[questionNumber]=rigth

func reset():
	DummyServer.questionNumber=1
	if questions.size()>=DummyServer.questionNumber:
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene("res://Screens/SplashScreen.tscn")

## Signals
func _on_Send_pressed():
	if selected:
		$AudioStreamPlayer.play()
		yield($AudioStreamPlayer,"finished")
		checkAnswer()
		reset()
	pass

func _on_Skip_pressed():
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	if $Control/CenterContainer/HBoxContainer/Skip.text=="Omitir":
		DummyServer.score[questionNumber]=rigth
	reset()

func _on_BtnGrid_answer(value):
	selected=value
	pass 

func _on_ProgressBar_done():
	checkAnswer()
	pass # Replace with function body.
