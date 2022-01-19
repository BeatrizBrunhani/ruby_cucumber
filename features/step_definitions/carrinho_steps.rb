Dado('que o produto desejado é {string}') do |produto|
  @produto_nome = produto
end

Dado('o valor do produto é {string}') do |preco|
  @produto_valor = preco
end

Quando('adiciono {int} unidade\(s)') do |quantidade|
  quantidade.times do
    @page.call(RestaurantePage).add_to_cart(@produto_nome)
  end
end

Entao('devera ser adicionado {int} unidade\(s) desse item') do |quantidade|
 expect(@page.call(CartView).box).to have_content "(#{quantidade}x) #{@produto_nome}"
end

Entao('o valor total deve ser de {string}') do |valor_total|
  expect(@page.call(CartView).total_cart.text).to eql valor_total
end

Dado('que os produtos desejado são') do |table|
  @produto_list = table.hashes
end

Quando('adiciono todos os itens') do
  @produto_list.each do |produto|
    produto['quantidade'].to_i.times do
       @page.call(RestaurantePage).add_to_cart(produto['nome'])
    end
  end
end

Dado('que os produtos adicionados são') do |table|
  @produto_list = table.hashes
  # DINAMIC STEPS REUTILIZAR STEPS QUE JA ESTAO PRONTOS
  steps %{
    Quando adiciono todos os itens 
  }
end


Entao('devera apresentar todos os itens no carrinho') do
  @produto_list.each do |p|
    expect(@page.call(CartView).box).to have_content "(#{p['quantidade']}x) #{p['nome']}"
  end
end

Quando('o usuario remove somente o item {int}') do |item|
    @page.call(CartView).remove_iten(item)
end

Entao('valor total deve ser de {string}') do |expect_total|
  expect(@page.call(CartView).total_cart.text).to eql expect_total
end
