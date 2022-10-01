Music_DevMessage: ; f6bf2
	musicheader 2, 2, Music_DevMessage_Ch2
	musicheader 1, 3, Music_DevMessage_Ch3
; f6bfb

Music_DevMessage_Ch2: ; f6bfb
	tempo 144
	volume $77
	stereopanning $f
	dutycycle $2
	loopchannel 0, Music_Mom_branch_f6c0e

Music_DevMessage_Ch3: ; f6c20
	stereopanning $f0
	notetype $6, $25
	intensity $10
	loopchannel 0, Music_Mom_branch_f6c2e