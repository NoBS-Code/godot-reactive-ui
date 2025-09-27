class_name ReactiveArray
extends Reactive

var value : Array:
	set(v):
		value = v
		reactive_changed.emit(self)
		return value

func _init(initial_value : Array = []) -> void:
	value = initial_value

func get_at(i : int) -> Variant:
	return value[i]

func set_at(i : int, v : Variant) -> void:
	value[i] = v
	reactive_changed.emit(self)

func append(v : Variant) -> void:
	value.append(v)
	reactive_changed.emit(self)

func append_array(array : Array) -> void:
	value.append_array(array)
	reactive_changed.emit(self)

func assign(array : Array) -> void:
	value.assign(array)
	reactive_changed.emit(self)

func clear() -> void:
	value.clear()
	reactive_changed.emit(self)

func erase(v : Variant) -> void:
	value.erase(v)
	reactive_changed.emit(self)

func insert(position : int, v : Variant) -> void:
	value.insert(position, v)
	reactive_changed.emit(self)

func pop_at(index : int) -> Variant:
	var tmp = value.pop_at(index)
	reactive_changed.emit(self)
	return tmp

func pop_back() -> Variant:
	var tmp = value.pop_back()
	reactive_changed.emit(self)
	return tmp

func pop_front() -> Variant:
	var tmp = value.pop_front()
	reactive_changed.emit(self)
	return tmp

func push_back(v : Variant) -> void:
	append(v)

func remove_at(index : int) -> void:
	value.remove_at(index)
	reactive_changed.emit(self)

func shuffle() -> void:
	value.shuffle()
	reactive_changed.emit(self)

func sort() -> void:
	value.sort()
	reactive_changed.emit(self)

func sort_custom(callable : Callable) -> void:
	value.sort_custom(callable)
	reactive_changed.emit(self)
