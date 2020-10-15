extends Control

onready var timeBar = $Control/VBoxContainer/CategotyTitle/ProgressBar 
onready var timer = $Timer
onready var btnGrid = $Control/VBoxContainer/AnswersZone/Answers/VBoxContainer
onready var questionNumber = str(DummyServer.questionNumber)

export(int) var time = 5 setget set_time

var questions=DummyServer.questions
var answers=DummyServer.answers
var selected=[]
var rigth=false

func _ready():
	$Control/VBoxContainer/QuestionZone/Label.text=questions[questionNumber]
	for a in answers[questionNumber].size():
		var btn = btnGrid.get_child(0).duplicate()
		btn.text=answers[questionNumber][a].keys()[0].to_upper()
		btn.show()
		btnGrid.add_child(btn)
		pass
	timer.wait_time=time
	timeBar.max_value=time
	timer.start()
	
func _process(delta):
	timeBar.value=timer.time_left
	pass
	
func set_time(value):
	time = value

func _on_Timer_timeout():
	for x in btnGrid.get_children():
		x.disabled=true
	$RichTextLabel.show()
	$Control/CenterContainer/HBoxContainer/Send.disabled=true
	$Control/CenterContainer/HBoxContainer/Skip.text="Continuar"
	checkAnswer()

func _on_Send_pressed():
	checkAnswer()
	reset()
	pass

func _on_Skip_pressed():
	if $Control/CenterContainer/HBoxContainer/Skip.text=="Omitir":
		DummyServer.score[questionNumber]=rigth
	reset()

func checkAnswer():
	var trueAnswers =[]
	for btn in btnGrid.get_children():
		if btn.pressed && !selected.has(btn.text):
			selected.append(btn.text)
		elif !btn.pressed:
			selected.erase(btn.text)
			pass
	for a in answers[questionNumber].size():
		if  answers[questionNumber][a].values()[0]:
			trueAnswers.append(answers[questionNumber][a].keys()[0])
	if selected == trueAnswers:
		rigth=true
	DummyServer.score[questionNumber]=rigth
	
func reset():
	DummyServer.questionNumber=1
	if questions.size()>=DummyServer.questionNumber:
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene("res://Screens/SplashScreen.tscn")
