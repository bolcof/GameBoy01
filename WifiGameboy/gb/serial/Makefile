CC = ../../gbdk/bin/lcc
CFLAGS = -Wa-l -Wl-m -Wl-j -Iinclude
BUILD_DIR = build

# ソースファイルとヘッダファイルのパス
SRC = src
INC = include

# ソースファイル
SRCS = $(SRC)/main.c $(SRC)/screen.c $(SRC)/input.c $(SRC)/sprite.c 

# オブジェクトファイル
OBJS = $(BUILD_DIR)/main.o $(BUILD_DIR)/screen.o $(BUILD_DIR)/input.o $(BUILD_DIR)/sprite.o 

# 出力ファイル
OUTPUT = $(BUILD_DIR)/serial.gb

# ターゲットの依存関係とルール
all: $(OUTPUT)

$(OUTPUT): $(OBJS)
	$(CC) $(CFLAGS) -o $(OUTPUT) $(OBJS)

# オブジェクトファイルのルール
$(BUILD_DIR)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OUTPUT) $(OBJS)
