# # encoding: utf-8

Given("i am searching for CEP {string}") do |cep|
  @cep = cep
end

When("the request is made") do
  begin
    @response = RestClient.get "https://financeiro.hostgator.com.br/api/v3/checkout/cep/"+@cep,  {content_type: "application/json;charset=utf-8"}
  rescue => error
    @response = error.response
  end
end

Then("check if the return code was {int}") do |return_code|
  expect(@response.code).to eq(return_code)
end