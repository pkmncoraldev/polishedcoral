; this file works just like 'audio/cries.asm'

; new cries spanning from gen 3 onwards

; Hoenn


Cry_Wingull:
	channel_count 3
	channel 5, Cry_Wingull_Ch5
	channel 6, Cry_Wingull_Ch6
	channel 8, Cry_Wingull_Ch8

Cry_Wingull_Ch5:
	duty_cycle_pattern 0, 1, 0, 3
	square_note 8, 8, 2, 1373
	square_note 2, 9, 2, 1373
	square_note 8, 11, 2, 1388
	square_note 12, 4, 2, 1388
	square_note 4, 9, 2, 1437
	square_note 16, 11, 2, 1450
	sound_ret

Cry_Wingull_Ch6:
	duty_cycle_pattern 0, 3, 0, 1
	square_note 8, 12, 2, 1600
	square_note 2, 13, 2, 1644
	square_note 8, 15, 2, 1655
	square_note 12, 5, 5, 1655
	square_note 4, 13, 2, 1651
	square_note 16, 15, 2, 1655
	sound_ret

Cry_Wingull_Ch8:
	noise_note 8, 8, 2, 136
	noise_note 2, 5, 2, 136
	noise_note 8, 8, 3, 136
	noise_note 2, 5, 2, 136
	noise_note 8, 8, 3, 136
	sound_ret

Cry_Pelipper:
	channel_count 3
	channel 5, Cry_Pelipper_Ch5
	channel 6, Cry_Pelipper_Ch6
	channel 8, Cry_Pelipper_Ch8

Cry_Pelipper_Ch5:
	duty_cycle_pattern 2, 0, 0, 1
	square_note 9, 15, 5, 1370
	square_note 4, 14, 3, 1370
	square_note 1, 13, 3, 1489
	square_note 1, 14, 3, 1493
	square_note 9, 15, 1, 1495
	sound_ret

Cry_Pelipper_Ch6:
	duty_cycle_pattern 1, 1, 0, 0
	square_note 9, 6, 5, 870
	square_note 4, 6, 3, 870
	square_note 6, 5, 3, 1073
	square_note 9, 3, 1, 1092
	sound_ret
	
Cry_Pelipper_Ch8:
	noise_note 9, 5, 5, 34
	noise_note 4, 3, 3, 34
	noise_note 6, 0, 3, 34
	noise_note 9, 5, 1, 34
	sound_ret

Cry_Shroomish:
	channel_count 3
	channel 5, Cry_Shroomish_Ch5
	channel 6, Cry_Shroomish_Ch6
	channel 8, Cry_Shroomish_Ch8

Cry_Shroomish_Ch5:
	duty_cycle_pattern 0, 1, 0, 0
	square_note 3, 15, -1, 1688
	square_note 6, 15, 1, 1700
	square_note 15, 15, 0, 1677
	square_note 15, 13, 0, 1677
	square_note 5, 12, 0, 1677
	square_note 1, 0, 0, 1677
	sound_ret

Cry_Shroomish_Ch6:
	duty_cycle_pattern 0, 2, 0, 0
	square_note 3, 6, -1, 1020
	square_note 6, 5, 6, 1020
	square_note 5, 7, 5, 1277
	square_note 4, 6, 4, 1277
	square_note 12, 4, 0, 1277
	square_note 2, 0, 0, 1277
	sound_ret

Cry_Shroomish_Ch8:
	noise_note 7, 10, 5, 13
	noise_note 15, 5, 4, 15
	sound_ret

Cry_Breloom:
	channel_count 3
	channel 5, Cry_Breloom_Ch5
	channel 6, Cry_Breloom_Ch6
	channel 8, Cry_Breloom_Ch8

Cry_Breloom_Ch5:
	duty_cycle_pattern 1, 0, 3, 0
	square_note 3, 13, -1, 1737
	square_note 5, 15, 3, 1744
	square_note 15, 15, 0, 1677
	square_note 3, 14, 0, 1677
	square_note 3, 14, 0, 1673
	square_note 1, 0, 0, 1677
	sound_ret

Cry_Breloom_Ch6:
	duty_cycle_pattern 3, 0, 1, 2
	square_note 3, 7, -1, 1020
	square_note 5, 6, 6, 1020
	square_note 5, 6, 5, 1411
	square_note 4, 5, 4, 1404
	square_note 11, 5, 0, 1411
	square_note 2, 0, 0, 1411
	sound_ret

