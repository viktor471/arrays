#include <stdio.h>
#include <stdlib.h>

int main(){
/*		  int ***a = (int***)malloc(sizeof(int**)*3);
		  printf("a: %p\n", a);
  */    
		/*for(int i = 0; i < 3; i++){
				  a[i] = (int**)malloc(sizeof(int*)*4);	
			printf("a[%d]: %p\n", i, a[i]);	
		}*/
/*		int x[3][4];
		for(int i = 0; i < 3; i++)
				  for (int k = 0; k < 4; k++)
							 x[i][k] = i*10 + k;

		printf("x: %p\n", x);
		for (int i = 0; i < 3; i++)
		{       printf("			x[%d]: %p\n", i, x[i]);
				  for (int k = 0; k < 4; k++)
							 printf("&(x[%d][%d]) %p x[%d][%d] %d\n", i, k, &(x[i][k]), i, k, x[i][k]);
		}
		*/
		int e[6] = {1, 2, 3, 4, 5, 6};
		for(int i = 0; i < 6; i++) printf("%d\n", e[i]);

		int *r;
		r = &(e[2]);
		for(int i = 0; i < 4; i++ ) printf("&(r[%d]) %p r[%d] %d\n",i, &(r[i]), i, r[i]);

/*      int **single = (int**)malloc(sizeof(int*)*1);
		for(int i = 0; i < 3; i++) printf("single[%d]: %p\n", i, single++);
		printf("\n");
		for(int i = 0; i < 3; i++) printf("single[%d]: %p\n", i, single[i]);	
		int o =3;
		int *u = &o;

		for(int i = 0; i < 3; i++) printf("u[%d]: %p %d\n", i, u++, u[i]);	
	
		int q[3] = {9, 99, 999};
		u = q;
		for (int i = 0; i < 4; i++) printf("%p %d\n", &(u[i]), u[i]);	
		int *n = (int*)malloc(sizeof(int)*3);
*/
}

