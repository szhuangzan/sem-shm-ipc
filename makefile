CC = gcc -ggdb3 

CCC = g++ -ggdb3 

all : frontplug.out frontclient.out xmtest.out

frontplug.out:main.c  shm.c sem.c vsem.c frontdevice.c xmmanager.c commnvr.h commnvr.cpp TimeOutCheck.cpp posixsem.cpp jtprintf.c
	$(CCC) -m32 -g -Wall -o zhamponxm_SDK.exe jtprintf.c commnvr.cpp TimeOutCheck.cpp main.c posixsem.cpp shm.c sem.c vsem.c frontdevice.c xmmanager.c showstruct.cpp ./libxmnetsdk.so -lpthread -lrt

frontclient.out:clientmain.cpp shm.c shm.h sem.c sem.h vsem.c jtprintf.c
	$(CCC)  -Wall -o frontclient.out jtprintf.c showstruct.cpp clientmain.cpp shm.c sem.c vsem.c  -lpthread -lrt

xmtest.out:test.cpp
	g++ -m32 -o xmtest.out test.cpp ./libxmnetsdk.so


.PHONY : all


clean:
	rm -f *.out *.o *.exe 
