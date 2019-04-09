import tech.lity.rea.pointcloud.PointCloud;
import tech.lity.rea.pointcloud.DepthPoint;
import toxi.geom.*;
import peasy.*;

PeasyCam cam;
PointCloud pointCloud;

int nbPoints = 500;

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
    int c = color(250);

    for(int i = 0; i < nbPoints; i++){
	float x = cos(i * millis() / 40000f);
	float y = cos(i * millis() / 62000f);
	float z = cos(i * millis() / 52000f);

	DepthPoint p = new DepthPoint(x * 100,
				      y * 100,
				      z * 100, c);
	pointCloud.addPoint(p);
    }
    pointCloud.loadVerticesToNative();
    colorMode(RGB, 255);
}

void draw() {
    loadCloud();
    pointCloud.drawSelf((PGraphicsOpenGL) g);
}

void keyPressed(){
    background(40);
}
