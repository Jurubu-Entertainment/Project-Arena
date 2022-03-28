extends Control


onready var gameplay_button : Button = $Overlay/GameplayButton
onready var gameplay_settings : Control = $Overlay/GameplaySettings
onready var audio_button : Button = $Overlay/AudioButton
onready var audio_settings : Control = $Overlay/AudioSettings
onready var video_button : Button = $Overlay/VideoButton
onready var video_settings : Control = $Overlay/VideoSettings
onready var graphics_button : Button = $Overlay/GraphicsButton
onready var graphics_settings : Control = $Overlay/GraphicsSettings
onready var interface_button : Button = $Overlay/InterfaceButton
onready var interface_settings : Control = $Overlay/InterfaceSettings
onready var controls_button : Button = $Overlay/ControlsButton
onready var controls_settings : Control = $Overlay/ControlsSettings
onready var keymapping_button : Button = $Overlay/KeymappingButton
onready var keymapping_settings : Control = $Overlay/KeymappingSettings
onready var accessibility_button : Button = $Overlay/AccessibilityButton
onready var accessibility_settings : Control = $Overlay/AccessibilitySettings


func _physics_process(_delta) -> void:
	pass


func _on_VSlider_value_changed(value):
	target.rect_position.y = value
