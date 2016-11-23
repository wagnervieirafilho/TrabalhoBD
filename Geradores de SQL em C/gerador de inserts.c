//Wagner vieira
#include <stdio.h>
#include <string.h>

#define TAM 500
int main(int argc, char *argv[]){
	FILE *arqEntrada;
	FILE *arqSaida;

	char url[] = "/home/wagner/Documentos/SourceCodes/UFRJ/BD/Trabalho/Dados/bairros.csv";
	char urlSaida[] = "/home/wagner/Documentos/SourceCodes/UFRJ/BD/Trabalho/Dados/BAIRRO.sql";

	char linha[TAM]	;
	char linhaSemFrescura[TAM];

	char bairro[50];
	char latitude[50];
	char longitude[50];

	char letra;
	
	int tamanhoLinha;
	int i,j;

	arqEntrada = fopen(url,"r");
	arqSaida = fopen(urlSaida, "w");

	while(!feof(arqEntrada)){
		fgets(linha,TAM,arqEntrada);
		tamanhoLinha = strlen(linha);
		j = 0;
		for(i = 0; i < tamanhoLinha-2; i++){
			if(linha[i] != ',' && linha[i] != '"'){
				linhaSemFrescura[j] = linha[i];
				j++;                                           // gera a cada linha sem aspas e virgulas

			}
			else{
				if(linha[i] == ','){
					linhaSemFrescura[j] = '|';
					j++;

				}
				if(linha[i] == '"'){}
			}
		}
		linhaSemFrescura[j] = '|';
		for(i = j+1; i < TAM; i++)
			linhaSemFrescura[i] = '\0';

		///////////////////////////////////////////////////////////////////////////////////////////////////
		i = 0;
		letra = linhaSemFrescura[i];
		while(letra != '|'){
			strncat(bairro, &letra, 1);
			i++;								// separou o bairro
			letra = linhaSemFrescura[i];            
		}

		///////////////////////////////////////////////////////////////////////////////////////////////////
		i++;
		letra = linhaSemFrescura[i];
		while(letra != '|'){
			strncat(latitude, &letra, 1);
			i++;								 // separou a latitude
			letra = linhaSemFrescura[i];         
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////

		i++;
		letra = linhaSemFrescura[i];
		while(letra != '|'){
				strncat(longitude, &letra, 1);
				i++;								// separou a longitude
				letra = linhaSemFrescura[i];         
		}

		////////////////////////////////////////////////////////////////////////////////////////////////////

		fprintf(arqSaida, "insert into BAIRRO values ('%s','%s','%s');\n", bairro, longitude, latitude);
		

		strcpy(latitude, "");
		strcpy(longitude, "");
		strcpy(bairro, "");

	}

	fclose(arqEntrada);
	fclose(arqSaida);
}