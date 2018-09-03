class Wave {

  int pos = (width/(waveCount+1));
  int waveThickness = 5;
  float randDistribution = random(-5,5);

  Wave() {
  }

  void display() {
    calcWave();
    renderWave();
  }

  void calcWave() {

    thetaMouseX = map(120, 0, width, 0.01, 0.1);
    amplitude = map(200, 0, height, 5, 100);

    theta += thetaMouseX;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = cos(x)*noise(amplitude)*100;
      x+=dx*-1;
    }
  }

  void renderWave() {
    noStroke();
    fill(0);
    // A simple way to draw the wave with an ellipse at each location
    for (int x = 0; x < yvalues.length; x++) {
      for (int i = 0; i < waveCount; i++) {
        //ellipse(yvalues[x] + pos + pos*i, x*xspacing , waveThickness, waveThickness);
        //float randDistribution = random(-5,5);
        stroke(125);
        line(yvalues[x] + pos + pos*i, x*xspacing, mouseX, x*xspacing + randDistribution);
      }
    }
  }
}
