import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;

void setup()
{
  size(500, 500);

  minim = new Minim(this);

  in = minim.getLineIn(Minim.MONO, width, 44100, 16);
}

void draw()
{ 
  
  background(155);
  stroke(250);
  
  float mid = height/2;
  float total = 0.0f;  
  
  for (int i = 0; i < in.bufferSize (); i ++)
  {
    line(i, mid, i, mid + in.left.get(i) * 250);
    total += abs(in.left.get(i));
    
  }
  
    float average = total / in.bufferSize();
    text("Average: " + average, 10, 10);

  
} 

