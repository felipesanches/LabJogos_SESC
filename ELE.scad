//(c) 2014 Felipe Sanches <fsanches@metamaquina.com.br>
// Released to the public domain

module ELE(l, L, h=1, H=8, bevel=0.5){

	//primeira parede
	hull(){
		linear_extrude(height=h)
		square([l, L]);

		linear_extrude(height=H)
		translate([bevel, bevel])
		square([l - 2*bevel, L - 2*bevel]);
	}

	//segunda parede
	hull(){
		linear_extrude(height=h)
		square([L, l]);

		linear_extrude(height=H)
		translate([bevel, bevel])
		square([L - 2*bevel, l - 2*bevel]);
	}
}


module sulco_2d(l, L, folga){
	difference(){
		translate([-folga/2, -folga/2])
		square([L+l+folga, L+l+folga]);

		translate([l,l])
		square([L-l, L-l]);
	}
}

l = 2;
L = 20;
altura = 6;
borda = 3;
profundidade = 3;
lado = l+L+2*borda;
folga = 2;
epsilon = 0.1;

H_sacada = 2;
sacada = 2;

module celula(){
	render()
	difference(){
		union(){
			translate([sacada,sacada])
			cube([lado-2*sacada, lado-2*sacada, altura]);
	
			translate([0,0,H_sacada])
			furo_para_carta(L+l+2*borda, altura=H_sacada, bevel=2*sacada);

			translate([0,0,2*H_sacada])
			cube([lado, lado, altura - 2*H_sacada]);		
		}

		translate([borda, borda, altura-profundidade])
		linear_extrude(height=profundidade+1)
		sulco_2d(l, L, folga);

		//translate([borda+2*l, borda+2*l	])
		//cube([L-3*l, L-3*l, altura+epsilon]);
	
		translate([borda+2*l, borda+2*l])
		furo_para_carta(L-3*l, altura, bevel=altura);
	}
}

module furo_para_carta(R, altura, bevel=2){
	translate([R/2,R/2])
	rotate(45)
	cylinder(r2=R/sqrt(2), r1=(R-bevel)/sqrt(2),
			 h=altura+epsilon, $fn=4);

}



color("grey")
celula();

color("white")
translate([borda-folga/4, borda-folga/4,altura-profundidade])
ELE(l, L, h=1, H=8, bevel=0.5);