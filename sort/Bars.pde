class Bar {
  int size;
  color col;
  Bar(int x) {
    this.size = x + 1;
  }
}

class Bars {
  Bar[] yeet;
  int num, big, w;
  int intvl;

  Bars(int x, int y, int z, int foo) {
    num = x;
    w = y;
    big = z;
    intvl = foo;
    yeet = new Bar[num];
    for (int i = 0; i < num; i++) {
      yeet[i] = new Bar(i);
      
    }
  }

  void scramble() {

    for (int i = 0; i < num; i++) {
      int meh = int(random(0, num));
      Bar t = yeet[i];
      yeet[i] = yeet[meh];
      yeet[meh] = t;
    }
  }
  
  void setCol(){
    for (int i = 0; i < num; i++) {
      yeet[i].col = color(map(i, 0, num, 55, 255), 255, 255); 
    }
   
  }

  void show() {


    noStroke();
    for (int i = num - 1; i >= 0; i--) {
      fill(yeet[i].col);
      rect(0, (i - num / 2) * (w + intvl), yeet[i].size * big, w);
    }
  }

  void sort0(int from) {

    for (int j = from - 1; j >= 0; j--) {
      if (yeet[from].size < yeet[j].size) {
        Bar t = yeet[from];
        yeet[from] = yeet[j];
        yeet[j] = t;
      }
    }
  }
}
