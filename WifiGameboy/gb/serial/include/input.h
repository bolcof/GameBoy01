#ifndef INPUT_H
#define INPUT_H

void updateSelection(uint8_t joypadState, uint8_t *currentSelection, uint8_t currentPage, uint8_t ssidsPerPage, uint8_t num_ssids);
void updatePage(uint8_t joypadState, uint8_t *currentPage, uint8_t ssidsPerPage, uint8_t num_ssids);

#endif
