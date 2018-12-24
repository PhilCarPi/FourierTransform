// This class creates an approximation of a periodic wave using fourier series.
class FourierWave{
    float x = 0; // the x-coordinate of the center of the circles representing the sinusoidal functions in the different terms of the fourier series
    float y = 0; // the y-coordinate of the center of the circles representing the sinusoidal functions in the different terms of the fourier series
    int terms = 1; // the number of therms in the series
    float amplitude = 1; // the amplitude of the wave to be approximated
    float wFreq = 1; // the fundamental angular frequency
    float [] wave = new float [0]; // the array that holds the points defining the graphical representation of the wave to be approximated
    String type; // the type of wave to be approximated. Valid values are: square, triangular, sawtooth
    
    // constructor
    FourierWave(int n, float amp, float w, String waveType){
      terms = n;
      amplitude = amp;
      wFreq = w;
      type = waveType;
    }
    
    // draw wave
    void drawWave(){
      // create and draw circles representing the square wave fourrier series
      for(int i = 0; i < terms; i++) {
        float prevx = x;
        float prevy = y;
        int n = i; // default
        
        // determine the term's coefficient, and whether n is even, odd, or both
        float coeff = 1; // default
        switch(type){
          case "sawtooth" :
            n = i + 1; // n is even OR odd
            coeff = ( ( amplitude * pow(-1,n-1) ) / ( n * PI ) );
            break;
          case "square" :
            n = i * 2 + 1; // n is odd
            coeff = ( ( 2 * amplitude ) / ( n * PI ) );
            break;
          case "triangular" :
            n = i * 2 + 1; // n is odd
            coeff = ( ( 4 * amplitude * pow( -1, (n-1)/2 ) ) / pow( n * PI, 2 ) );
            break;
        };
        // define 
        float radius = coeff;
        x += radius * cos( wFreq * n * time );
        y += radius * sin( wFreq * n * time );
      
        // draw circle
        stroke(255,100);
        noFill();
        ellipse(prevx,prevy,radius * 2, radius * 2);
         
        // draw rotating point
        fill(255,200);
        ellipse(x,y, 4,4);
        
        // draw line from center of circle to rotating point
        stroke(255);
        line(prevx,prevy,x,y);
      }
      
      // prepend the last rotating circle's y coordinate to the wave array
      wave = prepend(wave,y);
        
        // translate the wave right
        translate(200,0);
        // draw a line from last rotating circle to the first point on the wave 
        stroke(100,100,255);
        line(x-200,y,0,wave[0]);
        // draw the wave
        stroke(255);
        beginShape();
        noFill();
        for(int i = 0; i < wave.length; i++)
        {
          vertex(i,wave[i]);
        }
        endShape();
        
         // truncate the last element of the wave array
        if(wave.length > 600)
        {
          wave = shorten(wave);
        }
        
        // reset x and y
        x = 0;
        y = 0;
    }
    
    // this function prepends an element to an array of type float
    float [] prepend(float arr[], float val){
      int a_length = arr.length; // get the array's length
      float [] temp = new float [a_length + 1]; // create a temporary array
      temp[0] = val; // assign value to front of temp array
      
      // if the array has more than 1 eement
      if(a_length > 1)
      {
        // copy array to temp array starting at the second position
        for(int i = 0; i < a_length; i++)
        {
          temp[i+1] = arr[i];
        }
      }
      
      return temp;
    }
}