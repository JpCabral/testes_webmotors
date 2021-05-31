# frozen_string_literal: true

Before ('not @screenless') do |scenario|
  @path_screenshots = 'results/screenshots'
  FileUtils.mkpath @path_screenshots

  @prefs = {
    download: {
        prompt_for_download: false,
        default_directory: "#{Dir.pwd}" + '/results/files'
    }
  }
  prefs = @prefs
  args = @args

  if @browser
    @browser.close
  end

  @browser = Watir::Browser.new :chrome,{headless: true, options: { detach: true, prefs: prefs, args: args}}

  @browser.driver.manage.window.maximize
  @browser.window.resize_to(1920, 1080)
end

After ('not @screenless') do |scenario|
  if scenario.failed?
    screenshot = "#{@path_screenshots}/#{Time.now.strftime('%Y%m%d')}_#{Time.now.strftime('%H%M%S%L')}.png"
    @browser.screenshot.save(screenshot)
    puts '<div class="material-placeholder"><img class="materialboxed" width="250" src="'+screenshot+'" ></div>'
  end
  @browser.close
end

AfterStep ('not @screenless') do |scenario|
  # A cada etapa, o sistema guarda capturas de tela das etapas realizadas.
  screenshot = "#{@path_screenshots}/#{Time.now.strftime('%Y%m%d')}_#{Time.now.strftime('%H%M%S%L')}.png"
  @browser.screenshot.save(screenshot)
  puts '<div class="material-placeholder"><img class="materialboxed" width="250" src="'+screenshot+'" ></div>'
end

After do |scenario|
  if scenario.failed?
    if File.exist?("failed_features.log")
      File.open("failed_features.log", "a") do |log|
        log.puts scenario.location.file+":"+scenario.location.line.to_s+"\n"
      end
    else
      log = File.new("failed_features.log", "w")
      log.puts scenario.location.file+":"+scenario.location.line.to_s+"\n"
    end
  end
end