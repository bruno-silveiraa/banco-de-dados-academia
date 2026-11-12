# Projeto Banco de Dados — Academia

Projeto acadêmico de banco de dados relacional desenvolvido em MySQL / MySQL Workbench.

## Primeira entrega

Modelagem do banco de dados da academia, com diagrama e relacionamentos entre as entidades. O modelo original está no arquivo `academia.mwb`.

## Segunda entrega

O arquivo [`02_Entrega_Academia_FINAL.sql`](02_Entrega_Academia_FINAL.sql) contém:

- Criação das sete tabelas: `Plano`, `Aluno`, `Ficha_treino`, `Professor`, `Treino`, `Exercicio` e `Treino_exercicio`.
- Dados de exemplo e comandos DML (`INSERT` e `UPDATE`), com cancelamento de matrícula demonstrado por meio de uma procedure.
- Quatro views: `View_Alunos_Planos`, `View_Treinos_Professores`, `View_Alunos_Fichas` e `View_Exercicios_Treinos`.
- Duas procedures: `Cancelar_Matricula` e `Promover_Professor`.
- Duas functions: `Contar_Alunos` e `Calcular_Valor_Anual_Plano`.
- Uma trigger: `Impedir_Exclusao_Aluno`.
- Roles `Professor` e `Supervisor`, com privilégios específicos.
- Consultas de verificação ao final do script.

## Como executar

1. Abrir o MySQL Workbench e conectar-se com uma conta administrativa.
2. **Utilizar um banco novo/vazio**. O script foi preparado para instalação inicial no schema `academia`. Não executá-lo sobre uma instalação já preenchida: os `INSERTs` podem duplicar dados e as rotinas podem já existir.
3. Abrir `02_Entrega_Academia_FINAL.sql` e executar o script na ordem em que os comandos aparecem.
4. Conferir as consultas de verificação no final. Os dados iniciais previstos são: 5 planos, 5 alunos, 5 fichas, 5 professores, 8 treinos, 12 exercícios e 5 associações treino–exercício.
5. Os usuários de teste `rodrigo` e `carlos` devem ser criados manualmente com senhas privadas. Os comandos para associar as roles estão comentados no SQL.

## Observações

- O aluno de ID 2 foi retirado dos dados iniciais para representar o cancelamento de matrícula. Sua ficha também foi removida, e uma ficha para o aluno de ID 6 foi incluída para manter cinco registros.
- A trigger impede excluir um aluno que ainda tenha ficha vinculada. A procedure remove primeiro a ficha e depois o aluno.
- Os comandos que modificam dados devem ser testados em uma cópia do banco ou em transações reversíveis.
- Não publicar senhas ou dados pessoais reais no repositório.

> **Validação:** foram realizados testes no MySQL Workbench para verificar o funcionamento das tabelas, consultas, views, procedures, functions, triggers e permissões de acesso.