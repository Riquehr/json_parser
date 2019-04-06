%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);
int sucesso=0;
%}

%token INT SOMA MULT EOL PARO PARC STRING DOISPONTOS CLOSEKEY OPENKEY VIRGULA





%%

PROGRAMA:
	PROGRAMA JSON EOL {
		sucesso=1;
	}
    |
    ;


JSON:
    OBJ {
      sucesso=1;
    }
    |
    ;

OBJ:
  OPENKEY COBJ CLOSEKEY {
  //  printf("Objeto entre chaves\n");
  }
  ;

COBJ:
  STRING DOISPONTOS VALOR {
    //printf("Encontrei um Conteudo de objeto \n");
  }
  |
   COBJ VIRGULA COBJ{
    //printf("Conteudo de objeto virgula Conteudo\n");
  }
  ;
VALOR:
  STRING{
  // printf("String Valor\n");
  }
  |
  INT{
//printf("inteiro valor\n");
  }




%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
  yyparse();
  if(sucesso==1){
  printf("VALIDO\n");
  }else
    printf("INVALIDO\n");

  return 0;

}
