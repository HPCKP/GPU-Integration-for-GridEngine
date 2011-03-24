#include <stdio.h>

main()
{

int MAXGPU=4;
int gpu[MAXGPU];
int i;
int gpufree;
FILE* gpustatus;

  FILE * uname;
  char linestatus;
  
//#inigpu

i=0;
while (i<MAXGPU)
{
	gpu[i]=0;
	i=i+1;
}
  //acemd
  gpustatus = popen("ps -axu| grep acemd|gawk -F: '{print $2}' | cut -d ' ' -f 5", "r");
  linestatus = fgetc(gpustatus);
  while (!feof(gpustatus))
  {
	if ((linestatus>='0'))
	{
		i=(int)linestatus-48;
        	//printf("BUSSY GPU %d\n", i);
		//test
		//if (i!=0)
			gpu[i]=1;
		//ftest
	}
  	linestatus = fgetc(gpustatus);
  } 
  pclose(gpustatus);
  //fiacemd
//#finigpu


i=0;
gpufree=-1;
while ((i<MAXGPU)&&(gpufree==-1))
{
	if (gpu[i]==0)
	{
		//#mark gpu as used
		gpu[i]=1;
		//#mark gpu as used
		gpufree=i;
	}	
	i=i+1;
}

//printf ("GPU free %i\n",gpufree);
printf ("%i\n",gpufree);

}