Cry_Breloom_Ch8:
	noise_note 8, 11, 5, 2
	noise_note 15, 10, 7, 3
	sound_ret

Cry_Aron:
	channel_count 3
	channel 5, Cry_Aron_Ch5
	channel 6, Cry_Aron_Ch6
	channel 8, Cry_Aron_Ch8

Cry_Aron_Ch5:
	duty_cycle_pattern 0, 1, 2, 3
	square_note 8, 15, 1, 1892
	square_note 8, 14, 1, 1892
	square_note 8, 14, 1, 1888
	square_note 16, 14, 0, 1883
	square_note 3, 14, 7, 1881
	square_note 8, 0, 1, 1881
	sound_ret

Cry_Aron_Ch6:
	duty_cycle_pattern 2, 2, 2, 2
	square_note 16, 12, 3, 1890
	square_note 8, 12, 1, 1886
	square_note 16, 11, 0, 1881
	square_note 3, 8, 7, 1885
	square_note 8, 0, 1, 1885
	sound_ret

Cry_Aron_Ch8:
	noise_note 10, 10, 0, 10
	noise_note 16, 8, 2, 48
	sound_ret

Cry_Lairon:
	channel_count 3
	channel 5, Cry_Lairon_Ch5
	channel 6, Cry_Lairon_Ch6
	channel 8, Cry_Lairon_Ch8

Cry_Lairon_Ch5:
	duty_cycle_pattern 1, 1, 1, 0
	square_note 16, 11, 0, 1890
	square_note 5, 10, 1, 1890
	square_note 12, 11, 1, 1865
	square_note 14, 12, 2, 1894
	square_note 5, 11, 1, 1894
	square_note 10, 12, 1, 1852
	square_note 10, 11, 1, 1847
	square_note 8, 10, 1, 1843
	square_note 8, 9, 1, 1843
	square_note 8, 9, 1, 1840
	square_note 16, 8, 1, 1837
	sound_ret

Cry_Lairon_Ch6:
	duty_cycle_pattern 0, 0, 1, 0
	square_note 16, 15, 0, 1892
	square_note 5, 14, 1, 1892
	square_note 12, 14, 1, 1868
	square_note 14, 15, 2, 1896
	square_note 5, 14, 1, 1896
	square_note 10, 15, 1, 1855
	square_note 10, 14, 1, 1850
	square_note 8, 13, 1, 1845
	square_note 8, 12, 1, 1845
	square_note 8, 12, 1, 1842
	square_note 16, 12, 1, 1838
	sound_ret

Cry_Lairon_Ch8:
	noise_note 10, 15, 0, 54
	noise_note 8, 13, 4, 55
	noise_note 10, 12, 0, 54
	noise_note 15, 9, 0, 56
	noise_note 8, 9, 1, 56
	sound_ret

Cry_Aggron:
	channel_count 3
	channel 5, Cry_Aggron_Ch5
	channel 6, Cry_Aggron_Ch6
	channel 8, Cry_Aggron_Ch8

Cry_Aggron_Ch5:
	duty_cycle_pattern 0, 0, 1, 0
	square_note 14, 15, 0, 1877
	square_note 3, 14, 5, 1849
	square_note 3, 14, 5, 1845
	square_note 16, 15, 0, 1877
	square_note 6, 15, 5, 1879
	square_note 16, 15, 2, 1877
	sound_ret

Cry_Aggron_Ch6:
	duty_cycle_pattern 1, 1, 1, 0	
	square_note 7, 10, 0, 1851
	square_note 7, 8, 0, 1849
	square_note 3, 8, 5, 1822
	square_note 3, 9, 5, 1818
	square_note 16, 9, 0, 1851
	square_note 4, 8, 5, 1854
	square_note 16, 7, 5, 1851
	square_note 5, 9, 1, 1834
	sound_ret

Cry_Aggron_Ch8:
	noise_note 10, 12, 0, 55
	noise_note 8, 11, 4, 54
	noise_note 15, 12, 0, 55
	noise_note 15, 11, 0, 55
	noise_note 15, 10, 3, 71
	sound_ret

Cry_Meditite:
        channel_count 3
        channel 5, Cry_Meditite_Ch5
        channel 6, Cry_Meditite_Ch6
	channel 8, Cry_Meditite_Ch8

