// declare and initialize global variables
float time = 0; // time variable
int selectedWaveType = 0; // the type of wave to be displayed. Used to choose among different wave objects
int lastActive = selectedWaveType; // used to keep track of active/inactive wavetype
float amplitude; // the amplitude of the function to be approximated
int terms; // the number of terms in the fourier series
float wFreq; // the fundamental angular frequency (rad/s)

// Declare objects
// Scroll bar objects
HScrollbar hs1;
HScrollbar hs2;
HScrollbar hs3;
// Fourier series wave objects
FourierWave sawtooth; // sawtooth wave fourier series approximation
FourierWave square; // square wave fourier series approximation
FourierWave triangular; // triangular wave fourier series approximation
// Buttons used to interact with program
Button squareBtn; // button selects square wave approximation
Button triBtn; // button selects triangular wave approximation
Button sawtoothBtn; // button selects sawtooth wave approximation

// create arrays to store wave objects and buttons respectively. This facilitates manipulation of these in the code
FourierWave[] waves; // holds FourierWave objects declared above
Button[] buttons; // holds Button objects declared above

void setup()
{
  // set the canvas size
  size( 1200, 600 );
  
  // initialize sliders
  hs1 = new HScrollbar(100,height - 70, 100, 16, 16);
  hs2 = new HScrollbar(100,height - 140, 100, 16, 16);
  hs3 = new HScrollbar(100,height - 210, 100, 16, 16);
  
  // initialize buttons and space them using the first btn's x position as a reference
  float btnX = 300;
  squareBtn = new Button(btnX,height - 100, 150, 50, "Square", 20,0);
  triBtn = new Button(btnX + 170,height - 100, 150, 50, "Triangular", 20,1);
  sawtoothBtn = new Button(btnX + 340,height - 100, 150, 50, "Sawtooth", 20,2);
  
  // Initialize the wave objects
  square = new FourierWave(terms,amplitude,wFreq,"square");
  triangular = new FourierWave(terms,amplitude,wFreq,"triangular");
  sawtooth = new FourierWave(terms,amplitude,wFreq,"sawtooth");
  
  // initialize wave and buttons arrays
  waves = new FourierWave[3];
  buttons = new Button[3];
  
  // store wave and button objects in their respective arrays
  waves[0] = square;
  waves[1] = triangular;
  waves[2] = sawtooth;
  buttons[0] = squareBtn;
  buttons[1] = triBtn;
  buttons[2] = sawtoothBtn;
  
  // select first wave objects by default by activating the corresponding button object
  buttons[selectedWaveType].active = true;
}

void draw()
{
  // set background color to black
  background(0);
  
  // Display sliders text
  // Amplitude slider
  textSize(20);
  fill(255,200);
  text("amplitude = " + int(amplitude), 150, height - 180);
  // angular frequency slider
  textSize(20);
  fill(255,200);
  text("w0 = " + nfc(wFreq,2) + " rad/s", 150, height - 110);
  // number of terms in series slider
  textSize(20);
  fill(255,200);
  text("# terms = " + terms, 150, height - 40);
  
  // Draw buttons
  squareBtn.draw();
  squareBtn.update();
  triBtn.draw();
  triBtn.update();
  sawtoothBtn.draw();
  sawtoothBtn.update();
  
  // update and draw sliders
  hs1.update();
  hs1.display();
  hs2.update();
  hs2.display();
  hs3.update();
  hs3.display();
  
  // update wave parameters based on slider values
  amplitude = 1.5 * hs3.spos;
  wFreq = 0.02 * ( hs2.spos - hs2.sposMin + 10 );
  terms = int(hs1.spos - hs1.sposMin + 1);
  
  // update wave object values using updated parameters
  for(int i = 0; i < waves.length; i++)
  {
    waves[i].terms = terms;
    waves[i].wFreq = wFreq;
    waves[i].amplitude = amplitude;
  }
  
  // draw selected wave
  translate(300, 200); // give some margin left and top (300px, and 200px respectively )
  waves[selectedWaveType].drawWave();
  
  // increase time before next draw() loop execution
  time += 0.05;
}

// monitors when the mouse is released after being pressed. Used to switch between waves to be displayed
void mouseReleased()
{
  // determine which wave to display by finding the active button that represents it
  // loop through the buttons
  for(int i = 0; i < buttons.length; i++)
  {
    // if button is active and its value is different than the previous active value
    if(buttons[i].active && buttons[i].activeValue != selectedWaveType)
    {
       selectedWaveType = buttons[i].activeValue; // update the selected wave indicator
       // reset the wave array by replacing it by an empty array (see FourierWave class's wave attribute)
       waves[i].wave = new float [0];
       time = 0; // reset the time to 0
       buttons[lastActive].active = false; // deactivate previously active button
       lastActive = selectedWaveType; // update the lastActive variable. Used in next evaluation.
       break; // exit the loop
    }
  }
}