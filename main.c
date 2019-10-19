#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "game.h"
#include "start.h"
#include "pause.h"
#include "dog.h"

// prototypes
void initialize();

// state Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();

// States
enum {START, PAUSE, GAME, WIN};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case PAUSE:
                pause();
                break;
            case GAME:
                game();
                break;
            case WIN:
                win();
                break;
        }

    }
}

// Sets up GBA
void initialize() {

    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {

    //DMANow to load in start Pal
    DMANow(3, StartPal, PALETTE, 256);
    //draw start screen
    drawFullscreenImage4(StartBitmap);


    //initialize some colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }

    drawString4(90, 70, "Press Enter to start", GREENID);
    drawString4(100, 80, "collecting bones", GREENID);

    waitForVBlank();
    flipPage();

    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {

    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);
        initializeGame();
        goToGame();
        
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};
    DMANow(3, dogPal, PALETTE, 256);
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    // Update the score
    sprintf(buffer, "Bones Remaining: %d", bonesRemaining);
    drawString4(1, 150, buffer, WHITEID);

    waitForVBlank();
    flipPage();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (bonesRemaining == 0) {
        goToWin();
    }
}

void goToPause() {
    //load pause screen palette
    DMANow(3, pausePal, PALETTE, 256);

    //draw the pause screen
    drawFullscreenImage4(pauseBitmap);
    drawString4(80, 40, "Take your time", BLACKID);

    waitForVBlank();
    flipPage();

    state = PAUSE;
}

void pause() {
    waitForVBlank();

    //state transition
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
}

// Sets up the win state
void goToWin() {
    //draw win state
    fillScreen4(GREENID);
    drawString4(80, 60, "Congrats! You won!", BLACKID);
    drawString4(60, 80, "Press Enter to play again", BLACKID);

    waitForVBlank();
    flipPage();


    state = WIN;
}

// Runs every frame of the win state
void win() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToStart();
}
