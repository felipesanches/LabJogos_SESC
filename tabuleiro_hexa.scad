altura = 30;
R = 20;

H1 = altura*0.3;
H2 = altura;
n=6;
module peca(){
	rotate(30)
	hull(){
		cylinder(h=H1, r=R, $fn=n);
		cylinder(h=H2, r=R/2, $fn=n);
	}
}
k=1.2;

M=10;
N=10;
for (i=[0:M]){
  for (j=[0:N]){
    translate([k*(i * R*1.75 + (j%2)*R*1.75/2), k*1.5*R*j])
	if((i+j)%3) color("green") peca();
      else color("grey") peca();
  }
}

