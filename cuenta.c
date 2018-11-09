#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

int main(int argc, char *argv[])
{
	int num;
	FILE *file;
    
    char txtname[20],ftwname[20],ftimename[20];
    strcpy(txtname, argv[1]);
    strcpy(ftwname, argv[2]);
    strcpy(ftimename, argv[3]);
	//file = fopen("archivo.txt","r");
    file = fopen(txtname,"r");
	printf("Entro!");

	char str[12];  // To get counter as string
	char c; //To get every character in the textfile
	if(file == NULL)
	{
	printf("Error!");   
	exit(1);             
	}

	
	int arr[5]={};  //Array to count 1, 12, 123, 1234, 12345 occurrences
    int * parr;
	int i,cont=0,ncont=0; 
	int terminado=0;  // 1 if reach the end of one of the numbers above
	int arrlen=sizeof(arr)/sizeof(int);
    


    parr=arr;
	for(i=0;i<arrlen;i++){

		printf("arr[%d]=%d\n",i,arr[i]);
	}

	printf("tamaño del arreglo de salida es %d\n",arrlen);
	

    clock_t start, end;
    double cpu_time_used;
     
    start = clock();
    
	printf("-------------------------- \n");
	while ((c = fgetc(file)) != EOF){
		int ic = c - '0';
        //printf("contador= %d\n",cont);
		//printf("%d \n",ic);
		if(ic==1){
            if(cont>=1){
                //printf("suma por un uno\n");
                *(parr+cont-1)+=1;
            }
			cont=1;
		}
		else if(cont>=1)
        {
			if(ic==cont+1){
				cont++;
			}
            
            else{
                //printf("suma por interrupcion en secuencia \n");
                *(parr+cont-1)+=1;
                cont=0;
            }
		}
        else{
            cont=0;
        }
    if(cont>=1){
        
    }
        


	}	

	printf("-------------------------- \n");
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;

	for(i=0;i<arrlen;i++){

		printf("arr[%d]=%d\n",i,arr[i]);
	}
	fclose(file);
    
    
    // Write result and computing time
    
    FILE *ftw;
    //ftw = fopen("cuenta.txt","w+");
    
    ftw = fopen(ftwname,"w+");
    
    for(i=0;i<arrlen;i++) {
        fprintf(ftw,"%d\n",arr[i]); // Escribir en el archivo
     }  
    fclose(ftw);
    
    
    // execution time
    
    printf("Duration: %f\n",cpu_time_used);
    FILE *ftime;
    //ftime = fopen("tiempo.txt","w+");
    ftime = fopen(ftimename,"w+");
    fprintf(ftime,"%f",cpu_time_used); // Escribir en el archivo
    
    fclose(ftime);
    
    
    
	return 0;
}
