import sys
from math import ceil

def calcula (modulos, jogadores, X=6):
    chaves = modulos * 7
    minutos = int(ceil(X * (1.0 / jogadores) * chaves))
    return chaves, minutos

def imprime(X=6):
    print("\n","FUGA DO LABORATÓRIO".center(50))
    print("\n\nTabela de (Chaves necessárias, total de minutos)\n")
    print(f"Dificuldade: {X}\n")
    print ("jogadores" + "".join(f"|\t{p}\t" for p in range(2,7)) + "|")
    print ("módulos  " + "".join("|\t\t" for p in range(2,7)) + "|")
    for modulos in range(1, 10):
        linha = []
        for jogadores in range(2, 7):
            linha.append(calcula (modulos, jogadores, X))
        print (f"{modulos}".center(len("jogadores")) +  "".join("|\t%s\t" % str(linha[p])[1:-1] for p in range(0,5)) + "|")
    print()

if __name__ == "__main__":
    dificuldade = float(sys.argv[1]) if len(sys.argv) >= 2 else 6
    imprime(dificuldade)
