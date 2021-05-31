# # encoding: utf-8

When("the make request is made") do
  begin
    @response = RestClient.get "https://desafioonline.webmotors.com.br/api/OnlineChallenge/Make",  {content_type: "application/json;charset=utf-8"}
  rescue => error
    @response = error.response
  end
  @json = JSON.parse(@response)
end

Then("expect the make request result to be the same") do
  expect(@json[0]["ID"]).to eq(1)
  expect(@json[0]["Name"]).to eq("Chevrolet")
  expect(@json[1]["ID"]).to eq(2)
  expect(@json[1]["Name"]).to eq("Honda")
  expect(@json[2]["ID"]).to eq(3)
  expect(@json[2]["Name"]).to eq("Ford")
end

When("the model request is made with MakeID {int}") do |make_id|
  begin
    @response = RestClient.get "https://desafioonline.webmotors.com.br/api/OnlineChallenge/Model?MakeID="+make_id.to_s,  {content_type: "application/json;charset=utf-8"}
  rescue => error
    @response = error.response
  end
  @json = JSON.parse(@response)
  @MakeID = make_id
end

Then("expect the model request result to be the same") do
  expect(@json[0]["ID"]).to eq(1)
  expect(@json[1]["ID"]).to eq(2)
  expect(@json[2]["ID"]).to eq(3)
  expect(@json[0]["MakeID"]).to eq(@MakeID)
  expect(@json[1]["MakeID"]).to eq(@MakeID)
  expect(@json[2]["MakeID"]).to eq(@MakeID)
  expect(@json[0]["Name"]).to eq("Agile")
  expect(@json[1]["Name"]).to eq("Astra")
  expect(@json[2]["Name"]).to eq("Onix")
end

When("the version request is made with ModelID {int}") do |model_id|
  begin
    @response = RestClient.get "https://desafioonline.webmotors.com.br/api/OnlineChallenge/Version?ModelID="+model_id.to_s,  {content_type: "application/json;charset=utf-8"}
  rescue => error
    @response = error.response
  end
  @json = JSON.parse(@response)
  @ModelID = model_id
end

# Como o retorno é aleatório, por enquanto desenvolvi uma solução estática para 5 resultados
Then("expect the version request result to be the same") do
  expect(@json[0]["ID"]).to eq(6)
  expect(@json[1]["ID"]).to eq(7)
  expect(@json[2]["ID"]).to eq(8)
  expect(@json[3]["ID"]).to eq(9)
  expect(@json[4]["ID"]).to eq(10)
  expect(@json[0]["ModelID"]).to eq(@ModelID)
  expect(@json[1]["ModelID"]).to eq(@ModelID)
  expect(@json[2]["ModelID"]).to eq(@ModelID)
  expect(@json[3]["ModelID"]).to eq(@ModelID)
  expect(@json[4]["ModelID"]).to eq(@ModelID)
  expect(@json[0]["Name"]).to eq("1.5 DX 16V FLEX 4P AUTOMÁTICO")
  expect(@json[1]["Name"]).to eq("1.5 LX 16V FLEX 4P MANUAL")
  expect(@json[2]["Name"]).to eq("2.0 EXL 4X4 16V GASOLINA 4P AUTOMÁTICO")
  expect(@json[3]["Name"]).to eq("1.8 16V EVO FLEX FREEDOM OPEN EDITION AUTOMÁTICO")
  expect(@json[4]["Name"]).to eq("1.0 MPI EL 8V FLEX 4P MANUAL")
end

