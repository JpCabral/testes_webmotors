# encoding: utf-8

# Antes de cada cenário, o sistema abre um navegador
Before ('not @screenless') do |scenario|
  FileUtils.mkpath @path_screenshots
  args = @args

  @browser = Watir::Browser.new :chrome,{headless: true, options: { detach: true, args: args}}

  @browser.driver.manage.window.maximize
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