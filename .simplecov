if ENV['COV']
  SimpleCov.start 'rails' do
    add_filter "/vendor/"
  end
end

