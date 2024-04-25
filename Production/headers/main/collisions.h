#ifndef COLLISIONS_HEADER 
#define COLLISIONS_HEADER set


void DrawNumber3(uint8_t x,uint8_t y, uint16_t number,uint8_t digits);
void BounceAgainstTheWalls();
void CollidePaddleAgainstBall();
void CollideBricksAgainstBall();

#endif