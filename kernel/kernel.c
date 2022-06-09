void enterpnt() {}

void main() {

    char *videomem[256] = (char*)0xb8000;
    *videomem = 'Welcome to operating system!';
}