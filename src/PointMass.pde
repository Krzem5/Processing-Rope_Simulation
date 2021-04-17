class PointMass{
	PVector p;
	PVector v;



	PointMass(float x,float y){
		this.p=new PVector(x,y);
		this.v=new PVector(0,0);
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
