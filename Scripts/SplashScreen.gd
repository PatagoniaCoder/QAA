extends Control

onready var textEdit =$Thanks/VBoxContainer/TextEdit setget setText, getText

func _ready():
	if DummyServer.score.size()>0:
		$Cuestion.hide()
		$Thanks.show()

func _on_Button1_pressed():
	$AudioStreamPlayer.play()
	$Cuestion.hide()
	$Explanation.show()

func _on_Button2_pressed():
	$AudioStreamPlayer.play()
	get_tree().change_scene("res://Screens/QuestionScreen.tscn")

func _on_Button3_pressed():
	DummyServer
	pass # Replace with function body.

func _on_TextEdit_text_changed():
	var text = getText()
	setText(text)
	if getText()!="":
		$Thanks/VBoxContainer/Button3.disabled=false
	else:
		$Thanks/VBoxContainer/Button3.disabled=true
	pass # Replace with function body.

func setText(value):
	textEdit.text=""
	textEdit.insert_text_at_cursor(value.to_upper())
	pass

func getText():
	return textEdit.text
