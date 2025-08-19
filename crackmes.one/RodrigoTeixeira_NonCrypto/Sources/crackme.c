#include <stdio.h>

#define PASSWORD 1113772777

int hash(char* str) {
	int ret = 0xA5A5A5A5;
	while (*str) {
		ret = (ret << 5) - ret + *(str++);
	}
	return ret;
}

int auth() {
	char pass[16];
	gets(pass);
	return hash(pass) == PASSWORD;
}

void grant_access() {
	printf("Access granted");
	return;
}

int main() {
	if (auth()) {
		grant_access();
	}
}
