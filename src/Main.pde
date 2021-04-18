final float METERS_TO_CENTIMETERS=100;
final float GROUND_Y_POS=2*METERS_TO_CENTIMETERS;
final float GROUND_FRICTION_CONSTANT=0.6;
final float SPRING_FRICTION_CONSTANT=0.2;
final float GRAVITY=-9.81*METERS_TO_CENTIMETERS;



Spring s1;
Spring s2;
long _lt;



void setup(){
	size(1920,1080);
	s1=new Spring(width/3,height-300,300,20,5,0.01);
	s2=new Spring(width*2/3,height-300,300,20,20,0.01);
	_lt=millis();
}



void draw(){
	long tm=millis();
	float dt=(tm-_lt)*1e-3;
	_lt=tm;
	s1.update(dt);
	s2.update(dt);
	background(0);
	stroke(255,255,255);
	strokeWeight(10);
	line(0,height-GROUND_Y_POS+10,width,height-GROUND_Y_POS+10);
	noStroke();
	fill(255);
	textAlign(LEFT,TOP);
	text(s1._ml.get(s1._ml.size()-1).m,5,5);
	s1.draw();
	s2.draw();
}
