static int point_x = 0;
static int point_y = 0;
static int fill_column_area = 80;
static int fill_line_area = 25;
static int each_fill_element = 2;

void __clearscreen(char* videomem) {
  while(point_y < fill_column_area * fill_line_area * each_fill_element) {
    videomem[point_y] = ' ';
    videomem[point_y+1] = 0x04;
    point_y += 2;
  }   
}

void __printmsg(const char* msg, char* videomem) {
   while(msg[point_y] != '\0') {
     videomem[point_x] = msg[point_y];
     videomem[point_x+1] = 0x04;
     ++point_y;
     point_x += 2;
   }
}

void main(void) {
   const char *welcome_msg = "Welcome to Operating System!";
   char *videomem = (char*)0xb8000;
   __clearscreen(videomem);
   __printmsg(welcome_msg, videomem);
}
