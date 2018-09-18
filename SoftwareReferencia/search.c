#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PIXEL_VALUE 255

int main() {

int O[8][8];
int a[16][16], b[16][16], c[16][16], d[16][16], h[16][16], n[16][16], e[16][16], f[16][16], g[16][16], i[16][16], j[16][16], k[16][16], p[16][16], q[16][16], r[16][16];
int lambda_r[48], SAD[48], reg[48];


 													//--- Load values ---//

FILE *fp0 = fopen(".././fprintf_referencia/Original_block.txt", "r");
if (fp0 == NULL)
{
	printf("Erro\n");
}

	for (int j=0; j<=7; j++)
	{
		for (int i=0; i<=7; i++) // Load a column first
		{
			fscanf(fp0, "%x\n", &O[i][j]);
			//printf("O[%d,%d] = %x\n", i, j, O[i][j]);
		}
	}
fclose(fp0);

FILE *fp1 = fopen(".././fprintf_referencia/lambda_r.txt", "r");
if (fp1 == NULL)
{
	printf("Erro\n");
}

	for (int i=0; i<=47; i++)
	{
		fscanf(fp1, "%x\n", &lambda_r[i]);
	} 
fclose(fp1);

FILE* fp2 = fopen(".././fprintf_referencia/PH_a.txt", "r");
if (fp2 == NULL)
{
	printf("Erro\n");
}

for(int j=3; j<=11; j++)
	{
		for (int i=0; i<=15; i++)
		{	
			fscanf(fp2, "%x\n", &a[i][j]);
		} 
	} 
fclose(fp2);

FILE* fp3 = fopen(".././fprintf_referencia/PH_b.txt", "r");
if (fp3 == NULL)
{
	printf("Erro\n");
}

for(int j=3; j<=11; j++)
	{
		for (int i=0; i<=15; i++)
		{	
			fscanf(fp3, "%x\n", &b[i][j]);
		} 
	} 
fclose(fp3);

FILE* fp4 = fopen(".././fprintf_referencia/PH_c.txt", "r");

if (fp4 == NULL)
{
	printf("Erro\n");
}

for(int j=3; j<=11; j++)
	{
		for (int i=0; i<=15; i++)
		{	
			fscanf(fp4, "%x\n", &c[i][j]);
		} 
	} 
fclose(fp4);

FILE* fp5 = fopen(".././fprintf_referencia/PVPO.txt", "r");
if (fp5 == NULL)
{
	printf("Erro\n");
}

for(int j=4; j<=11; j++)
	{
		for (int i=12; i>=4; i--)
		{	
			
			fscanf(fp5, "%x\n", &d[i][j]);	
		}  
		for (int i=12; i>=4; i--)
		{	
			fscanf(fp5, "%x\n", &h[i][j]);
		} 	    
		for (int i=12; i>=4; i--)
		{	
			fscanf(fp5, "%x\n", &n[i][j]);	
		} 				
	}
fclose(fp5);

FILE* fp6 = fopen(".././fprintf_referencia/PVSO_a.txt", "r");

if (fp6 == NULL)
{
	printf("Erro\n");
}


for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp6, "%x\n", &e[il][jl]);	
		}  
		for (int il=12; il>=4; il--)
		{		
			fscanf(fp6, "%x\n", &i[il][jl]);	
			//printf("i[%d,%d] = %x\n", il, jl, i[il][jl]);	
		} 	    
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp6, "%x\n", &p[il][jl]);			
		} 				
	}
fclose(fp6);

FILE* fp7 = fopen(".././fprintf_referencia/PVSO_b.txt", "r");

if (fp7 == NULL)
{
	printf("Erro\n");
}


for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp7, "%x\n", &f[il][jl]);
		}  
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp7, "%x\n", &j[il][jl]);	
		} 	    
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp7, "%x\n", &q[il][jl]);	
		} 			
	}
fclose(fp7);


