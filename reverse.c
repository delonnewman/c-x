#include "cs-x.h"

void reverse(int *a, int length) {
    int *b = a + length - 1;
    while (a < b) {
        int tmp = *a;
        *a++ = *b;
        *b-- = tmp;
    }
}

int main() {
    int array[] = {1, 2, 3, 4, 5, 6, 7};
    int length = 7;

    print_array(array, length);
    reverse(array, length);
    print_array(array, length);

    return 0;
}
