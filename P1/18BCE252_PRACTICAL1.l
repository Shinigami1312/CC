%{
#include<stdio.h>
int count=0;
%}

%%
END|end {return atoi(yytext);}

while|auto|break|case|char|const|continue|default|do|double|else {count++;printf("\n%s: Keyword",yytext);}

enum|extern|float|for|goto|if|int|long|register|return|short|signed {count++;printf("\n%s: Keyword",yytext);}

sizeof|static|struct|switch|typedef|union|unsigned|void|volatile {count++;printf("\n%s: Keyword",yytext);}

(\()|(\)) {count++;printf("\n%s: Function Brackets",yytext);}
(\{)|(\}) {count++;printf("\n%s: Block Brackets",yytext);}

(\+)|(\-)|(\*)|(\/)|(\^)|(\&)|(\&\&)|(\|)|(\|\|)|(=)|(==)|(.*)\?(.*): {count++;printf("\n%s: Operator",yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {count++;printf("\n%s: Identifier",yytext);}
[0-9]+ {count++;printf("\n%s: Integer",yytext);}


; {printf("\n%s: End of Statement",yytext);}
#include.*  {count++;printf("\n%s: Include File",yytext);}
#define.* {count++;printf("\n%s: Macro Definition",yytext);}

\".*\" {count++;printf("\n%s: String",yytext);}
.  ;
%%
int yywrap(){ 
	return 1;
}

int main(void) {
	 printf("\n Enter 'END' to end the program \n");
    printf("Enter Input- \n");
    yylex();
    printf("\n Total number of token found = %d \n", count);  
    return 0;
}

