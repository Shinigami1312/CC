bison -y -d practical9.y
flex practical9.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o practical9.c -o practical9.exe
practical9.exe