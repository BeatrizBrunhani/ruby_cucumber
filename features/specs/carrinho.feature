#language: pt

Funcionalidade: Carrinho
  Para que o usuario consiga finalizar uma compra
  Sendo que ja decidiu o que deseja comer
  Possa adicionar o item ao carrinho

  Contexto: Restaurantes
    Dado que o usuario acesse a lista de restaurantes
    E escolho o restaurante 'Bread & Bakery'

  Cenario: Adicionar um item ao carrinho
    Dado que o produto desejado é 'Cup Cake'
    E o valor do produto é 'R$ 8,70'
    Quando adiciono 1 unidade(s) 
    Entao devera ser adicionado 1 unidade(s) desse item
    E o valor total deve ser de 'R$ 8,70'

  Cenario: Adicionar dois itens ao carrinho
    Dado que o produto desejado é 'Donut'
    E o valor do produto é 'R$ 2,50'
    Quando adiciono 2 unidade(s) 
    Entao devera ser adicionado 2 unidade(s) desse item
    E o valor total deve ser de 'R$ 5,00'

  @cart
  Cenario: Adicionar varios itens ao carrinho
    Dado que os produtos desejado são
      | nome                   | preco    | quantidade |
      | Cup Cake               | R$ 8,70  | 1          |
      | Donut                  | R$ 2,50  | 2          |
      | Pão Artesanal Italiano | R$ 15,90 | 1          |
    Quando adiciono todos os itens 
    Entao devera apresentar todos os itens no carrinho 
    E o valor total deve ser de 'R$ 29,60'