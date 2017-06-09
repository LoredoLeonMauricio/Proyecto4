float x[] = new float[50];
float y[] = new float[50];
float xoff = 0.0;
float yoff = 0.0;
float xincrement = random(0.02); 
float yincrement = random(0.02); 
float easing=0.5;

void setup(){
  size (600,600);
  rectMode(CENTER);
  background(0);
}

void draw(){
  fill(0, 10);
  rect(width/2,height/2,width,height);
  fill(0,150,0);
  stroke(255,40);
  float X = noise(xoff)*width;
  float Y = noise(yoff)*width;
  
  xoff += xincrement;
  yoff += yincrement;
  X = constrain(X,0,width);
  Y = constrain(Y,0,width);
  
  for(int i = 0; i<49; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
    ellipse(x[i],y[i],i,i);
  }
  x[49] = X;
  y[49] = Y;


  if (keyCode == SHIFT){
    fill(0,0,255);
    rect(mouseX,mouseY,10,10);
    int targetX = mouseX;
    int targetY = mouseY;
    x[49] += (targetX-X/2)*easing;
    y[49] += (targetY-Y/2)*easing;
    X += (targetX-X/2)*easing;
    Y += (targetY-Y/2)*easing;
  }
  
    ellipse(x[49],y[49],5,5);
  
  fill(0,100,100);

  rect(X,Y,40,40);
  rect(X,Y+20,20,20);
  fill(255,0,0);
  ellipse(X+10,Y-8,10,10);
  ellipse(X-10,Y-8,10,10); 
  
  fill(100,100);
  textSize(14);
  rect(200,35,380,50);
  fill(255);
  text("Presiona SHIFT para llamar su atención con el mouse", 10, 30); 
  text("Presiona cualquier otra tecla para liberarlo", 10, 50); 
}