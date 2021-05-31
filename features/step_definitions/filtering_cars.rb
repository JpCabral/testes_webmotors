# encoding: utf-8

And "search brand/model/version {string}" do |keyword|
  @browser.input(id: "searchBar").send_keys keyword
end

And "select brand {string} on search result" do |brand_name|
  found = false
  if @browser.divs(class: "SearchBar__results__group")[0].text.include? brand_name
    found = true
  end
  expect(found).to be true
  @browser.divs(class: "SearchBar__results__result__name").each do |result_name|
    if result_name.text.include? brand_name
      result_name.click
      break
    end
  end
  @browser.h1(class: "title-search").wait_until(&:present?)
end

And "select model {string} on search result" do |model_name|
  found = false
  if @browser.divs(class: "SearchBar__results__group")[1].text.include? model_name
    found = true
  end
  expect(found).to be true
  @browser.divs(class: "SearchBar__results__result__name").each do |result_name|
    if result_name.text.include? model_name
      result_name.click
      break
    end
  end
  @browser.h1(class: "title-search").wait_until(&:present?)
end

Then "check if results were found" do
  @browser.div(class: "PhotoSlider").wait_until(&:present?)
  expect(@browser.div(class: "ResultZero__header").present?).to be false
  expect(@browser.divs(class: "PhotoSlider").size).to be > 0
end

Then "should not find any car" do
  expect(@browser.div(class: "ResultZero__header").present?).to be false
end

And 'click on "Ver ofertas" button' do
  @browser.a(class: "Button--red-home").click
  @browser.span(class: "PlaceHolder").wait_until(&:present?).wait_while(&:present?)
end

And "filter by {string} brand" do |brand_name|
  @browser.a(class: "CardMake",title: brand_name).click
  @browser.span(class: "PlaceHolder").wait_until(&:present?).wait_while(&:present?)
end

And "filter by {string} model" do |model_name|
  @browser.div(class: "Filters__line Filters__line--gray Filters__line--icon Filters__line--icon--right").click
  @browser.a(class:"Filters__line__result", text: model_name).click
  @browser.span(class: "PlaceHolder").wait_until(&:present?).wait_while(&:present?)
end

Then "the page should list results for {string}" do |car|
  @browser.h1(class: "title-search").wait_until(&:enabled?)
  expect(@browser.h1(class: "title-search").text.include? car).to be true
end

Then "the page shows the {string} cars available on stock" do |car|
  breadcrumb = @browser.ol(itemtype: "http://schema.org/BreadcrumbList").text.gsub("Home\nCarros\n","").gsub("\n"," ")
  expect(breadcrumb.include? car).to be true
end