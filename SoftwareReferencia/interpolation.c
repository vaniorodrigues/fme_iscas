#include <stdio.h>
#include <stdlib.h>

#define MAX_PIXEL_VALUE 255
int main() {

//Coeficientes dos filtos 7 e 8 tap
int qfilter[] = {-1, 4, -10, 58, 17, -5, 1};
int rev_qfilter[] = {1, -5, 17, 58, -10, 4, -1};
int hfilter[] = {-1, 4, -11, 40, 40, -11, 4, -1};


int A[16][16];
int a[16][16], b[16][16], c[16][16];
int d[16][16], h[16][16], n[16][16];
int e[16][16], f[16][16], g[16][16], i[16][16], j[16][16], k[16][16], p[16][16], q[16][16], r[16][16];
int lambda_r[48];
int O[8][8];

FILE* fp1 = fopen("fprintf_referencia/integer_pixels.txt", "w");
//printf("PIXELS EM POSIÇÕES INTEIRAS\n");

	for (int j=0; j<=15; j++)
	{
		for (int i=0; i<=15; i++)
		{
			A[i][j]=rand() % MAX_PIXEL_VALUE;
			//printf("A[%d,%d] = %d\n", i, j, A[i][j]);
			fprintf(fp1, "%x\n", A[i][j]);
		}
	} 

fclose(fp1);

//Half & Quarter Filter Interpolation para pixels horizontais e verticais

int a00=0, b00=0, c00=0; 
	for (int i=0; i<=15; i++)
	{	
		for(int j=3; j<=11; j++)
		{
			a00=0; b00=0; c00=0;
	    	for(int k=0; k<=6; k++)
			{
				a00 += A[i][j-3+k] * qfilter[k];
				c00 += A[i][j-2+k] * rev_qfilter[k];
			}

			for (int k=0; k<=7; k++)
	    	{
	    		b00 += A[i][j-3+k] * hfilter[k];
	    	}

	    	a[i][j] = a00 >> 6;
	    	b[i][j] = b00 >> 6;
	    	c[i][j] = c00 >> 6;

	    
		}
	}
printf("\n");	

printf("PIXELS HORIZONTAIS\n");

FILE* fp2 = fopen("./fprintf_referencia/PH_a.txt", "w");

for(int j=3; j<=11; j++)
	{
		for (int i=0; i<=15; i++)
		{	
			
			if (a[i][j] > 255)
			{
				a[i][j] = 255;
			}
			if (a[i][j] < 0)
			{
				a[i][j] = 0;
			}
			//printf("a[%d,%d] = %d\n", i, j, a[i][j]);
			fprintf(fp2, "%x\n", a[i][j]);	
		} 
	} 
fclose(fp2);


FILE* fp3 = fopen("./fprintf_referencia/PH_b.txt", "w");
for(int j=3; j<=11; j++)
	{
		for (int i=0; i<=15; i++)
		{	
			if (b[i][j] > 255)
			{
				b[i][j] = 255;
			}
			if (b[i][j] < 0)
			{
				b[i][j] = 0;
			}

			//printf("b[%d,%d] = %d\n", i, j, b[i][j]);
			fprintf(fp3, "%x\n", b[i][j]);	
		} 
	} 
fclose(fp3);

FILE* fp4 = fopen("./fprintf_referencia/PH_c.txt", "w");
for(int j=3; j<=11; j++)
	{	    
		for (int i=0; i<=15; i++)
		{	
			if (c[i][j] > 255)
			{
				c[i][j] = 255;
			}
			if (c[i][j] < 0)
			{
				c[i][j] = 0;
			}
			//printf("c[%d,%d] = %d\n", i, j, c[i][j]);
			fprintf(fp4, "%x\n", c[i][j]);	
		} 			
	}
fclose(fp4);

//printf("PIXELS VERTICAIS DE PRIMEIRA ORDEM\n");
int d00=0, h00=0,n00=0;
	for(int j=4; j<=11; j++)
	{	
		for (int i=12; i>=4; i--)
		{
			d00=0; h00=0; n00=0;
	    	for(int k=0; k<=6; k++)
			{
				d00 += A[i+3-k][j] * qfilter[k];
				n00 += A[i+2-k][j] * rev_qfilter[k];
			}

			for (int k=0; k<=7; k++)
	    	{
	    		h00 += A[i+3-k][j] * hfilter[k];
	    	}

	   		d[i][j] = d00>> 6;
	    	n[i][j] = n00>> 6;
	    	h[i][j] = h00>> 6;

			if (d[i][j] > 255)
			{
				d[i][j] = 255;
			}
			if (d[i][j] < 0)
			{
				d[i][j] = 0;
			}

			if (n[i][j] > 255)
			{
				n[i][j] = 255;
			}
			if (n[i][j] < 0)
			{
				n[i][j] = 0;
			}

			if (h[i][j] > 255)
			{
				h[i][j] = 255;
			}
			if (h[i][j] < 0)
			{
				h[i][j] = 0;
			}

		}
	}	

// Saida verticais
FILE* fp5 = fopen("./fprintf_referencia/PVPO.txt", "w");
for(int j=4; j<=11; j++)
	{
		for (int i=12; i>=4; i--)
		{	
			//printf("d[%d,%d] = %d\n", i, j, d[i][j]);
			fprintf(fp5, "%x\n", d[i][j]);	
		}  
		for (int i=12; i>=4; i--)
		{	
			//printf("h[%d,%d] = %d\n", i, j, h[i][j]);
			fprintf(fp5, "%x\n", h[i][j]);	
		} 	    
		for (int i=12; i>=4; i--)
		{	
			//printf("n[%d,%d] = %d\n", i, j, n[i][j]);
			fprintf(fp5, "%x\n", n[i][j]);	
		} 				
	}
fclose(fp5);

printf("\n");

//printf("PIXELS VERTICAIS DE SEGUNDA ORDEM\n");  //	Half & Quarter Filter Interpolation para pixel diagonais
int e00=0, f00=0, g00=0, i00=0, j00=0, k00=0, p00=0, q00=0, r00=0;
	for (int jl=3; jl<=11; jl++)
	{	
		for(int il=12; il>=4; il--)
		{
			e00=0; f00=0; g00=0;  p00=0; q00=0; r00=0;
	    	for(int k=0; k<=6; k++)
			{
				e00 += a[il+3-k][jl] * qfilter[k];
				f00 += b[il+3-k][jl] * qfilter[k];
				g00 += c[il+3-k][jl] * qfilter[k];
				p00 += a[il+2-k][jl] * rev_qfilter[k];
				q00 += b[il+2-k][jl] * rev_qfilter[k];
				r00 += c[il+2-k][jl] * rev_qfilter[k];
			}

			i00=0; j00=0; k00=0;
			for (int k=0; k<=7; k++)
	    	{
	    		i00 += a[il+3-k][jl] * hfilter[k];
				j00 += b[il+3-k][jl] * hfilter[k];
				k00 += c[il+3-k][jl] * hfilter[k];
	    	}
	   		
	   		e[il][jl] = e00>> 6;
	   		if (e[il][jl] > 255)
			{
				e[il][jl] = 255;
			}
			if (e[il][jl] < 0)
			{
				e[il][jl] = 0;
			}

	    	f[il][jl] = f00>> 6;
	    	if (f[il][jl] > 255)
			{
				f[il][jl] = 255;
			}
			if (f[il][jl] < 0)
			{
				f[il][jl] = 0;
			}

	    	g[il][jl] = g00>> 6;
	    	if (g[il][jl] > 255)
			{
				g[il][jl] = 255;
			}
			if (g[il][jl] < 0)
			{
				g[il][jl] = 0;
			}

	    	i[il][jl] = i00>> 6;
	    	if (i[il][jl] > 255)
			{
				i[il][jl] = 255;
			}
			if (i[il][jl] < 0)
			{
				i[il][jl] = 0;
			}

	    	j[il][jl] = j00>> 6;
	    	if (j[il][jl] > 255)
			{
				j[il][jl] = 255;
			}
			if (j[il][jl] < 0)
			{
				j[il][jl] = 0;
			}

	    	k[il][jl] = k00>> 6;
	    	if (k[il][jl] > 255)
			{
				k[il][jl] = 255;
			}
			if (k[il][jl] < 0)
			{
				k[il][jl] = 0;
			}
	    	p[il][jl] = p00>> 6;
	    	if (p[il][jl] > 255)
			{
				p[il][jl] = 255;
			}
			if (p[il][jl] < 0)
			{
				p[il][jl] = 0;
			}
	    	q[il][jl] = q00>> 6;
	    	if (q[il][jl] > 255)
			{
				q[il][jl] = 255;
			}
			if (q[il][jl] < 0)
			{
				q[il][jl] = 0;
			}
	    	r[il][jl] = r00>> 6;	
	    	if (r[il][jl] > 255)
			{
				r[il][jl] = 255;
			}
			if (r[il][jl] < 0)
			{
				r[il][jl] = 0;
			}
		}	
	}
// Saida
//printf("PIXELS VERTICAIS DE SEGUNDA ORDEM A\n");
FILE* fp6 = fopen("./fprintf_referencia/PVSO_a.txt", "w");

for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			printf("e[%d,%d] = %d\n", il, jl, e[il][jl]);
			fprintf(fp6, "%x\n", e[il][jl]);		
		}  
		for (int il=12; il>=4; il--)
		{	
			printf("i[%d,%d] = %d\n", il, jl, i[il][jl]);	
			fprintf(fp6, "%x\n", i[il][jl]);	
		} 	    
		for (int il=12; il>=4; il--)
		{	
			printf("p[%d,%d] = %d\n", il, jl, p[il][jl]);	
			fprintf(fp6, "%x\n", p[il][jl]);		
		} 				
	}
