import java.awt.event.KeyEvent;



class Spring{
	float x;
	float y;
	int len;
	int s_len;
	ArrayList<PointMass> _ml;
	ArrayList<SpringConnector> _sl;



	Spring(float x,float y,int len,int s_len,float k,float m){
		this.x=x;
		this.y=y;
		this.len=len;
		this.s_len=s_len;
		this._ml=new ArrayList<PointMass>();
		this._sl=new ArrayList<SpringConnector>();
		for (int i=0;i<=len/s_len;i++){
			this._ml.add(new PointMass(x+i*s_len,y,m));
			if (i>0){
				this._sl.add(new SpringConnector(this._ml.get(i-1),this._ml.get(i),k,s_len,(i==1?SPRING_MODE_ONLY_B:SPRING_MODE_BOTH)));
			}
		}
	}



	void update(float dt){
		if (keyPressed&&key=='+'){
			this._ml.get(this._ml.size()-1).m+=0.01;
			if (this._ml.get(this._ml.size()-1).m>1){
				this._ml.get(this._ml.size()-1).m=1;
			}
		}
		if (keyPressed&&key=='-'){
			this._ml.get(this._ml.size()-1).m-=0.01;
			if (this._ml.get(this._ml.size()-1).m<0.01){
				this._ml.get(this._ml.size()-1).m=0.01;
			}
		}
		for (SpringConnector s:this._sl){
			s.update(dt);
		}
		for (int i=1;i<this._ml.size()-(mousePressed?1:0);i++){
			this._ml.get(i).update(dt);
		}
		if (mousePressed){
			this._ml.get(this._ml.size()-1).p.set(mouseX,height-mouseY);
			this._ml.get(this._ml.size()-1).v.set(0,0);
		}
	}



	void draw(){
		noFill();
		stroke(0,255,0,128);
		strokeWeight(15);
		PVector lp=this._ml.get(0).p;
		for (int i=0;i<this._ml.size();i++){
			PVector c=this._ml.get(i).p;
			line(lp.x,height-lp.y,c.x,height-c.y);
			lp=c;
		}
		fill(255,0,0);
		noStroke();
		circle(this.x,height-this.y,20);
	}
}
