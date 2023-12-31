#ifndef GLOBALS_H_
#define GLOBALS_H_

namespace ocf {

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// Old/new Win build
#ifdef WIN_R_BUILD
  #if __cplusplus < 201103L
    #define OLD_WIN_R_BUILD
  #else
    #define NEW_WIN_R_BUILD
  #endif
#endif

// Tree type.
enum TreeType {
  TREE_ORDERED = 3,
};

// Memory modes.
enum MemoryMode {
  MEM_DOUBLE = 0,
  MEM_FLOAT = 1,
  MEM_CHAR = 2
};
const unsigned int MAX_MEM_MODE = 2;

// Mask and Offset to store 2 bit values in bytes.
static const int mask[4] = {192,48,12,3};
static const int offset[4] = {6,4,2,0};

// Variable importance.
enum ImportanceMode {
  IMP_NONE = 0,
  IMP_GINI = 1,
  IMP_GINI_CORRECTED = 5,
  IMP_PERM_BREIMAN = 2,
  IMP_PERM_LIAW = 4,
  IMP_PERM_RAW = 3,
  IMP_PERM_CASEWISE = 6
};
const unsigned int MAX_IMP_MODE = 6;

// Split mode.
enum SplitRule {
  LOGRANK = 1
};

// Prediction types.
enum PredictionType {
  RESPONSE = 1,
  TERMINALNODES = 2
};

// Default values.
const unsigned int DEFAULT_NUM_TREE = 1000;
const unsigned int DEFAULT_NUM_THREADS = 0;
const ImportanceMode DEFAULT_IMPORTANCE_MODE = IMP_NONE;

const unsigned int DEFAULT_MIN_NODE_SIZE_ORDERED = 5;

const SplitRule DEFAULT_SPLITRULE = LOGRANK;
const double DEFAULT_ALPHA = 0.5;
const double DEFAULT_MINPROP = 0.1;

const unsigned int DEFAULT_MAXDEPTH = 0;
const PredictionType DEFAULT_PREDICTIONTYPE = RESPONSE;
const unsigned int DEFAULT_NUM_RANDOM_SPLITS = 1;

// Interval to print progress in seconds.
const double STATUS_INTERVAL = 10.0;

// Threshold for q value split method switch.
const double Q_THRESHOLD = 0.02;

} // namespace ocf

#endif /* GLOBALS_H_ */
