import pgzrun
import random
import time
speed = 1.0
score = 0
game_over = False
time_remaining = 60.0


# Define window size
WIDTH = 600
HEIGHT = 600

babka = Actor('babka')   
babka.pos = (WIDTH/2, HEIGHT/2)  # Center the actor


def draw():
    screen.clear()
    screen.fill((125,249,255))
    babka.draw()
    screen.draw.text(f"Score: {score}", topleft=(10,10), fontsize=60)
    screen.draw.text(f"Time: {int(time_remaining)}", topleft=(400, 10), fontsize=60)
    if game_over == True:
      screen.fill((125,249,255))
      screen.draw.text("Game Over", center=(300,300), fontsize=60)
      if score == 1:
          screen.draw.text(f"You got {score} babka!!!", center=(400,340), fontsize=60)
      else:
            screen.draw.text(f"You got {score} babkas!!!", center=(300,340), fontsize=60)
def place_babka():
    global speed
    babka.x = random.randint(0, WIDTH)
    babka.y = 0
    speed = speed + 0.1

def time_up():
   global game_over
   game_over = True





def update():
    global speed
    global game_over
    babka.y = babka.y + speed
    if babka.y > HEIGHT:
        place_babka()

def on_mouse_down(pos):
    global score
    if babka.collidepoint(pos):
        score = score + 1
        place_babka()

def update_timer():
    global time_remaining, game_over
    time_remaining -= 1
    if time_remaining <= 0:
        game_over = True

clock.schedule(time_up, 60.0)
clock.schedule_interval(update_timer, 1.0)
place_babka()

if __name__ == "__main__":
    pgzrun.go()
