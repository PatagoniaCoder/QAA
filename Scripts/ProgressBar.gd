extends TextureProgress

signal done

export(int) var time = 5

func _ready():
	max_value = time
	value=time
func _process(delta):
	value-=delta
	if value<=0:
		emit_signal("done")
		set_process(false)
	pass

