#ifndef SCREEN_H
#define SCREEN_H

void drawMainMenu(const char *ip_address, const char *ssids[], uint8_t num_ssids, uint8_t ssidsPerPage, uint8_t currentPage, uint8_t currentSelection);
void drawSelectedSSID(const char *ssid);
void hideAllSprites();

#endif