Cry_Meditite_Ch5:
	duty_cycle_pattern 1, 1, 1, 3
	pitch_offset 255
	sound_jump Cry_Meditite_Ch6.body

Cry_Meditite_Ch6:
	duty_cycle_pattern 1, 2, 3, 0
.body:
	square_note 4, 11, 2, 1335
	square_note 4, 5, 1, 1335
	square_note 4, 11, 2, 1383
	square_note 4, 5, 1, 1383
	square_note 4, 11, 2, 1428
	square_note 3, 5, 1, 1428
	square_note 4, 10, 2, 1478
	square_note 2, 5, 1, 1478
	square_note 4, 8, 2, 1531
	square_note 2, 3, 1, 1531
	square_note 4, 6, 2, 1534
	sound_ret

Cry_Meditite_Ch8:
	noise_note 2, 15, 0, 79
	noise_note 1, 0, 1, 51
	noise_note 2, 15, 0, 78
	noise_note 1, 0, 1, 51
	noise_note 2, 15, 0, 78
	noise_note 1, 0, 1, 51
	noise_note 1, 15, 0, 77
	noise_note 1, 0, 1, 51
	noise_note 1, 12, 0, 77
	noise_note 1, 0, 1, 51
	noise_note 1, 5, 3, 77
	sound_ret

Cry_Medicham:
        channel_count 3
        channel 5, Cry_Medicham_Ch5
        channel 6, Cry_Medicham_Ch6
	channel 8, Cry_Medicham_Ch8

Cry_Medicham_Ch5:
	duty_cycle_pattern 1, 1, 1, 3
.loop1:
	square_note 6, 9, 1, 1350
	square_note 6, 9, 1, 1346
	square_note 5, 8, 1, 1396
	sound_loop 2, .loop1
	square_note 6, 8, 1, 1402
	square_note 6, 7, 1, 1459
	square_note 6, 6, 1, 1477
	sound_ret

Cry_Medicham_Ch6:
	duty_cycle_pattern 2, 2, 3, 1
.loop1:
	square_note 6, 15, 1, 1534
	square_note 6, 15, 1, 1536
	square_note 5, 15, 1, 1534
	sound_loop 2, .loop1
	square_note 6, 14, 1, 1534
	square_note 6, 12, 1, 1536
	square_note 3, 7, 1, 1534
	sound_ret

Cry_Medicham_Ch8:
.loop1:
	noise_note 3, 11, 1, 93
	noise_note 1, 8, 1, 52
	sound_loop 7, .loop1
	noise_note 3, 9, 1, 93
	noise_note 8, 2, 7, 4
	sound_ret


Cry_Carvanha:
        channel_count 3
        channel 5, Cry_Carvanha_Ch5
	channel 6, Cry_Carvanha_Ch6
	channel 8, Cry_Carvanha_Ch8

Cry_Carvanha_Ch5:
	duty_cycle_pattern 0, 0, 3, 0
	square_note 3, 10, 1, 300
	square_note 1, 0, 2, 300
	square_note 6, 15, 5, 1378
	square_note 1, 9, 1, 1317
	square_note 1, 9, 1, 1327
	square_note 2, 7, 1, 1314
	sound_ret

Cry_Carvanha_Ch6:
	duty_cycle_pattern 1, 0, 3, 0
	square_note 4, 0, 2, 1300
	square_note 2, 10, 1, 1300
	square_note 2, 8, 1, 1140
	square_note 6, 8, 2, 1020
	sound_ret

Cry_Carvanha_Ch8:
	noise_note 5, 10, 1, 0x48
	noise_note 1, 9, -3, 0x11
	noise_note 4, 12, -3, 0x0c
	noise_note 16, 11, 2, 0x0d
	sound_ret

Cry_Sharpedo:
        channel_count 3
        channel 5, Cry_Sharpedo_Ch5
	channel 6, Cry_Sharpedo_Ch6
	channel 8, Cry_Sharpedo_Ch8

Cry_Sharpedo_Ch5:
	duty_cycle_pattern 0, 2, 3, 1
	square_note 8, 13, 1, 300
	square_note 4, 0, 2, 300
	square_note 8, 11, 4, 657
	square_note 7, 12, 4, 700
	square_note 5, 12, 2, 776
	square_note 4, 14, 2, 1212
	square_note 8, 13, 1, 900
	sound_ret

