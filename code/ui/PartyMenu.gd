class_name PartyMenu
extends Control

var selected_hero : ReactiveObject = ReactiveObject.new(null)

func _ready() -> void:
    %list_available.selection = selected_hero
    %list_hired.selection = selected_hero

    State.available_heroes.reactive_changed.connect(func(reactive): %list_available.rebuild_from_list(reactive.value, selected_hero.value))
    State.hired_heroes.reactive_changed.connect(func(reactive): %list_hired.rebuild_from_list(reactive.value, selected_hero.value))

    %edit_name.text_changed.connect(func(text): selected_hero.value.name.value = text)
    
    %button_hire.pressed.connect(func(): 
        State.available_heroes.erase(selected_hero.value)
        State.hired_heroes.append(selected_hero.value)
    )

    %button_remove.pressed.connect(func(): 
        State.hired_heroes.erase(selected_hero.value)
        State.available_heroes.append(selected_hero.value)
    )

    selected_hero.reactive_changed.connect(func(reactive):
        var caret = %edit_name.caret_column
        %edit_name.text = reactive.value.name.value if reactive.value != null else ""
        %edit_name.caret_column = caret
        %edit_name.editable = reactive.value != null

        if reactive.value != null:
            %label_stre.text = str(reactive.value.strength.value).pad_zeros(2)
            %label_wisd.text = str(reactive.value.wisdom.value).pad_zeros(2)
            %label_agil.text = str(reactive.value.agility.value).pad_zeros(2)
            %label_luck.text = str(reactive.value.luck.value).pad_zeros(2)
            %label_dext.text = str(reactive.value.dexterity.value).pad_zeros(2)
            %label_vita.text = str(reactive.value.vitality.value).pad_zeros(2)
        %panel_info.modulate.a = 1 if reactive.value else 0

        %button_hire.disabled = reactive.value == null or not reactive.value in State.available_heroes.value
        %button_remove.disabled = reactive.value == null or not reactive.value in State.hired_heroes.value
    )

    State.available_heroes.manually_emit()
    State.hired_heroes.manually_emit()
    selected_hero.value = null