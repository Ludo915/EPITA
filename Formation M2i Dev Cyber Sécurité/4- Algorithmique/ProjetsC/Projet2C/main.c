#include<stdio.h>
#include<ctype.h>
#include<string.h>
#include<stdlib.h>

struct pile {
  int T[100];
  int sommet;
};
int i,a,b;
struct pile p_exp;
char ch[100];
int pilevide (struct pile p)
{ return (p.sommet == -1);}
void init(struct pile p)
{ p_exp.sommet = -1; }
void empiler (struct pile p, int e)
{
     p.sommet=p.sommet+1;
     p.T[p.sommet] = e;
}
int depiler(struct pile p)
{
   int a;
   a = p.T[p.sommet]; p.sommet--;
   return a;
}
int evaluation(char chaine [100])
{
   init(p_exp);
   i = 0;
   while (chaine[i] != '\0')
   {
      if (isdigit(chaine[i]))
      {
        b =atoi(chaine+i);
        printf(b);
        empiler(p_exp, b);
      }

      else if (chaine[i] =='+')
         empiler(p_exp,depiler(p_exp)+depiler(p_exp));
      else
        empiler(p_exp, depiler(p_exp)*depiler(p_exp));
    i++;
    }
    return depiler(p_exp);
}

void saisie (char chaine[100])
{
   printf("donner une chaine\n");
   scanf("%s", chaine);
}

main()
{
   saisie(ch);// saisie post
   printf("%s", ch);
   a = evaluation(ch);
   printf("le résultat pour %s est %f", ch, a);
}
