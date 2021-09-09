#include "c-x.h"

void print_array(int array[], int length) {
    printf("[");
    for (int i = 0; i < length; ++i) {
        printf("%d", array[i]);
        if (i != length - 1) printf(",");
    }
    printf("]\n");
}
