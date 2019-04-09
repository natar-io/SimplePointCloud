import tech.lity.rea.pointcloud.PointCloud;
import tech.lity.rea.pointcloud.DepthPoint;
import toxi.geom.*;
import peasy.*;

PeasyCam cam;
PointCloud pointCloud;

int nbPoints = 50000;

void settings() {
    size(640, 480, P3D);
}

void setup() {
    pointCloud = new PointCloud(this, nbPoints);
    
    //  Set the virtual camera
    cam = new PeasyCam(this, 400);
    loadCloud();
    background(40);
}

void loadCloud(){
    // colorMode(HSB, nbPoints, 100, 100);
    int c = color(250);

    for(int i = 0; i < nbPoints; i++){
	float x = cos(i * millis() / 4000f);
	float y = cos(i * millis() / 6200f);
	float z = cos(i * millis() / 5200f);

	DepthPoint p = new DepthPoint(x * 100,
				      y * 100,
				      z * 100, c);
	pointCloud.addPoint(p);
    }
    pointCloud.loadVerticesToNative();
    colorMode(RGB, 255);
}



boolean first = true;

void draw() {
    background(40);
  loadCloud();
  pointCloud.drawSelf((PGraphicsOpenGL) g);
}


void keyPressed(){
    background(40);
}
