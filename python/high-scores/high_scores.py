class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def highest(self):
        return max(self.scores)

    def latest(self):
        return self.scores[-1]

    def report(self):
        latest = f"Your latest score was {self.latest()}."
        if self.latest() == self.highest():
            return f"{latest} That's your personal best!"
        else:
            return f"{latest} That's {self.highest() - self.latest()} short of your personal best!"

    def top(self):
        return sorted(self.scores, reverse=True)[0:3]

