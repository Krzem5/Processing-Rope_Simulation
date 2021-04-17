final float METERS_TO_CENTIMETERS=100;
final float GROUND_Y_POS=2*METERS_TO_CENTIMETERS;
final float GROUND_FRICTION_CONSTANT=0.5;
final float SPRING_FRICTION_CONSTANT=0.1;
final float GRAVITY=-9.81*METERS_TO_CENTIMETERS;



Spring s;
long _lt;



void setup(){
	size(1920,1080);
	s=new Spring(width/2,height-300,500,20,5);
	_lt=millis();
}



void draw(){
	long tm=millis();
	float dt=(tm-_lt)*1e-3;
	_lt=tm;
	background(0);
	s.update(dt);
	s.draw();
}
