#include <stdio.h>
#include <stdlib.h>

void permut(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void Tri(int n, int *T) {
    int i, j, min;
    for (i = 0; i <= n - 2; i++) {
        min = i;
        for (j = i + 1; j < n; j++) {
            if (*(T + j) < *(T + min)) {
                min = j;
            }
        }
        if (min != i) {
            permut(&T[i], &T[min]);
        }
    }
}

int main() {
    int T[] = {5, 2, 8, 1, 3};
    int n = sizeof(T) / sizeof(T[0]);
    Tri(n, T);
    printf("Tableau trié : ");
    for (int i = 0; i < n; i++) {
        printf("%d ", T[i]);
    }
    printf("\n");
    return 0;
}
