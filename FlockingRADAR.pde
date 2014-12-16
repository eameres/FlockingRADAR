/**
 * Flocking 
 * by Daniel Shiffman.  
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */

PFrame f;
secondApplet s;
import java.awt.Frame;
Flock flock;
int flag = 0;

void setup() {
  
  size(1280, 360);
  f = new PFrame();
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    flock.addBoid(new Boid(width/2,height/2));
  }
  flag = 1;
}

void draw() {
  background(50);
  flock.run();
   s.redraw();
}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(new Boid(mouseX,mouseY));
}

public class PFrame extends Frame {
  
    public PFrame() {
        setBounds(0,0,320,320);
        s = new secondApplet();
        add(s);
        
        s.init();
        show();
    }
}

public class secondApplet extends PApplet {
    
    public void setup() {
        size(320, 320);
        noLoop();
    }

    public void draw() {
        background(127,127,127);
        translate(width/2, height/2);
        rotate(HALF_PI);
        translate(-width/2, -height/2);
        if(flag == 1){
          for (int i = 0; i < 150; i++) {
            Boid boid = flock.boids.get(i);
            fill(boid.c1);
            float x = boid.location.z * cos(PI * boid.location.x/640);
            float y = boid.location.z * sin(PI * boid.location.x/640);
            ellipse(160+x,160+y,10,10);
            /*
            fill(boid.c1);
            //fill(200, 100);
            stroke(boid.c1);
            pushMatrix();
            translate(x, y);
            rotate(theta);
            //scale(50.0*(1.0-(location.z/160.0)));
            //scale(2.0);
            beginShape(TRIANGLES);
            vertex(0, -boid.r*2);
            vertex(-boid.r, boid.r*2);
            vertex(boid.r, boid.r*2);
            endShape();
            popMatrix();
            */
          }
        }
        s.redraw();
    }
    public void keyPressed() {
    }
}

