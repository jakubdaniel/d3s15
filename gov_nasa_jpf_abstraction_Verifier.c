#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

#include "gov_nasa_jpf_abstraction_Verifier.h"

static bool init = false;

JNIEXPORT jint JNICALL Java_gov_nasa_jpf_abstraction_Verifier_unknownInt (JNIEnv* env, jclass class) {
    if (!init) {
        srand(time(NULL));
        init = true;
    }
    return rand();
}