//printf("PIXELS VERTICAIS DE SEGUNDA ORDEM C\n");
FILE* fp8 = fopen(".././fprintf_referencia/PVSO_c.txt", "r");

if (fp8 == NULL)
{
	printf("Erro\n");
}

for(int jl=3; jl<=11; jl++)
	{
		for (int il=12; il>=4; il--)
		{	
			fscanf(fp8, "%x\n", &g[il][jl]);
		}  
		for (int il=12; il>=4; il--)
		{
			fscanf(fp8, "%x\n", &k[il][jl]);	
		
		} 	    
		for (int il=12; il>=4; il--)
		{		
			fscanf(fp8, "%x\n", &r[il][jl]);	
		} 			
	}
fclose(fp8);
												//--- SAD ---//

for (int i=0; i<=47; i++)
	{
		SAD[i] = lambda_r[i]; // Initialize SAD with the lambda_r value.
	}

for (int i=0; i<=7; i++)
	{
		for (int j=0; j<=7; j++)
		{	
			// Horizontal PixelsX
			reg[21] = O[i][j] - a[i+4][j+3];
				SAD[21] = abs (reg[21]) + SAD[21];
			reg[22] = O[i][j] - b[i+4][j+3];
				SAD[22] = abs (reg[22]) + SAD[22];
			reg[23] = O[i][j] - c[i+4][j+3];
				SAD[23] = abs (reg[23]) + SAD[23];
			reg[24] = O[i][j] - a[i+4][j+4];
				SAD[24] = abs (reg[24]) + SAD[24];
			reg[25] = O[i][j] - b[i+4][j+4];
				SAD[25] = abs (reg[25]) + SAD[25];
			reg[26] = O[i][j] - c[i+4][j+4];
				SAD[26] = abs (reg[26]) + SAD[26];

			// First Order Vertical Pixels
			reg[3] = O[i][j] - d[i+5][j+4];
				SAD[3] = abs (reg[3]) + SAD[3];
			reg[10] = O[i][j] - h[i+5][j+4];
				SAD[10] = abs (reg[10]) + SAD[10];
			reg[17] = O[i][j] - n[i+5][j+4];
				SAD[17] = abs (reg[17]) + SAD[17];
			reg[30] = O[i][j] - d[i+4][j+4];
				SAD[30] = abs (reg[30]) + SAD[30];
			reg[37] = O[i][j] - h[i+4][j+4];
				SAD[37] = abs (reg[37]) + SAD[37];
			reg[44] = O[i][j] - n[i+4][j+4];
				SAD[44] = abs (reg[44]) + SAD[44];
		}
	}

