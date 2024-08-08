from turtle import Turtle


class Paddle(Turtle):
    def __init__(self):
        super().__init__()
        self.shape("square")
        self.color("white")
        self.shapesize(5, 1)
        self.penup()
        self.goto(350, 0)

    def move_up_paddle1(self):
        y = self.ycor() + 20
        self.sety(y)

    def move_down_paddle1(self):
        y = self.ycor() - 20
        self.sety(y)


class Paddle2(Turtle):
    def __init__(self):
        super().__init__()
        self.shape("square")
        self.color("white")
        self.shapesize(5, 1)
        self.penup()
        self.goto(-350, 0)

    def move_up_paddle2(self):
        y = self.ycor() + 20
        self.sety(y)

    def move_down_paddle2(self):
        y = self.ycor() - 20
        self.sety(y)
