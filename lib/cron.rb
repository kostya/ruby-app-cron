# -*- encoding : utf-8 -*-
class Application::Cron

  def self.run
    require 'forever'
    
    load_crons
  
    ENV["DONT_TOUCH_PS"] = '1'
    
    ARGV.clear
    ARGV << 'run'
    
    h = {}
    h[:append_log] = true

    Forever.run(h) do
      def dir
        App.root # for tmp and log paths
      end
      
      @@crons.each do |(klass, _), opts|
        every(opts[:period], opts[:options]) do
          App::Cron.schedule_action(klass, opts[:method_name])
        end
      end
    end
  end
  
  def self.schedule_action(klass, method_name)
    ErrorMailer.safe do
      App.logger.tagged(klass.to_s) do
        klass.eval_action(method_name)
      end
    end                                                              
  end
  
  def self.eval_action(method_name)
    tm = Time.now
    App.logger.info "=> #{method_name}"
    inst = self.new
    inst.before_each
    result = inst.send(method_name)
    inst.after_each
    App.logger.info "<= #{method_name} (#{result}) (#{"%.2f" % (Time.now - tm)}s)"
  end
  
  def self.load_crons
    ActiveSupport::Dependencies::autoload_paths << "#{Application.root}/app/crons"
    
    base_path = File.join(App.root, %w{ app crons })
    Dir[File.join(base_path, %w{ *.rb})].each do |file|
      ErrorMailer.safe do
        require file
      end
    end
  end
  
  @@crons = {}
  
  def self.every(period, method_name, options = {})
    @@crons[[self, method_name]] = {:method_name => method_name, :period => period, :options => options}
  end
  
  def before_each
  end
  
  def after_each
  end
  
end
