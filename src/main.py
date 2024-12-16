import pgzrun
import random
speed = 0.5
# Define window size
WIDTH = 800
HEIGHT = 600

babka = Actor('babka')   
babka.pos = (WIDTH/2, HEIGHT/2)  # Center the actor

def draw():
    screen.clear()
    screen.fill((53,81,92))
    babka.draw()

def place_babka():
    babka.x = random.randint(0, WIDTH)
    babka.y = 0

place_babka()

def update():
    global speed
    
    babka.y = babka.y + speed
    if babka.y > HEIGHT:
        place_babka()
        speed = speed + 0.1

    

if __name__ == "__main__":
    pgzrun.go()
