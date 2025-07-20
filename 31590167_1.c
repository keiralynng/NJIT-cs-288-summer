#include <stdio.h>
#include <ctype.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    printf("argv     | ");
    unsigned char *p = (unsigned char *)&argv;
    for (int i = 7; i >= 0; i--) {
        printf("%02hhx ", *(p + i));
    }
    printf("| %p\n\n", (void *)argv);

    for (int i = 0; i < argc; i++) {
        unsigned char *q = (unsigned char *)&argv[i];
        printf("argv[%d]  | ", i);
        for (int j = 7; j >= 0; j--) {
            printf("%02hhx ", *(q + j));
        }
        printf("| %p\n", (void *)argv[i]);
    }

    unsigned char *start = (unsigned char *)argv[0];
    unsigned char *end = (unsigned char *)argv[argc - 1];

    while (*end != '\0') {
        end++;
    }
    end++;  

    while ((unsigned long)end % 8 != 0) {
        end++;
    }

    printf("\n");

    for (unsigned char *ptr = start; ptr < end; ptr += 8) {
        printf("|");
        for (int j = 0; j < 8; j++) {
            unsigned char byte = ptr[j];
            printf("%02hhx", byte);

            if (isprint(byte)) {
                printf("(%c)", byte);
            } else if (byte == '\0') {
                printf("(\\0)");
            } else {
                printf("(.)");
            }

            printf(" ");
        }
        printf("| %p\n", (void *)ptr);
    }
}
