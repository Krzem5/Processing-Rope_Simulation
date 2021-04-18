final int SPRING_MODE_BOTH=0;
final int SPRING_MODE_ONLY_B=1;



class SpringConnector{
	PointMass a;
	PointMass b;
	float k;
	float len;
	int m;



	SpringConnector(PointMass a,PointMass b,float k,float len,int m){
		this.a=a;
		this.b=b;
		this.k=k;
		this.len=len;
		this.m=m;
	}



	void update(float dt){
		PVector df=this.a.p.copy().sub(this.b.p);
		float l=sqrt(df.x*df.x+df.y*df.y);
		PVector acc=new PVector(-(this.a.v.x-this.b.v.x)*SPRING_FRICTION_CONSTANT,-(this.a.v.y-this.b.v.y)*SPRING_FRICTION_CONSTANT);
		if (l!=0){
			acc.x+=-df.x/l*(l-this.len)*this.k;
			acc.y+=-df.y/l*(l-this.len)*this.k;
		}
		acc.x*=dt;
		acc.y*=dt;
		if (this.m==SPRING_MODE_BOTH){
			this.a.v.add(acc.x/this.a.m,acc.y/this.a.m);
			this.b.v.add(-acc.x/this.b.m,-acc.y/this.b.m);
		}
		else{
			this.b.v.add(-acc.x*2/this.b.m,-acc.y*2/this.b.m);
		}
	}
}
