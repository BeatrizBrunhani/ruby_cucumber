Before do
  window = Capybara.current_session.current_window
  window.maximize

  @page = lambda do |klass|
    klass.new
  end    
end    