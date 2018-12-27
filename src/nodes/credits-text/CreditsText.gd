extends Label

const scroll_rate = 120.0

var start_counter = 0.0

var credits = """
creikey
as
Team Lead and Programmer


Stving_artist
as
Lead Artist

Kathan ( Armagheddon )
as
Artist

ApGoldberg
as
Programmer

Nyeh Heh Heh!
by
Toby Fox

Sniper Rifle Fire
by
EMSlarma CC Attribution
Noncommercial 3.0

Sniper Rifle Click
by
Mike Koenig CC Attribution 3.0

Suspense Music provided by No Copyright Music:
https://youtu.be/iIO-6fmCS3w

Music used: Sniper Training by Tim Beek
timbeek.com

Licensed under Creative Commons Attribution 4.0
https://creativecommons.org/licenses/...
"""

func _ready():
	set_process(true)
	if credits != "":
		self.text = credits

func _process(delta):
	if start_counter < 1.0:
		start_counter += delta
		return
	rect_global_position.y -= scroll_rate*delta
	if margin_bottom <= 500:
		set_process(false)