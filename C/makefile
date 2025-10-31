##makefile for huffman
##J Holt

huffman: pq.o tree.o huffman.o
	gcc pq.o tree.o huffman.o -o huffman

huffman.o: huffman.h huffman.c
	gcc -c huffman.c

pq.o: pq.h pq.c
	gcc -c pq.c

tree.o: tree.h tree.c
	gcc -c tree.c
