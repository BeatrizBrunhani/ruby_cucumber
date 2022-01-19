module Helpers 
#include Capybara::DSL

  def take_screenshot(scenario)
    date = Time.now.strftime('%d/%B/%Y')
    time = Time.now.strftime('%H:%M:%S')
    scenario_name = scenario.name.gsub(%r{([_@#!%()\-=;<>,{}\~\[\]\.\/?\"\*\^\$\+\-]+)}, '_') #formatando o nome do cenario, retirando espacos, caracteres especiais
    screenshot =
      if scenario.failed?
        "#{Dir.pwd}/report/screenshot/failed/#{date}/#{scenario_name}/#{time}.png"
      else
        "#{Dir.pwd}/report/screenshot/success/#{date}/#{scenario_name}/#{time}.png"
      end
    screenshot = screenshot.tr!(' ', '_') if screenshot.inlude?(' ')
    page.save_screenshot(screenshot)
    attach(screenshot, 'image/png')
  end
end
