import mysql.connector

conexao = mysql.connector.connect(
    host='localhost',
    user='root',
    password='302302',
    database='animais'
)
cursor = conexao.cursor()

while True:
    escolha = input(f'\n'
                    f'-----------------------\n'
                    f'---------CRIAR---------\n'
                    f'----------LER----------\n'
                    f'-------ATUALIZAR-------\n'
                    f'--------DELETAR--------\n'
                    f'-----------------------\n'
                    f'\nEscolha sua ação: ')

    if escolha == "criar" or escolha == "criar".upper():
        tabela = input("\nQual tabela deseja alterar: ")
        if tabela == "animais" or tabela == "animais".upper():
            nome = input("Digite o nome do animal: ")
            especie = input("Digite a espécie do animal: ")
            idade = input("Digite a idade do animal: ")
            peso = input("Digite o peso do animal: ")
            insert = (f'INSERT INTO animais(nome, especie, idade, peso) '
                      f'VALUES("{nome}","{especie}","{idade}","{peso}")')
            cursor.execute(insert)
            conexao.commit()
        else:
            print("Escolha inválida")

    elif escolha == "ler" or escolha == "ler".upper():
        tabela = input("\nQual tabela deseja visualizar: ")
        if tabela == "animais" or tabela == "animais".upper():
            read = f'SELECT * FROM {tabela}'
            cursor.execute(read)
            print("\nMostrando os dados")
            print("-" * 23)
            for x in cursor.fetchall():
                print(f'Id: {x[0]}')
                print(f'Nome: {x[1]}')
                print(f'Espécie: {x[2]}')
                print(f'Idade: {x[3]} anos')
                print(f'Peso: {x[4]} kg')
            print("-" * 23)

    elif escolha == "atualizar" or escolha == "atualizar".upper():
        tabela = input("\nQual tabela deseja alterar: ")
        if tabela == "animais" or tabela == "animais".upper():
            opcao = input("Qual valor deseja alterar: ")
            if opcao in "nomeNOME":
                antigo_nome = input("Digite o antigo nome: ")
                novo_nome = input("Digite o novo nome: ")
                update = f'UPDATE {tabela} SET nome="{novo_nome}" WHERE nome ="{antigo_nome}"'
                cursor.execute(update)
            elif opcao in "especieESPECIE":
                antiga_especie = input("Digite a antiga espécie: ")
                nova_especie = input("Digite a nova espécie: ")
                update = f'UPDATE {tabela} SET especie="{nova_especie}" WHERE especie ="{antiga_especie}"'
                cursor.execute(update)
            elif opcao in "idadeIDADE":
                antiga_idade = input("Digite a antiga idade: ")
                nova_idade = input("Digite a nova idade: ")
                update = f'UPDATE {tabela} SET idade="{nova_idade}" WHERE idade ="{antiga_idade}"'
                cursor.execute(update)
            elif opcao in "pesoPESO":
                antigo_peso = input("Digite o antigo peso: ")
                novo_peso = input("Digite o novo peso: ")
                update = f'UPDATE {tabela} SET peso="{novo_peso}" WHERE peso ="{antigo_peso}"'
                cursor.execute(update)
            else:
                print("Valor inválido.")
            conexao.commit()

    elif escolha == "deletar" or escolha == "deletar".upper():
        print("\n"
              "---Escolha com cuidado o que deseja deletar, pois---\n"
              "deletará todos os dados respectivos à tal informação.\n"
              "-------------Use por sua conta e risco.-------------".upper())
        continuar = input("\nDeseja continuar? (S/N)\n")
        if continuar in "sS":
            tabela = input("\nQual tabela deseja alterar: ")
            if tabela == "animais" or tabela == "animais".upper():
                delete = input("Qual animal deseja deletar? ")
                deletar = f'DELETE FROM {tabela} WHERE nome = "{delete}"'
                cursor.execute(deletar)
                conexao.commit()
    else:
        print("Valor inválido.")

    decisao = input("\nDeseja fazer outra ação? (S/N)\n")
    while decisao not in "sSnN":
        decisao = input("Valor inválido. Digite novamente: (S/N)\n")
    if decisao in "sS":
        continue
    else:
        break

cursor.close()
conexao.close()