Cry_Sharpedo_Ch6:
	duty_cycle_pattern 1, 1, 1, 3
	square_note 8, 13, 2, 1020
	square_note 4, 0, 2, 1020
	square_note 16, 12, 4, 1300
	square_note 4, 10, 4, 1300
	square_note 4, 8, 3, 1789
	square_note 4, 7, 2, 1665
	sound_ret

Cry_Sharpedo_Ch8:
	noise_note 7, 10, -3, 0x7a
	noise_note 2, 4, 2, 0x7a
	noise_note 2, 8, -3, 0x46
	noise_note 1, 10, -5, 0x36
	noise_note 1, 10, -5, 0x78
.loop1:
	noise_note 2, 13, 1, 0x36
	noise_note 1, 15, 0, 0x78
	noise_note 1, 14, 1, 0x36
	noise_note 1, 13, 0, 0x78
	sound_loop 4, .loop1
	noise_note 4, 9, 0, 0x7a
	noise_note 2, 7, 1, 0x7b
	sound_ret

Cry_Numel:
        channel_count 3
        channel 5, Cry_Numel_Ch5
	channel 6, Cry_Numel_Ch6
	channel 8, Cry_Numel_Ch8

Cry_Numel_Ch5:
	duty_cycle_pattern 0, 1, 3, 0
	square_note 16, 0, -1, 1503
	square_note 16, 0, -1, 1300
	square_note 16, 0, -1, 1500
	square_note 4, 0, 1, 1500
	sound_ret

Cry_Numel_Ch6:
	duty_cycle_pattern 0, 1, 3, 0
	square_note 16, 0, -1, 1813
	square_note 16, 0, -1, 1730
	square_note 16, 0, -1, 1809
	square_note 4, 0, 1, 1808
	sound_ret

Cry_Numel_Ch8:
	noise_note 8, 5, -1, 0x79
	noise_note 8, 5, -1, 0x46
	noise_note 8, 5, -1, 0x79
	noise_note 4, 0, 1, 0x79
	sound_ret

Cry_Camerupt:
        channel_count 3
        channel 5, Cry_Camerupt_Ch5
	channel 6, Cry_Camerupt_Ch6
	channel 8, Cry_Camerupt_Ch8

Cry_Camerupt_Ch5:
	duty_cycle_pattern 0, 2, 0, 2
	square_note 4, 0, -1, 1429
	square_note 12, 4, 0, 1429
	square_note 6, 4, 4, 1426
	square_note 6, 0, -1, 1429
	square_note 4, 6, 3, 1421
	sound_ret

Cry_Camerupt_Ch6:
	duty_cycle_pattern 1, 2, 0, 0
	square_note 4, 0, -1, 1118
	square_note 12, 4, 0, 1112
	square_note 6, 4, 4, 1123
	square_note 5, 0, -1, 1048
	square_note 3, 6, 3, 1032
	sound_ret

Cry_Camerupt_Ch8:
	noise_note 16, 9, -1, 0x46
	noise_note 2, 10, 4, 0x46
	noise_note 12, 10, 4, 0x45
	noise_note 16, 9, -1, 0x54
	noise_note 2, 8, 4, 0x54
	noise_note 3, 12, 0, 0x46
	noise_note 8, 9, 1, 0x45
	sound_ret

; Sinnoh

Cry_Leafeon:
        channel_count 3
        channel 5, Cry_Leafeon_Ch5
        channel 6, Cry_Leafeon_Ch6
	channel 8, Cry_Leafeon_Ch8

Cry_Leafeon_Ch5:
	duty_cycle_pattern 1, 1, 1, 0
	square_note 2, 13, -5, 1600
	square_note 1, 14, 4, 1726
	square_note 3, 15, 7, 1894
	square_note 1, 14, 0, 1890
	square_note 1, 13, 0, 1886
	square_note 1, 13, 0, 1882
	square_note 1, 12, 0, 1877
	square_note 1, 14, 0, 1877
	square_note 1, 9, 0, 1873
	square_note 1, 7, 0, 1869
	square_note 2, 5, 2, 1862
	sound_ret

Cry_Leafeon_Ch6:
	duty_cycle_pattern 0, 0, 1, 0
	square_note 2, 7, -8, 1798
	square_note 1, 6, 4, 1798
	square_note 2, 7, 4, 1858
	square_note 16, 8, 5, 1860
	sound_ret

