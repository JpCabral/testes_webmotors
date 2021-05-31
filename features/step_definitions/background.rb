# encoding: utf-8
Given "I am at Webmotors homepage" do
  @browser.driver.manage.window.maximize
  @browser.goto "https://www.webmotors.com.br/"
  @browser.div(id: "WhiteBox").wait_until(&:present?)
end

Given "I am at Mazola Automóveis reseller stock page" do
  @browser.goto "https://www.webmotors.com.br/carros/estoque/?IdRevendedor=3834764&TipoVeiculo=carros&anunciante=concession%C3%A1ria%7Cloja"
  @browser.div(id: "BannerFilterResultA").wait_until(&:present?)
end