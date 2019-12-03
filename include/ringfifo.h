#ifndef __RINGFIFO_H__
#define __RINGFIFO_H__

struct ringbuf {
    unsigned char *buffer;
	int frame_type;
    int size;
	//unsigned long long timesnap;
};
int addring (int i);
int ringget(struct ringbuf *getinfo);
void ringput(unsigned char *buffer,int size,int encode_type);
void ringfree();
void ringmalloc(int size);
void ringreset();

#endif