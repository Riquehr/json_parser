
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%


[0-9]+  {
          yylval = atoi(yytext);
          return INT;
        }

[+]     {
          return SOMA;
        }
[*]     {
          return MULT;
        }
[(]     {
          return PARO;
        }
[)]     {
          return PARC;
        }
[:]    {
      return DOISPONTOS;
      }
[{]   {
      return OPENKEY;
      }
[}]   {
      return CLOSEKEY;
      }
[,]   {
      return VIRGULA;
      }
(["][a-zA-Z0-9]+["]) {
      	return STRING;
        }





\n   {
         return EOL;
       }

[ \t]+ ;

.     {yyerror("Token nao reconhecido!\n");}

%%

int yywrap() {
  return 1;
}