Then("expect the vehicles request result to be the same") do
  expect(@json[0]["ID"]).to eq(1)
  expect(@json[0]["Make"]).to eq("Honda")
  expect(@json[0]["Model"]).to eq("City")
  expect(@json[0]["Version"]).to eq("2.0 EXL 4X4 16V GASOLINA 4P AUTOMÁTICO")
  expect(@json[0]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/01.jpg")
  expect(@json[0]["KM"]).to eq(0)
  expect(@json[0]["Price"]).to eq("59000,00")
  expect(@json[0]["YearModel"]).to eq(2018)
  expect(@json[0]["YearFab"]).to eq(2017)
  expect(@json[0]["Color"]).to eq("Azul")

  expect(@json[1]["ID"]).to eq(2)
  expect(@json[1]["Make"]).to eq("Mitsubishi")
  expect(@json[1]["Model"]).to eq("Lancer")
  expect(@json[1]["Version"]).to eq("2.0 EVO 4P AUTOMÁTICO")
  expect(@json[1]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/02.jpg")
  expect(@json[1]["KM"]).to eq(47500)
  expect(@json[1]["Price"]).to eq("49000,00")
  expect(@json[1]["YearModel"]).to eq(2012)
  expect(@json[1]["YearFab"]).to eq(2012)
  expect(@json[1]["Color"]).to eq("Branco")

  expect(@json[2]["ID"]).to eq(3)
  expect(@json[2]["Make"]).to eq("Honda")
  expect(@json[2]["Model"]).to eq("Fit")
  expect(@json[2]["Version"]).to eq("1.4 LXL 16V FLEX 4P AUTOMÁTICO")
  expect(@json[2]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/03.jpg")
  expect(@json[2]["KM"]).to eq(0)
  expect(@json[2]["Price"]).to eq("78000,00")
  expect(@json[2]["YearModel"]).to eq(2018)
  expect(@json[2]["YearFab"]).to eq(2018)
  expect(@json[2]["Color"]).to eq("Preto")

  expect(@json[3]["ID"]).to eq(4)
  expect(@json[3]["Make"]).to eq("Mitsubishi")
  expect(@json[3]["Model"]).to eq("Lancer")
  expect(@json[3]["Version"]).to eq("2.0 EVO 4P AUTOMÁTICO")
  expect(@json[3]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/04.jpg")
  expect(@json[3]["KM"]).to eq(12900)
  expect(@json[3]["Price"]).to eq("59000,00")
  expect(@json[3]["YearModel"]).to eq(2016)
  expect(@json[3]["YearFab"]).to eq(2015)
  expect(@json[3]["Color"]).to eq("Vermelho")

  expect(@json[4]["ID"]).to eq(5)
  expect(@json[4]["Make"]).to eq("Honda")
  expect(@json[4]["Model"]).to eq("Fit")
  expect(@json[4]["Version"]).to eq("1.4 LXL 16V FLEX 4P AUTOMÁTICO")
  expect(@json[4]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/05.jpg")
  expect(@json[4]["KM"]).to eq(12000)
  expect(@json[4]["Price"]).to eq("55000,00")
  expect(@json[4]["YearModel"]).to eq(2016)
  expect(@json[4]["YearFab"]).to eq(2016)
  expect(@json[4]["Color"]).to eq("Azul")

  expect(@json[5]["ID"]).to eq(6)
  expect(@json[5]["Make"]).to eq("Chevrolet")
  expect(@json[5]["Model"]).to eq("Agile")
  expect(@json[5]["Version"]).to eq("1.4 MPFI EFFECT 8V FLEX 4P AUTOMATIZADO")
  expect(@json[5]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/06.jpg")
  expect(@json[5]["KM"]).to eq(12000)
  expect(@json[5]["Price"]).to eq("37000,00")
  expect(@json[5]["YearModel"]).to eq(2014)
  expect(@json[5]["YearFab"]).to eq(2013)
  expect(@json[5]["Color"]).to eq("Vermelho")

  expect(@json[6]["ID"]).to eq(7)
  expect(@json[6]["Make"]).to eq("Chevrolet")
  expect(@json[6]["Model"]).to eq("Agile")
  expect(@json[6]["Version"]).to eq("1.4 MPFI EFFECT 8V FLEX 4P AUTOMATIZADO")
  expect(@json[6]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/07.jpg")
  expect(@json[6]["KM"]).to eq(0)
  expect(@json[6]["Price"]).to eq("45000,00")
  expect(@json[6]["YearModel"]).to eq(2018)
  expect(@json[6]["YearFab"]).to eq(2017)
  expect(@json[6]["Color"]).to eq("Cinza")

  expect(@json[7]["ID"]).to eq(8)
  expect(@json[7]["Make"]).to eq("Ford")
  expect(@json[7]["Model"]).to eq("Ecosport")
  expect(@json[7]["Version"]).to eq("1.6 FREESTYLE 16V FLEX 4P MANUAL")
  expect(@json[7]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/08.jpg")
  expect(@json[7]["KM"]).to eq(93000)
  expect(@json[7]["Price"]).to eq("45000,00")
  expect(@json[7]["YearModel"]).to eq(2013)
  expect(@json[7]["YearFab"]).to eq(2012)
  expect(@json[7]["Color"]).to eq("Branca")

  expect(@json[8]["ID"]).to eq(9)
  expect(@json[8]["Make"]).to eq("Chevrolet")
  expect(@json[8]["Model"]).to eq("Agile")
  expect(@json[8]["Version"]).to eq("1.4 MPFI EFFECT 8V FLEX 4P AUTOMATIZADO")
  expect(@json[8]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/06.jpg")
  expect(@json[8]["KM"]).to eq(12000)
  expect(@json[8]["Price"]).to eq("37000,00")
  expect(@json[8]["YearModel"]).to eq(2014)
  expect(@json[8]["YearFab"]).to eq(2013)
  expect(@json[8]["Color"]).to eq("Vermelho")

  expect(@json[9]["ID"]).to eq(10)
  expect(@json[9]["Make"]).to eq("Honda")
  expect(@json[9]["Model"]).to eq("Fit")
  expect(@json[9]["Version"]).to eq("1.4 LXL 16V FLEX 4P AUTOMÁTICO")
  expect(@json[9]["Image"]).to eq("http://desafioonline.webmotors.com.br/content/img/05.jpg")
  expect(@json[9]["KM"]).to eq(12000)
  expect(@json[9]["Price"]).to eq("55000,00")
  expect(@json[9]["YearModel"]).to eq(2016)
  expect(@json[9]["YearFab"]).to eq(2016)
  expect(@json[9]["Color"]).to eq("Azul")
end

When("the vehicles request is made with Page {int}") do |page|
  begin
    @response = RestClient.get "https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page="+page.to_s,  {content_type: "application/json;charset=utf-8"}
  rescue => error
    @response = error.response
  end
  @json = JSON.parse(@response)
end

Then("check if the return code was {int}") do |return_code|
  expect(@response.code).to eq(return_code)
end