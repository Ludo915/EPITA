#include<stdio.h>
int n, i_d, i_f, i,j, max, somme, T[20];
main()
{
  do
  {
   printf("donner un entier strictement positif\n");
   scanf("%d", &n);
  }
  while(n<=0);
  for (i=0; i<n; i++)
  {
 printf("donner entiernum%d", i+1);
      scanf("%d", &T[i]);
  }
  max = T[0]; i_d=0; i_f=0;
  for(i=0;i<n; i++)
  {
     somme = 0;
     for(j=i; j<n; j++)
     {somme = somme + T[j];
         if(somme > max)
         {max = somme; i_d = i;i_f=j;}
     }
  }
  printf("la plus grande sequence est = %d etcommence a %d et se trmine a %d", max, i_d, i_f);
}
