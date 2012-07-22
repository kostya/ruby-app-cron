
if defined?(Application) && (Application.send(:identifier) rescue '-') == 'ruby-app'

  # add initializers
  App.initializer_paths << [
      File.join(File.dirname(__FILE__), %w{ tag_logger.rb }),
      File.join(File.dirname(__FILE__), %w{ cron.rb })
    ].map{|f| File.expand_path(f) }  

end
