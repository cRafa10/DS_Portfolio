from turtle import Turtle
ALIGNMENT = "center"
FONT = ("Verdana", 75, "normal")


class GameScreen(Turtle):
    def __init__(self):
        super().__init__()
        self.color("white")
        self.penup()
        self.hideturtle()
        self.left_player_score = 0
        self.right_player_score = 0
        self.update_games_score()

    def update_games_score(self):
        self.goto(-100, 200)
        self.write(self.left_player_score, align=ALIGNMENT, font=FONT)
        self.goto(100, 200)
        self.write(self.right_player_score, align=ALIGNMENT, font=FONT)

    def right_player_point(self):
        self.clear()
        self.right_player_score += 1
        self.update_games_score()

    def left_player_point(self):
        self.clear()
        self.left_player_score += 1
        self.update_games_score()


