size(350, 350);
background (15); 
colorMode(HSB, 350);
color c1= color(200,180,30);
fill(c1);
quad(0,0,350,0,350,175,0,175);
fill(#900000); 
arc (0,130,100,130,105,160);
colorMode(RGB,350);
color c2= color(255,204,0);
fill(c2);
triangle (20,20,40,20,30,30);
triangle(35,40,55,40,25,50);
triangle (70,30,90,30,80,40);
triangle (100,40,110,40,120,30);
triangle(80,115,110,115,95,125);
color c3= color(150,0,50);
fill(c3);
triangle(40,90,60,90,50,100);
triangle(250,100,270,100,260,90);
triangle(130,50,150,60,110,70);
triangle (145,165,160,165,152,155);
triangle (325,135,345,135,335,150);
fill(c2);
triangle(200,85,238,85,213,100);
color c4= color(0,50,200);
fill(c4);
arc (315,0,250,110,0, PI+QUARTER_PI, CHORD);
color c5= color(0,300,170);
fill(c5);
quad(0,175,350,175,350,350,0,350);
