class PointMass{
	PVector p;
	PVector v;
	float m;



	PointMass(float x,float y,float m){
		this.p=new PVector(x,y);
		this.v=new PVector(0,0);
		this.m=m;
	}



	void update(float dt){
		this.v.y+=GRAVITY*dt;
		this.p.add(this.v.x*dt,this.v.y*dt);
		if (this.p.y<GROUND_Y_POS){
			this.v.y=0;
			this.p.y=GROUND_Y_POS;
			this.v.x*=1-GROUND_FRICTION_CONSTANT*dt;
		}
	}
}