Cry_Leafeon_Ch8:
.loop1:
	noise_note 4, 5, 5, 145
	noise_note 1, 3, 3, 214
	noise_note 3, 4, 3, 213
	noise_note 6, 3, 7, 212
	sound_loop 2, .loop1
	noise_note 4, 3, 5, 145
	noise_note 2, 4, 3, 214
	noise_note 4, 3, 5, 212
	sound_ret

Cry_Glaceon:
	channel_count 2
	channel 5, Cry_Glaceon_Ch5
	channel 6, Cry_Glaceon_Ch6

Cry_Glaceon_Ch5:
	duty_cycle_pattern 2, 2, 2, 1
	square_note 3, 12, -3, 1856
	square_note 2, 14, 3, 1860
	square_note 5, 13, -3, 1833
	square_note 1, 14, -3, 1856
	square_note 1, 15, 0, 1860
	square_note 1, 13, 0, 1859
	square_note 1, 12, 0, 1864
	square_note 1, 9, 0, 1888
	square_note 1, 10, 0, 1920
	square_note 2, 12, 4, 1931
	pitch_sweep 3, -7	
	square_note 10, 8, 6, 1931
	pitch_sweep 8, 8
	sound_ret

Cry_Glaceon_Ch6:
	duty_cycle_pattern 0, 0, 2, 2
	square_note 2, 8, 2, 1924
	square_note 2, 8, 7, 1966
	square_note 3, 8, 7, 1958
	square_note 1, 0, 7, 1930
	square_note 5, 8, 3, 1930
	square_note 1, 0, 7, 1930
	square_note 1, 8, 7, 1924
	square_note 1, 8, 7, 1940
	square_note 3, 8, 2, 1958
	square_note 2, 8, 3, 1957
	square_note 7, 8, 2, 1946
	sound_ret


; Unova

Cry_Drilbur:
        channel_count 3
        channel 5, Cry_Drilbur_Ch5
	channel 6, Cry_Drilbur_Ch6
        channel 8, Cry_Drilbur_Ch8

Cry_Drilbur_Ch5:
	duty_cycle_pattern 0, 0, 1, 1
	square_note 1, 10, 0, 1584
	square_note 5, 15, 2, 1589
	square_note 2, 0, 1, 1589
	square_note 3, 11, 0, 1589
	square_note 5, 15, 2, 1584
	square_note 5, 0, 1, 1584
	pitch_sweep 7, 7
	square_note 6, 4, -1, 1580	
.loop1:
	square_note 1, 15, 0, 1700
	pitch_sweep 8, 8
	square_note 1, 14, 0, 1702
	sound_loop 4, .loop1
	pitch_sweep 3, -7
	square_note 11, 14, 7, 1700
	pitch_sweep 7, 7
	square_note 10, 6, 7, 1536
	pitch_sweep 8, 8
	sound_ret

Cry_Drilbur_Ch6:
	duty_cycle_pattern 0, 0, 2, 1
	square_note 8, 7, 3, 1450
	square_note 14, 7, 3, 1424
	square_note 4, 6, 4, 1417
	square_note 9, 7, 7, 1424	
	sound_ret

Cry_Drilbur_Ch8:
	noise_note 5, 10, 5, 92
	noise_note 5, 15, 5, 21
	noise_note 5, 10, 5, 92
	noise_note 12, 14, 5, 21
	noise_note 3, 8, -1, 31
	noise_note 15, 5, 5, 31
	sound_ret

Cry_Excadrill:
        channel_count 3
        channel 5, Cry_Excadrill_Ch5
	channel 6, Cry_Excadrill_Ch6
        channel 8, Cry_Excadrill_Ch8

Cry_Excadrill_Ch5:
	duty_cycle_pattern 0, 2, 0, 2
	square_note 1, 12, 0, 1400
	square_note 6, 15, 2, 1410
	square_note 2, 0, 1, 1410
	square_note 3, 13, 0, 1343
	square_note 8, 15, 1, 1355
	square_note 2, 13, 0, 1237
	square_note 3, 13, 0, 1230
	square_note 2, 15, 0, 1224
	square_note 2, 15, 0, 1221
	square_note 2, 14, 0, 1224
	square_note 2, 12, 0, 1221
	square_note 2, 12, 0, 1224
	square_note 16, 10, 2, 1233
	sound_ret

