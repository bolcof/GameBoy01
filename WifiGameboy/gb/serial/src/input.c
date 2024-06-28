#include <gb/gb.h>
#include <stdint.h>
#include "input.h"

void updateSelection(uint8_t joypadState, uint8_t *currentSelection, uint8_t currentPage, uint8_t ssidsPerPage, uint8_t num_ssids) {
    uint8_t oldSelection = *currentSelection;
    uint8_t firstIndexOfPage = currentPage * ssidsPerPage;
    uint8_t lastIndexOfPage = firstIndexOfPage + ssidsPerPage - 1;
    if (currentPage == (num_ssids / ssidsPerPage)) {
        lastIndexOfPage = num_ssids - 1;
    }

    if (joypadState & J_UP) {
        if (*currentSelection > firstIndexOfPage) {
            (*currentSelection)--;
        }
    }
    if (joypadState & J_DOWN) {
        if (*currentSelection < lastIndexOfPage) {
            (*currentSelection)++;
        }
    }
}

void updatePage(uint8_t joypadState, uint8_t *currentPage, uint8_t ssidsPerPage, uint8_t num_ssids) {
    uint8_t oldPage = *currentPage;
    if (joypadState & J_LEFT) {
        if (*currentPage > 0) {
            (*currentPage)--;
        }
    }
    if (joypadState & J_RIGHT) {
        if (*currentPage < (num_ssids / ssidsPerPage)) {
            (*currentPage)++;
        }
    }
}
