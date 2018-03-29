# Ubuntu Mouse Acceleration on 4K Monitor

Notes on setting up mouse pointer acceleration to match Mac / Windows, with 4K monitors on Ubuntu

1. Turn the mouse pointer speed way down.

2. Grab the xinput id of the mouse

```sh
$ xinput list
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ Corsair Corsair Gaming HARPOON RGB Mouse	id=11	[slave  pointer  (2)]
⎜   ↳ Corsair Corsair Gaming HARPOON RGB Mouse	id=12	[slave  pointer  (2)]
⎜   ↳ Corsair Corsair STRAFE RGB Gaming Keyboard	id=14	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳ Logitech Logitech G430 Gaming Headset   	id=10	[slave  keyboard (3)]
    ↳ Corsair Corsair STRAFE RGB Gaming Keyboard	id=13	[slave  keyboard (3)]
    ↳ Corsair Corsair Gaming HARPOON RGB Mouse	id=15	[slave  keyboard (3)]
    ↳ Corsair Corsair STRAFE RGB Gaming Keyboard	id=16	[slave  keyboard (3)]
```

Here I used ID `15`.  `11` and `12` would probably also work, but I didn't test.

3. Get the acceleration property id for the mouse:

```sh
$ xinput list-props 15
Device 'Corsair Corsair Gaming HARPOON RGB Mouse':
	Device Enabled (168):	1
	Coordinate Transformation Matrix (170):	1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
	libinput Accel Speed (302):	0.730000
	libinput Accel Speed Default (303):	0.000000
	libinput Accel Profiles Available (304):	1, 1
	libinput Accel Profile Enabled (305):	1, 0
	libinput Accel Profile Enabled Default (306):	1, 0
	libinput Natural Scrolling Enabled (307):	0
	libinput Natural Scrolling Enabled Default (308):	0
	libinput Send Events Modes Available (287):	1, 0
	libinput Send Events Mode Enabled (288):	0, 0
	libinput Send Events Mode Enabled Default (289):	0, 0
	libinput Left Handed Enabled (309):	0
	libinput Left Handed Enabled Default (310):	0
	libinput Scroll Methods Available (311):	0, 0, 1
	libinput Scroll Method Enabled (312):	0, 0, 0
	libinput Scroll Method Enabled Default (313):	0, 0, 0
	libinput Button Scrolling Button (314):	2
	libinput Button Scrolling Button Default (315):	2
	libinput Middle Emulation Enabled (316):	0
	libinput Middle Emulation Enabled Default (317):	0
	Device Node (290):	"/dev/input/event21"
	Device Product ID (291):	6940, 6972
```

Here, property ID 302 sets the acceleration speed.

4. Set the new value for acceleration speed.  The smaller the number, the faster the acceleration.

```sh
xinput set-prop 15 302 .73
```

That's it.  If it doesn't feel right, adjust by setting the mouse pointer speed from the Ubuntu Settings dialog.  Each time you change the mouse pointer speed, you'll need to re-apply the mouse acceleration on top of it, as the GUI interface seems to overwrite changes from `xinput`.  So adjust the slider, and run xinput, rinse and repeat.