Cry_Excadrill_Ch6:
	duty_cycle_pattern 0, 0, 1, 2
	square_note 1, 8, 0, 1584
	square_note 6, 10, 2, 1589
	square_note 2, 0, 1, 1589
	square_note 3, 8, 0, 1533
	square_note 8, 10, 1, 1538
	square_note 2, 9, 0, 1466
	square_note 3, 9, 0, 1466
	square_note 2, 8, 0, 1453
	square_note 2, 9, 0, 1453
	square_note 2, 9, 0, 1445
	square_note 2, 8, 0, 1459
	square_note 2, 7, 0, 1466
	square_note 16, 7, 2, 1466
	sound_ret

Cry_Excadrill_Ch8:	
	noise_note 8, 10, 5, 244
	noise_note 8, 15, 5, 234
	noise_note 16, 11, 6, 244
	noise_note 8, 14, 5, 234
	noise_note 6, 10, 5, 244
	noise_note 8, 8, 0, 230
	noise_note 16, 6, 7, 231
	sound_ret



; Kalos

Cry_Sylveon:
        channel_count 3
        channel 5, Cry_Sylveon_Ch5
	channel 6, Cry_Sylveon_Ch6
        channel 8, Cry_Sylveon_Ch8

Cry_Sylveon_Ch5:
        duty_cycle_pattern 0, 0, 0, 0
	pitch_sweep 7, 7
	square_note 2, 14, -3, 1920
	pitch_sweep 8, 8
	square_note 3, 15, 5, 1952
	pitch_sweep 5, -7
	square_note 4, 12, 4, 1952
	pitch_sweep 8, 8
	square_note 2, 14, 0, 1854
	square_note 2, 14, 0, 1857
	pitch_sweep 7, 7
	square_note 5, 15, -8, 1857
	pitch_sweep 8, 8	
	square_note 7, 12, 1, 1933
        sound_ret

Cry_Sylveon_Ch6:
	duty_cycle_pattern 0, 1, 1, 0
	square_note 2, 11, -3, 1933
	square_note 9, 15, 5, 2000
	square_note 7, 8, 4, 1951
        sound_ret

Cry_Sylveon_Ch8:
        noise_note 12, 9, 0, 24
	noise_note 12, 0, -5, 17
	noise_note 16, 4, 0, 17
	noise_note 16, 4, 0, 18
	noise_note 8, 4, 0, 19
	noise_note 14, 4, 6, 19
        sound_ret

Cry_Noibat:
	channel_count 2
	channel 5, Cry_Noibat_Ch5
	channel 6, Cry_Noibat_Ch6

Cry_Noibat_Ch5:
	duty_cycle_pattern 0, 0, 3, 1
	square_note 10, 12, 1, 1792
	square_note 10, 13, 1, 1768
	square_note 11, 13, 1, 1780
	square_note 13, 14, 1, 1828
	square_note 2, 0, 1, 1828
	square_note 8, 14, 1, 1839
	square_note 2, 0, 1, 1839
	square_note 4, 12, 1, 1839
	square_note 4, 14, 1, 1841
	square_note 4, 11, 1, 1839
	square_note 4, 13, 1, 1841
	square_note 4, 11, 1, 1837
	square_note 4, 13, 1, 1839
	square_note 4, 11, 1, 1837
	square_note 4, 13, 1, 1839
	square_note 1, 8, 2, 1826
	square_note 2, 9, 1, 1828
	square_note 2, 10, 1, 1831
	square_note 1, 8, 2, 1826
	square_note 2, 9, 1, 1828
	square_note 2, 8, 1, 1831
	sound_ret

Cry_Noibat_Ch6:
	duty_cycle_pattern 2, 2, 3, 2
	square_note 6, 10, 1, 966
	square_note 4, 0, 1, 966
	square_note 10, 10, 1, 1565
	square_note 11, 7, 1, 978
	square_note 13, 0, 1, 978
	square_note 12, 0, 1, 978
	square_note 4, 4, 0, 1822
	square_note 4, 4, 0, 1820
	square_note 4, 4, 0, 1822
	square_note 4, 4, 0, 1820
	square_note 4, 3, 0, 1822
	square_note 4, 3, 0, 1820
	square_note 4, 2, 0, 1822
	square_note 4, 2, 1, 1820
	square_note 4, 4, 0, 1811
	square_note 4, 4, 2, 1811
	sound_ret

