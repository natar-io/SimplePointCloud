import tech.lity.rea.pointcloud.PointCloud;
import tech.lity.rea.pointcloud.DepthPoint;
import toxi.geom.*;
import peasy.*;

import controlP5.*;

ControlP5 cp5;
PeasyCam cam;
PointCloud pointCloud;

int nbPoints = 50000;

void settings() {
    size(640, 480, P3D);
}

float sliderValue, speed;

void setup() {
    pointCloud = new PointCloud(this, nbPoints);

    cp5 = new ControlP5(this);
    cp5.setAutoDraw(false);
    
    cp5.addSlider("sliderValue")
	.setPosition(10,10)
	.setRange(10, 255)
	;

    cp5.addSlider("speed")
	.setPosition(10,30)
	.setSize(400, 10)
	.setRange(1500, 1000000)
	;

    
    //  Set the virtual camera
    cam = new PeasyCam(this, 400);
    loadCloud();
    background(40);
}

void loadCloud(){
    // colorMode(HSB, nbPoints, 100, 100);
    int c = color(250, 20);

    for(int i = 0; i < nbPoints; i++){
	float x = cos(i * millis() / (1 + sliderValue * speed));
	float y = cos(i * millis() / (6.2f * speed ));
	float z = cos(i * millis() / (5.2f * speed));

	DepthPoint p = new DepthPoint(x * 100,
				      y * 100,
				      z * 100, c);
	pointCloud.addPoint(p);
    }
    pointCloud.loadVerticesToNative();
    colorMode(RGB, 255);
}


void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

boolean first = true;

void draw() {
    background(40);
    loadCloud();
    pointCloud.drawSelf((PGraphicsOpenGL) g);
    gui();
}


void keyPressed(){
    //    background(40);
}
