#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "dog.h"

//variables
DOG dog;
BONE bones[BONECOUNT];
int bonesRemaining;


void initializeGame() {
    //initialize dog and bones
    initializeDog();
    initializeBone();

    //initialize number of bones remaining
    bonesRemaining = BONECOUNT;

    // Initialize the colors
    unsigned short colors[NUMCOLORS] = {BLACK, BLUE, GREEN, RED, WHITE, GRAY};
    DMANow(3, dogPal, PALETTE, 256);
    for (int i = 0; i < NUMCOLORS; i++) {
        PALETTE[256-NUMCOLORS+i] = colors[i];
    }
}
void updateGame() {
    updateDog();
    //update all of the bones
    for (int i = 0; i < BONECOUNT; i++) {
        updateBone(&bones[i]);
    }
}
void drawGame() {
    fillScreen4(BLACKID);
    drawDog();
    //draw all of the bones
    for (int i = 0; i < BONECOUNT; i++) {
        drawBone(&bones[i]);
    }
}


void initializeDog() {
    dog.height = 20;
    dog.width = 20;
    dog.row = 130;
    dog.col = 220;
    dog.oldRow = dog.row;
    dog.oldCol = dog.col;
}
void updateDog() {
    //move the dog according to user input
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (dog.col + dog.width <= 239) {
            dog.col += 1;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (dog.col > 0) {
            dog.col -= 1;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (dog.row + dog.height <= 159) {
            dog.row += 1;
        }
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        if (dog.row > 0) {
            dog.row -= 1;
        }
    }
}
void drawDog() {
    //erase where dog was and draw where it is
    drawRect4(dog.oldCol, dog.oldRow, dog.width, dog.height, BLACKID);
    drawImage4(dog.col, dog.row, dog.width, dog.height, dogBitmap);

    //update old col and old row
    dog.oldCol = dog.col;
    dog.oldRow = dog.row;
}


void initializeBone() {
    for (int i = 0; i < BONECOUNT; i++) {
        bones[i].height = 5;
        bones[i].width = 15;
        bones[i].color = WHITEID;
        bones[i].row = rand() % 150 + 1;
        bones[i].col = rand() % 200 + 1;
        bones[i].active = 1;
        bones[i].erased = 0;
        bones[i].rDel = rand() % 4 - 2;
        bones[i].cDel = rand() % 4 - 2;
        bones[i].oldCol = bones[i].col;
        bones[i].oldRow = bones[i].row;
    }
}
void updateBone(BONE* b) {

    //if the dog collides with the bone, bone gets eaten
    if (b->active && collision(dog.col, dog.row, dog.width, dog.height, b->col, b->row, b->width, b->height)) {
        bonesRemaining--;
        b->active = 0;
    }
    //bounce bones off of walls
    if (b->row <= 0 || b->row + b->height - 1 >= 159) {
        b->rDel = -(b->rDel);
    }
    if (b->col + b->width >= 239 || b->col <= 0) {
        b->cDel = -(b->cDel);
    }

    //update position of bones based on speed
    b->row += b->rDel;
    b->col += b->cDel;
}
void drawBone(BONE* b) {
    //draw the bone if it's active
    if (b->active) {
        drawRect4(b->col, b->row, b->width, b->height, WHITEID);
    //erase the bone if it's not active anymore
    } else if (!b->erased) {
        drawRect4(b->col, b->row, b->width, b->height, BLACKID);
        b->erased = 1;
    }
    //update bone old col and old row
    b->oldCol = b->col;
    b->oldRow = b->row;
}