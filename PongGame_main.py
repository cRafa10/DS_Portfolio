# This is the code for my Pong Game
from turtle import Screen
from PongGame_paddle import Paddle
from PongGame_paddle import Paddle2
from PongGame_ball import Ball
from PongGame_game_screen import GameScreen
import time


screen = Screen()

# I will first code the Screen
screen.setup(800, 600)
screen.bgcolor("black")
screen.title("cRafa's Pong Game")
screen.tracer(0)

# Create right and left paddles
paddle_right = Paddle()
paddle_left = Paddle2()


screen.listen()
screen.onkey(paddle_right.move_up_paddle1, "Up")
screen.onkey(paddle_right.move_down_paddle1, "Down")
screen.onkey(paddle_left.move_up_paddle2, "w")
screen.onkey(paddle_left.move_down_paddle2, "s")

# Introduce the ball object and class
ball = Ball()
game_screen = GameScreen()

# This will keep game running
pong_game = True
while pong_game:
    time.sleep(ball.moving_speed)
    screen.update()
    ball.move_ball()

    # Game needs to end after ball hits either right or left of the screen.
    if ball.ycor() > 280 or ball.ycor() < -280:
        ball.bounce_y()

    # Get ball to bounce off the top and bottom of screen and bounce off the paddles.
    if ball.distance(paddle_right) < 50 and ball.xcor() > 320 or ball.distance(paddle_left) < 50 and ball.xcor() < -320:
        ball.bounce_x()

    # Now, we need to get the ball to detect when the ball misses the right paddle
    if ball.xcor() > 380:
        ball.reset_position()
        screen.update()
        game_screen.left_player_point()

    # Misses left paddle
    if ball.xcor() < -380:
        ball.reset_position()
        screen.update()
        game_screen.right_player_point()


screen.exitonclick()
