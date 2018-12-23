// Button class
// This class allows a user to create a button object that has the following attributes:
// - it stores a value that uniquely differentiates it from other button objects
// - it has active and inactive states that can be set and read
// - it can hold a string value that can be displayed when the button is drawn
class Button{
  float buttonWidth; // width
  float buttonHeight; // height
  String text; // string to be displayed in the button
  float xpos; // the rect()'s x position
  float ypos; // the rect()'s y position
  int fontSize; // the font size of the text to be displayed
  boolean over; // this variable keeps track of whether the mouse is hovering over the object
  int activeValue; // the unique value differentiating the button
  boolean active; // indicates whether the button is active or not. The state is changed by clicking on the button.
  boolean locked = false; // serves to facilitate the recognition of the click event
  
  // Constructor initializes the objects values declared above
  Button(float x, float y, float w, float h, String t, int fs, int actV){
    buttonWidth = w;
    buttonHeight = h;
    xpos = x;
    ypos = y;
    text = t;
    fontSize = fs;
    activeValue = actV;
    active = false;
  }
  
  // this function draws the button on a canvas
  void draw(){
    // draw rectangle
    fill(255,100);
    // if the mouse is over the button, or if the button is active, use a different fill color
    if(over || active)
    {
      fill(200,100,0);
    }
    stroke(0);
    rect(xpos,ypos,buttonWidth,buttonHeight,10);
    
    // draw text inside rectangle
    fill(0,200,200);
    textSize(20);
    textAlign(CENTER,CENTER);
    text(text,xpos + buttonWidth / 2, ypos + buttonHeight / 2 - fontSize / 6);
  } // end constructor
  
  // this function determines whether the mouse is hovering on the button
  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+buttonWidth &&
       mouseY > ypos && mouseY < ypos+buttonHeight) {
      return true;
    } else {
      return false;
    }
  } // end overEvent function
  
  // this function uses the overEvent() function to determine if the button has been clicked
  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    
    // Active vs. inactive
    if(over && !locked && mousePressed)
    {
      if(active){
        active = false;
      } else {
        active = true;
      }
      locked = true;
    }
    
    if(!mousePressed)
    {
      locked = false;
    }
  } // end update function
  
} // end Button class