//originally used boolean followMouse, then subclass Ball_Mouse (Ball_Mouse extends Ball); currently, program uses followMouse

Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;

void setup() {
  size(500, 500);
  ball1 = new Ball(color(255, 0, 0), random(10, width - 10), random(10, height - 10), 3, 0, false, false);
  ball2 = new Ball(color(0, 255, 0), random(10, width - 10), random(10, height - 10), 0, 3, false, false);
  ball3 = new Ball(color(0, 0, 255), random(10, width - 10), random(10, height - 10), 3, 3, false, false);
  ball4 = new Ball(0, random(10, width - 10), random(10, height - 10), 4, 4, true, false);
  ball5 = new Ball(color(255), random(10, width - 10), random(10, height - 300), 4, 2, false, true);
}

void draw() {
  background(0);
  ball1.move();
  ball2.move();
  ball3.move();
  ball4.move();
  ball5.move();
  ball1.display();
  ball2.display();
  ball3.display();
  ball4.display();
  ball5.display();
}

class Ball {
  color c;
  float x, y, dx, dy;
  boolean followMouse, gravity;
  
  Ball() {
  }
  
  Ball (color tempc, float tempx, float tempy, float tempdx, float tempdy, boolean tempfollowMouse, boolean tempgravity) {
    c = tempc;
    x = tempx;
    y = tempy;
    dx = tempdx;
    dy = tempdy;
    followMouse = tempfollowMouse;
    gravity = tempgravity;
  }
  
  void display() {
    noStroke();
    fill(c);
    if (followMouse) {
      fill(color(random(256), random(256), random(256)));
    }
    ellipse(x, y, 20, 20);
  }
  
  void move() {
    x = x + dx;
    y = y + dy;
    if (x > width - 10 || x < 10) {
      dx *= -1;
    }
    if (y > height - 10 || y < 10) {
      dy *= -1;
    }
    
    if (gravity){
      dy += 0.2;
    }
    
    if (followMouse && mouseX > 10 && mouseX < width - 10 && mouseY > 10 && mouseY < height - 10) {
//      x = mouseX; //easy version: ball teleports to location
//      y = mouseY;
      if (mouseX > x) {
        dx = 1;
      }
      else if (mouseX < x) {
        dx = -1;
      }
      if (mouseY > y) {
        dy = 1;
      }
      else if (mouseY < y) {
        dy = -1;
      }
    }
  }
}

class Ball_Mouse extends Ball {
  
  Ball_Mouse (color tempc, float tempx, float tempy, float tempdx, float tempdy, boolean tempfollowMouse) {
    c = tempc;
    x = tempx;
    y = tempy;
    dx = tempdx;
    dy = tempdy;
    followMouse = tempfollowMouse;
  }
  
  void display() {
    fill(color(random(256), random(256), random(256)));
    ellipse(x, y, 20, 20);
  }
  void move() {
    if (mousePressed) {
      if (mouseX > x) {
        dx = 3;
      }
      else if (mouseX < x) {
        dx = -3;
      }
      if (mouseY > y) {
        dy = 3;
      }
      else if (mouseY < y) {
        dy = -3;
      }
    }
    x += dx;
    y += dy;
  }
}
