.PHONY: release debug preprocessor

default: release

release:
	gcc -shared -fPIC -O3 -std=c99 -o bin/8051_ASM.so 8051_ASM/8051_ASM.c
	gcc -shared -fPIC -Os -std=c99 -o bin/hex_reader.so Intel_HEX_reader/HEX_reader.c
	gcc -fPIC -ldl -Os -std=c99 -o bin/launcher Launcher/launcher.c
	chmod +x bin/launcher

debug:
	gcc -shared -fPIC -std=c99 -o bin/8051_ASM.so 8051_ASM/8051_ASM.c
	gcc -shared -fPIC -std=c99 -o bin/hex_reader.so Intel_HEX_reader/HEX_reader.c
	gcc -fPIC -ldl -std=c99 -o bin/launcher Launcher/launcher.c
	chmod +x bin/launcher

preprocessor:
	gcc -E -std=c99 *.c | sed 's/^#/\/\//' > *.pp.c
