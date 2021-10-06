#include "cs-x.h"

typedef struct Vector {
    int* array;
    int length;
    int max_size;
} Vector;

const int DEFAULT_SIZE = 1;

void vector_print(Vector* v) {
    print_array(v->array, v->length);
}

Vector* vector_create(int size) {
    Vector* v = malloc(sizeof(Vector));

    v->array = (int*)malloc(size * sizeof(int));
    v->length = 0;
    v->max_size = size;

    return v;
}

void vector_grow(Vector* v) {
    int *temp;

    if (v->length == v->max_size) {
        temp = (int*)malloc(v->max_size * sizeof(int));

        for (int i = 0; i < v->max_size; i++) {
            temp[i] = v->array[i];
        }

        v->array = temp;
        v->max_size = v->max_size * 2;
    }
}

void vector_push(Vector* v, int value) {
    if (v->length == v->max_size) {
        vector_grow(v);
    }

    v->array[v->length] = value;
    v->length++;
}

int vector_get(Vector* v, int index) {
    if (index >= v->length) {
        puts("error: the index you gave is out of bounds");
    }
    return v->array[index];
}

void vector_set(Vector* v, int index, int value) {
    v->array[index] = value;
}


int main(void) {
    Vector* v = vector_create(DEFAULT_SIZE);

    printf("Created a vector of size %d with %d elements\n", v->max_size, v->length);

    // 50: 31
    // 25: 15
    // 12: 7
    // 11: 8
    // 10: 8
    // 9: 8
    for (int i = 0; i < 12; i++) {
        vector_push(v, i);
    }

    printf("The vector now is of size %d has %d elements\n", v->max_size, v->length);

    vector_print(v);

    return EXIT_SUCCESS;
}
