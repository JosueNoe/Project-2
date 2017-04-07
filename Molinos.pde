class Windmill {

RevoluteJoint joint;
Box box1;
Box box2;

Windmill(float x, float y) {

 box1 = new Box(x, y-50, 140, 10, false); 
 box2 = new Box(x, y, 10, 40, true); 
 RevoluteJointDef rjd = new RevoluteJointDef();
 rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());
 rjd.motorSpeed = PI*2;
 rjd.maxMotorTorque = 1000.0;
 rjd.enableMotor = true;

   joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }

boolean motorOn() {
    return joint.isMotorEnabled();
  }

 void display() {
    box1.display();

    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(204,229,random(255));
    ellipse(anchor.x, anchor.y, 4, 4);
  }
}