fclose(fp6);


//printf("PIXELS VERTICAIS DE SEGUNDA ORDEM B\n");
FILE* fp7 = fopen("./fprintf_referencia/PVSO_b.txt", "w");

for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			//printf("f[%d,%d] = %d\n", il, jl, f[il][jl]);	
			fprintf(fp7, "%x\n", f[il][jl]);
		}  
		for (int il=12; il>=4; il--)
		{	
			//printf("j[%d,%d] = %d\n", il, jl, j[il][jl]);
			fprintf(fp7, "%x\n", j[il][jl]);	
		} 	    
		for (int il=12; il>=4; il--)
		{	
			//printf("q[%d,%d] = %d\n", il, jl, q[il][jl]);	
			fprintf(fp7, "%x\n", q[il][jl]);	
		} 			
	}
fclose(fp7);


//printf("PIXELS VERTICAIS DE SEGUNDA ORDEM C\n");
FILE* fp8 = fopen("./fprintf_referencia/PVSO_c.txt", "w");

for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			//printf("g[%d,%d] = %d\n", il, jl, g[il][jl]);	
			fprintf(fp8, "%x\n", g[il][jl]);
		}  
		for (int il=12; il>=4; il--)
		{	
			//printf("k[%d,%d] = %d\n", il, jl, k[il][jl]);
			fprintf(fp8, "%x\n", k[il][jl]);	
		} 	    
		for (int il=12; il>=4; il--)
		{	
			//printf("r[%d,%d] = %d\n", il, jl, r[il][jl]);	
			fprintf(fp8, "%x\n", r[il][jl]);	
		} 			
	}
fclose(fp8);

// Lambda_R
FILE* fp9 = fopen("./fprintf_referencia/lambda_r.txt", "w");
//printf("Lambda_R\n");

	for (int i=0; i<=47; i++)
	{
		lambda_r[i]=rand() % MAX_PIXEL_VALUE;
		//printf("lambda_r[%d] = %d\n", i,lambda_r[i]);
		fprintf(fp9, "%x\n", lambda_r[i]);
	} 

fclose(fp9);

// Bloco Original
FILE* fp10 = fopen("./fprintf_referencia/Original_block.txt", "w");
//printf("Original Block\n");

	for (int j=0; j<=7; j++)
	{
		for (int i=0; i<=7; i++)
		{
			O[i][j]=rand() % MAX_PIXEL_VALUE;
			//printf("O[%d,%d] = %d\n", i, j, O[i][j]);
			fprintf(fp10, "%x\n", O[i][j]);
		}
	} 

fclose(fp10);


printf("Done\n");  
return 0;

}