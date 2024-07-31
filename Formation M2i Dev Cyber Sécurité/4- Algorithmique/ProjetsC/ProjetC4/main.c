#include<stdio.h>
#include<ctype.h>
#include<string.h>
#include<stdlib.h>

#define BUFFER_SIZE 100
struct Pile {
  int T[BUFFER_SIZE];
  int sommet;
};

int i, a, b;

int pilevide (struct Pile *p) {
   return (p->sommet == -1);
}

void init(struct Pile *p) {
   p->sommet = -1;
}

void empiler (struct Pile *p, int e) {
     p->sommet = p->sommet + 1;
     p->T[p->sommet] = e;
}

int depiler(struct Pile *p) {
   int x;
   x = p->T[p->sommet];
   p->sommet--;
   return x;
}

int evaluation(char *chaine, struct Pile *pile) {
   init(pile);
   i = 0;
    while (chaine[i] != '\0') {
        if (isdigit(chaine[i])) {
            b = chaine[i] - '0';
            printf("2. %d\n", b);
            empiler(pile, b);
        }
        else if (chaine[i] == '+')
            empiler(pile, depiler(pile) + depiler(pile));
        else
            empiler(pile, depiler(pile) * depiler(pile));
        printf("DEBUG: %d\n", pile->T[pile->sommet]);
        i++;
    }

    return depiler(pile);
}
void main() {
    char *ch = malloc(BUFFER_SIZE);
    struct Pile p_exp;
    printf("Donner une chaine: ");
    scanf("%s", ch);
    printf("1. %s\n", ch);
    a = evaluation(ch, &p_exp);
    printf("3. le résultat pour %s est %d", ch, a);
}