for (int y=0; y<=7; y++) // Switched from il and jl to x and y, just coz.
	{
		for (int x=0; x<=7; x++)
		{	
			// Second Order Vertical Pixels
			reg[0] = O[x][y] - e[x+5][y+3];
				SAD[0] = abs (reg[0]) + SAD[0];
			reg[4] = O[x][y] - e[x+5][y+4];
				SAD[4] = abs (reg[4]) + SAD[4];
			reg[27] = O[x][y] - e[x+4][y+3];
				SAD[27] = abs (reg[27]) + SAD[27];
			reg[31] = O[x][y] - e[x+4][y+4];
				SAD[31] = abs (reg[31]) + SAD[31];
			reg[1] = O[x][y] - f[x+5][y+3];
				SAD[1] = abs (reg[1]) + SAD[1];
			reg[5] = O[x][y] - f[x+5][y+4];
				SAD[5] = abs (reg[5]) + SAD[5];
			reg[28] = O[x][y] - f[x+4][y+3];
				SAD[28] = abs (reg[28]) + SAD[28];
			reg[32] = O[x][y] - f[x+4][y+4];
				SAD[32] = abs (reg[32]) + SAD[32];
			reg[2] = O[x][y] - g[x+5][y+3];
				SAD[2] = abs (reg[2]) + SAD[2];
			reg[6] = O[x][y] - g[x+5][y+4];
				SAD[6] = abs (reg[6]) + SAD[6];
			reg[29] = O[x][y] - g[x+4][y+3];
				SAD[29] = abs (reg[29]) + SAD[29];
			reg[33] = O[x][y] - g[x+4][y+4];
				SAD[33] = abs (reg[33]) + SAD[33];
			reg[7] = O[x][y] - i[x+5][y+3];
				SAD[7] = abs (reg[7]) + SAD[7];
			reg[11] = O[x][y] - i[x+5][y+4];
				SAD[11] = abs (reg[11]) + SAD[11];
			reg[34] = O[x][y] - i[x+4][y+3];
				SAD[34] = abs (reg[34]) + SAD[34];
			reg[38] = O[x][y] - i[x+4][y+4];
				SAD[38] = abs (reg[38]) + SAD[38];
			reg[8] = O[x][y] - j[x+5][y+3];
				SAD[8] = abs (reg[8]) + SAD[8];
			reg[12] = O[x][y] - j[x+5][y+4];
				SAD[12] = abs (reg[12]) + SAD[12];
			reg[35] = O[x][y] - j[x+4][y+3];
				SAD[35] = abs (reg[35]) + SAD[35];
			reg[39] = O[x][y] - j[x+4][y+4];
				SAD[39] = abs (reg[39]) + SAD[39];
			reg[9] = O[x][y] - k[x+5][y+3];
				SAD[9] = abs (reg[9]) + SAD[9];
			reg[13] = O[x][y] - k[x+5][y+4];
				SAD[13] = abs (reg[13]) + SAD[13];
			reg[36] = O[x][y] - k[x+4][y+3];
				SAD[36] = abs (reg[36]) + SAD[36];
			reg[40] = O[x][y] - k[x+4][y+4];
				SAD[40] = abs (reg[40]) + SAD[40];
			reg[14] = O[x][y] - p[x+5][y+3];
				SAD[14] = abs (reg[14]) + SAD[14];
			reg[18] = O[x][y] - p[x+5][y+4];
				SAD[18] = abs (reg[18]) + SAD[18];
			reg[41] = O[x][y] - p[x+4][y+3];
				SAD[41] = abs (reg[41]) + SAD[41];
			reg[45] = O[x][y] - p[x+4][y+4];
				SAD[45] = abs (reg[45]) + SAD[45];
			reg[15] = O[x][y] - q[x+5][y+3];
				SAD[15] = abs (reg[15]) + SAD[15];
			reg[19] = O[x][y] - q[x+5][y+4];
				SAD[19] = abs (reg[19]) + SAD[19];
			reg[42] = O[x][y] - q[x+4][y+3];
				SAD[42] = abs (reg[42]) + SAD[42];
			reg[46] = O[x][y] - q[x+4][y+4];
				SAD[46] = abs (reg[46]) + SAD[46];
			reg[16] = O[x][y] - r[x+5][y+3];
				SAD[16] = abs (reg[16]) + SAD[16];
			reg[20] = O[x][y] - r[x+5][y+4];
				SAD[20] = abs (reg[20]) + SAD[20];
			reg[43] = O[x][y] - r[x+4][y+3];
				SAD[43] = abs (reg[43]) + SAD[43];
			reg[47] = O[x][y] - r[x+4][y+4];
				SAD[47] = abs (reg[47]) + SAD[47];
		}
	
	}

	 int minimum,location = 1;
    	
    	minimum = SAD[0];
 
    for (int c = 1; c < 47; c++) 
     {
         if ( SAD[c] < minimum ) 
        {
           minimum = SAD[c];
           location = c;
        }
    } 
 
 	printf("Minimum SAD = %d\n", minimum);
 	printf("Location (Old mapping) = %d\n", location);


FILE* fp9 = fopen(".././fprintf_referencia/best_SAD.txt", "w");

if (fp9 == NULL)
{
	printf("Erro\n");
}

	fprintf(fp9, "%d\n", minimum);

fclose(fp9);

 
printf("Done\n");

return 0;

}

