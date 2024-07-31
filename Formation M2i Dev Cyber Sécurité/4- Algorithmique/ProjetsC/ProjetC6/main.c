#include <stdio.h>
#include <stdlib.h>

struct eleve {
    char nom[30];
    char prenom[30];
    char ident[7];
    float moyenne;
};

void saisie(struct eleve *Tab, int *nb) {
    int i;
    printf("Donner le nombre d'élèves : ");
    scanf("%d", nb);
    for (i = 0; i < *nb; i++) {
        printf("Donner le nom de l'élève numéro %d\n", i);
        scanf("%s", Tab[i].nom);
        printf("Donner le prénom de l'élève numéro %d\n", i);
        scanf("%s", Tab[i].prenom);
        printf("Donner l'identifiant de l'élève numéro %d\n", i);
        scanf("%s", Tab[i].ident);
        printf("Donner la moyenne de l'élève numéro %d\n", i);
        scanf("%f", &Tab[i].moyenne);
    }
}

void Tri(struct eleve *Tab, int n) {
    int min, i, j;
    struct eleve temp;
    for (i = 0; i < n - 1; i++) {
        min = i;
        for (j = i + 1; j < n; j++)
            if (Tab[j].moyenne < Tab[min].moyenne)
                min = j;
        if (i != min) {
            temp = Tab[i];
            Tab[i] = Tab[min];
            Tab[min] = temp;
        }
    }
}

void affiche(struct eleve *T, int n) {
    int i;
    for (i = 0; i < n; i++) {
        printf("%s %s %s %.2f\n", T[i].nom, T[i].prenom, T[i].ident, T[i].moyenne);
    }
}

int main() {
    int n;
    struct eleve T[35];
    saisie(T, &n);
    Tri(T, n);
    affiche(T, n);
    return 0;
}
