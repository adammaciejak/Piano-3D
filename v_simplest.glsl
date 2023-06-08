#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;

//Atrybuty
in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu
in vec4 color; //kolor związany z wierzchołkiem
in vec4 normal; //wektor normalny w przestrzeni modelu
in vec2 texCoord;

//Zmienne interpolowane
out vec4 ic;
out vec4 l1;
out vec4 l2;
out vec4 n;
out vec4 v; 
out vec2 iTexCoord; 

void main(void) {
    vec4 lp1 = vec4(-9, 2, -6, 1); //pozcyja światła, przestrzeń świata
    vec4 lp2 = vec4(9, 2, -6, 1); //pozcyja światła, przestrzeń świata

    l1 = normalize(V * lp1 - V*M*vertex); //pierwszy wektor do światła w przestrzeni oka
    l2 = normalize(V * lp2 - V*M*vertex); //drugi wektor do światła w przestrzeni oka

    v = normalize(vec4(0, 0, 0, 1) - V * M * vertex); //wektor do obserwatora w przestrzeni oka
    n = normalize(V * M * normal); //wektor normalny w przestrzeni oka
    
    iTexCoord = texCoord;
    ic = color;
    
    gl_Position=P*V*M*vertex;
}
