#language: pt

Funcionalidade: Carrinho
  Para que o usuario consiga finalizar uma compra
  Sendo que ja decidiu o que deseja comer
  Possa adicionar o item ao carrinho

  Contexto: Restaurantes
    Dado que o usuario acesse a lista de restaurantes
    E escolho o restaurante 'Bread & Bakery'
@cart
  Cenario: Adicionar um item ao carrinho
    Dado que o produto desejado é 'Cup Cake'
    E o valor do produto é 'R$ 8,70'
    Quando adiciono 1 unidade(s) 
    Entao devera ser adiciona 1 unidade(s) desse item
    E o valor total deve ser de 'R$ 8,70'