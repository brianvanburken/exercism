
class SpaceAge(object):
    def __init__(self, seconds):
        yearInSecondsOnEarth = 31557600
        self.seconds = seconds
        self.calculated = {
            'earth':    round(seconds / yearInSecondsOnEarth /   1.0,        2),
            'jupiter':  round(seconds / yearInSecondsOnEarth /  11.8626150,  2),
            'mars':     round(seconds / yearInSecondsOnEarth /   1.88081580, 2),
            'mercury':  round(seconds / yearInSecondsOnEarth /   0.24084670, 2),
            'neptune':  round(seconds / yearInSecondsOnEarth / 164.79132,    2),
            'saturn':   round(seconds / yearInSecondsOnEarth /  29.447498,   2),
            'uranus':   round(seconds / yearInSecondsOnEarth /  84.016846,   2),
            'venus':    round(seconds / yearInSecondsOnEarth /   0.61519726, 2),
        }

    def on_earth(self):
        return self.calculated.get('earth')

    def on_jupiter(self):
        return self.calculated.get('jupiter')

    def on_mars(self):
        return self.calculated.get('mars')

    def on_mercury(self):
        return self.calculated.get('mercury')

    def on_neptune(self):
        return self.calculated.get('neptune')

    def on_saturn(self):
        return self.calculated.get('saturn')

    def on_uranus(self):
        return self.calculated.get('uranus')

    def on_venus(self):
        return self.calculated.get('venus')
