class_name Reactive
extends Resource

var owner : Reactive:
	set(v):
		if owner != null:
			reactive_changed.disconnect(owner._propagate)
		owner = v
		if owner != null:
			reactive_changed.connect(owner._propagate)

signal reactive_changed(reactive)

func _init(initial_owner : Reactive = null) -> void:
	owner = initial_owner

func _propagate(_reactive : Reactive = null) -> void:
	reactive_changed.emit(self)

func manually_emit() -> void:
	reactive_changed.emit(self)