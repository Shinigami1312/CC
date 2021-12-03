%{
#include "y.tab.h"
%}

alpha [A-Za-z]
digit [0-9]

%%
[\t] 	;  
[\n] 	;  
"exit"    return 0;  
if      return IF;
else    return ELSE;
while   return WHILE;
do      return DO;
for     return FOR;
"else if"    return EIF;
[0-9]+    return NUM;
{alpha}({alpha}|{digit})*    return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
"||"    return OR;
"&&"    return AND;
"){"    return B;
") {"   return B;
")\n{"   return B;
");"    return B;  
";}"    return B;
" "		;
.       return yytext[0];
%%

int yywrap()
{
return 1;
}