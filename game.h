//bone struct
typedef struct bone {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int rDel;
    int cDel;
    int height;
    int width;
    unsigned char color;
    int active;
    int erased;
} BONE;

//dog struct
typedef struct dog {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int height;
    int width;
} DOG;


// Custom Game Colors
#define NUMCOLORS 6
// This does an enum trick to make them the last indeces of the palette
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];


//constants
#define BONECOUNT 10

// variables
extern DOG dog;
extern BONE bones[BONECOUNT];
extern int bonesRemaining;

//game prototypes
void initializeGame();
void updateGame();
void drawGame();
//dog prototypes
void initializeDog();
void updateDog();
void drawDog();
//bone prototypes
void initializeBone();
void updateBone(BONE *);
void drawBone(BONE *);