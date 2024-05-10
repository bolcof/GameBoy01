
rmdir /s/q  "source\gen"
rmdir /s/q  "headers\gen"

mkdir "source\gen\graphics"
mkdir "headers\gen\graphics"


SET GBDK_HOME=E:\make_202008\GameBoy\gbdk-win64\gbdk
SET PNG2ASSET=%GBDK_HOME%/bin/png2asset.exe

:: Sprites
%PNG2ASSET% graphics\paddle.png -c source\gen\graphics\paddle.c  -sw 32 -sh 8 -spr8x8 -keep_palette_order -noflip
%PNG2ASSET% graphics\ball.png -c source\gen\graphics\ball.c -sw 8 -sh 8 -spr8x8 -keep_palette_order -noflip
%PNG2ASSET% graphics\allow.png -c source\gen\graphics\allow.c -sw 8 -sh 8 -spr8x8 -keep_palette_order -noflip
%PNG2ASSET% graphics\select.png -c source\gen\graphics\select.c -sw 18 -sh 5 -spr8x8 -keep_palette_order -noflip

:: Background Tiles
%PNG2ASSET% graphics\UserInterface.png -c source\gen\graphics\UserInterface.c -map -use_map_attributes  -keep_palette_order -noflip
%PNG2ASSET% graphics\Bricks.png -c source\gen\graphics\Bricks.c -map -use_map_attributes  -keep_palette_order -noflip
%PNG2ASSET% graphics\Font.png -c source\gen\graphics\Font.c -map -use_map_attributes  -keep_palette_order -noflip


:: move .h files to their proper location
FOR /R "source/gen/graphics/" %%X IN (*.h) DO (
    move "%%X" "%cd%/headers/gen/graphics/"
)