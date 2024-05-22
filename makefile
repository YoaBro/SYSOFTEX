#Define compiler
CC = gcc
#Define any directories containing header files other than /usr/include
AR = ar
#Define any compile-time flags
FLAGS = -Wall -g

#Define object files
OBJECTS_MAIN = main.o
OBJECTS_BASIC = basicClassification.o 
OBJECTS_LOOP = advancedClassificationLoop.o 
OBJECTS_RECURSION = advancedClassificationRecursion.o





all: mains maindloop maindrec loops recursives loopd recursived

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so


libclassloops.a: $(OBJECTS_LOOP) $(OBJECTS_BASIC) 
	$(AR) -rcs libclassloops.a $(OBJECTS_LOOP) $(OBJECTS_BASIC)

libclassrec.a: $(OBJECTS_RECURSION) $(OBJECTS_BASIC)
	$(AR) -rcs libclassrec.a $(OBJECTS_RECURSION) $(OBJECTS_BASIC)


libclassloops.so: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	$(CC) -shared -o libclassloops.so $(OBJECTS_LOOP) $(OBJECTS_BASIC)

libclassrec.so: $(OBJECTS_RECURSION) $(OBJECTS_BASIC)
	$(CC) -shared -o libclassrec.so $(OBJECTS_RECURSION) $(OBJECTS_BASIC)


main.o: main.c NumClass.h 
	$(CC) $(CFLAGS) -c main.c -o $@

basicClassification.o: basicClassification.c NumClass.h
	$(CC) $(CFLAGS) -c basicClassification.c -o $@

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationLoop.c -o $@

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	$(CC) $(CFLAGS) -c advancedClassificationRecursion.c -o $@


make clean:
	rm *.o *.so *.a mains maindloop maindrec