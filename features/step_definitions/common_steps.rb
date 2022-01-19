Dado('que o usuario acesse a lista de restaurantes') do
  #dinamic steps reutiliza o codigo
  steps %{
    Quando acesso a lista de restaurantes 
  }
end

Dado('seleciona o restaurante {string}') do |restaurante|
  pending # Write code here that turns the phrase above into concrete actions
end