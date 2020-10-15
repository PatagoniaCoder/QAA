extends Node


var questions={
	"1": "¿Cual es el idioma mas hablado en Suiza?",
	"2": "¿Que pais esta entre Peru y Colombia?",
	"3": "¿Cual es el rio mas largo de Europa Occidental?",
	"4": "¿Que lago bania la ciudad de Ginebra?",
	"5": "¿En que pais europeo se habla el magyar?",
	"6": "¿Que palabra significa 'hijo de' en los apellidos escoceses?",
	"7": "¿Cual es la capital de Indonesia?",
	"8": "¿En que pais se encuentra el pico Aconcagua?",
	"9": "¿En que hemisferio se encuentra Jamaica?",
	"10": "¿A que pais pertenece la isla de Creta?",
	}
var answers={
	"1": [{"Aleman":true},{"Sueco":false},{"Ingles":false},{"Gallego":false}],
	"2": [{"Ecuador":true},{"BAHAMAS":false},{"BAHRÉIN":false},{"CABO VERDE":false},{"CAMBOYA":false},{"CAMERÚN":false}],
	"3": [{"Rin":true}],
	"4": [{"El lago Leman":true}],
	"5": [{"Hungria":true}],
	"6": [{"Mac":true}],
	"7": [{"Jakarta":true}],
	"8": [{"Argentina":true}], 
	"9": [{"Norte":true}], 
	"10": [{"Grecia":true}],
}
var questionNumber=1 setget setqnum,getqnum
var score={} setget setScore
var observations

func setScore(value):
	score=value
	
func getqnum():
	return questionNumber
	
func setqnum(value):
	questionNumber+=value
