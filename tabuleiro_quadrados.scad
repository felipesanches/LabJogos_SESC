altura = 10;
R = 20;

H1 = altura*0.5;
H2 = altura;
n=4;
module bloco(){
rotate(45)
	hull(){
		cylinder(h=H1, r=R, $fn=n);
		cylinder(h=H2, r=R/2, $fn=n);
	}
}
k=1.2;

M=5;
N=5;
for (i=[0:M]){
  for (j=[0:N]){
    translate([k*(i * R*sqrt(2)), k*sqrt(2)*R*j]){

	if((i+j)%2) color("green") bloco();
      else color("grey") bloco();

	if ((i+j)%3)
	translate([0,R/2+5])
      parede();

	if ((i*j)%2)
	translate([R/2+6,0]) rotate(90)
      parede();
    }
  }
}

module parede(){
	color([0,0.3,0.3]) scale([1, 0.3, 3]) bloco();
}