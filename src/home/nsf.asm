LOAD:
	JMP UpdateSound

INIT:
	JMP PLAY_NSF_SOUND

PLAY:
	JSR UpdateSound
	JMP UpdateAudioScript

NSF_Music:
	LDY #0
	JSR PlayMusic
	TAY
	INY
	JMP PlayMusic

NSF_Cries:
	TAY
	JMP PlayCry

NSF_SFX:
	TAY
	JMP PlaySFX

PLAY_NSF_SOUND = NSF_Music
IFDEF PLAY_NSF_CRIES
	PLAY_NSF_SOUND = NSF_Cries
ENDIF
IFDEF PLAY_NSF_SFX
	PLAY_NSF_SOUND = NSF_SFX
ENDIF

PushLower16K:
	STA zWindow1

SwitchLower16K:
	ASL A
	ASL A
	STA $5ff8
	CLC
	ADC #1
	STA $5ff9
	ADC #1
	STA $5ffa
	ADC #1
	STA $5ffb
	RTS
