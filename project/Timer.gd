extends Timer

var rng = RandomNumberGenerator.new()
var _timer = null
var fun_fact_list = {
	1: "Just a few months after launch, Parker Solar Probe became the closest human-made object to the sun, passing within 26.55 million miles (42.72 million kilometers) from the sun's surface.",
	2: "The Parker Solar Probe is meant to  trace the flow of energy that heats the sun's outer atmosphere.",
	3: "The PSP has been able to shed light on the sources of the solar wind, the constant flow of solar material escaping from the sun.",
	4: "Solar energetic particles can make the 93-million mile (150 million kilometer) journey to Earth in under an hours!",
	5: "The Parker Solar Probe was the first NASA mission named for a living person!",
	6: "The Parker Solar Probe has officially sampled the sun!",
	7: "While the Parker Solar Probe was headed for the Sun it flew by Venus along the way!",
	8: "The Parker Solar Probe became the fastest human-made object, reaching speeds of 153,454 miles per hour.",
	9: "On its final orbits, closest to the Sun, the spacecraft will reach speeds up to 430,000 mph. That's fast enough to travel from New York to Tokyo in less than a minute!",
	10: "The suns corona reaches millions of degrees Fahrenheit!",
	11: "The Parker Space Probes cutting-edge heat shield made of a carbon composite foam sandwiched between two carbon plates!",
	12: "The Parker Solar Probe circulates a single gallon of water through the solar arrays to keep cool!",
	13: "The Parker Solar Probe is be too far from home and too close to the Sun for us to command it in real time, thankfully this is a simulation!",
	14: "Along the edges of the heat shield’s shadow are seven sensors to detect the suns heat and adjust its rotation!",
	15: "The Parker solar probe uses wheels to orient itself!",
}


func _ready():
	_timer = Timer.new()
	add_child(_timer)

	# Set first fun fact
	_on_Timer_timeout()

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(30.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _on_Timer_timeout():
	
	rng.randomize()
	var my_random_number = floor(rng.randf_range(1, 16-0.1))
	
	get_node("FunFacts").text = fun_fact_list[int(my_random_number)]