Cry_Noivern:
	channel_count 3
	channel 5, Cry_Noivern_Ch5
	channel 6, Cry_Noivern_Ch6
	channel 8, Cry_Noivern_Ch8

Cry_Noivern_Ch5:
	duty_cycle_pattern 0, 1, 0, 0
	square_note 1, 12, 0, 1768
	square_note 1, 11, 1, 1749
	square_note 1, 10, 1, 1744
	square_note 1, 11, 1, 1749
	square_note 1, 12, 1, 1756
	square_note 1, 13, 1, 1800
	square_note 1, 13, 1, 1833
	square_note 5, 15, 1, 1871
	square_note 3, 14, 1, 1873
	square_note 7, 13, 1, 1871
	square_note 1, 12, 1, 1833
	square_note 1, 11, 1, 1769
	square_note 4, 11, 5, 1755
	square_note 4, 0, 1, 1755
	square_note 3, 13, 1, 1855
	square_note 4, 14, 0, 1866
	square_note 1, 0, 1, 1866
	square_note 1, 14, 0, 1874
	square_note 2, 14, 0, 1877
	square_note 4, 15, 1, 1880
	square_note 1, 0, 1, 1880
.loop1:
	square_note 1, 14, 0, 1867
	square_note 2, 14, 0, 1870
	square_note 4, 15, 1, 1874
	square_note 1, 0, 1, 1874
	sound_loop 2, .loop1
.loop2:
	square_note 1, 14, 0, 1857
	square_note 2, 14, 0, 1861
	square_note 4, 15, 1, 1865
	square_note 1, 0, 1, 1865
	sound_loop 2, .loop2
.loop3:
	square_note 1, 13, 0, 1844
	square_note 2, 13, 0, 1849
	square_note 4, 14, 1, 1854
	square_note 1, 0, 1, 1854
	sound_loop 2, .loop3
	square_note 1, 11, 1, 1840
	square_note 2, 11, 1, 1844
	square_note 4, 12, 1, 1847
	sound_ret

Cry_Noivern_Ch6:
	duty_cycle_pattern 1, 0, 0, 3
	square_note 1, 6, 0, 1766
	square_note 1, 5, 1, 1747
	square_note 1, 5, 1, 1742
	square_note 1, 5, 1, 1747
	square_note 1, 5, 1, 1754
	square_note 1, 5, 1, 1798
	square_note 1, 5, 1, 1831
	square_note 5, 6, 1, 1869
	square_note 3, 6, 1, 1871
	square_note 7, 6, 1, 1869
	square_note 1, 5, 1, 1831
	square_note 1, 5, 1, 1767
	square_note 4, 4, 5, 1753
	square_note 4, 0, 1, 1753
	square_note 3, 5, 1, 1853
	square_note 4, 5, 0, 1864
	square_note 1, 0, 1, 1864
	square_note 1, 4, 0, 1872
	square_note 2, 5, 0, 1875
	square_note 4, 6, 1, 1878
	square_note 1, 0, 1, 1878
.loop1:
	square_note 1, 4, 0, 1865
	square_note 2, 5, 0, 1868
	square_note 4, 6, 1, 1872
	square_note 1, 0, 1, 1872
	sound_loop 2, .loop1
.loop2:
	square_note 1, 4, 0, 1855
	square_note 2, 5, 0, 1859
	square_note 4, 6, 1, 1863
	square_note 1, 0, 1, 1863
	sound_loop 2, .loop2
.loop3:
	square_note 1, 4, 0, 1842
	square_note 2, 5, 0, 1847
	square_note 4, 5, 1, 1852
	square_note 1, 0, 1, 1852
	sound_loop 2, .loop3
	square_note 1, 3, 1, 1838
	square_note 2, 4, 1, 1842
	square_note 4, 4, 1, 1845
	sound_ret

Cry_Noivern_Ch8:
	noise_note 15, 6, 5, 234
	noise_note 4, 5, 3, 234
.loop1:
	noise_note 5, 10, 1, 80
	noise_note 1, 0, 1, 80
	sound_loop 7, .loop1
	sound_ret


; Alola


; Galar


; Paldea
	