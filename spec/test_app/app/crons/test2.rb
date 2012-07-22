class Test2 < Application::Cron

  every 25.seconds, :puts11
  every 15.seconds, :puts22

  def puts11
    App.logger.info '11'
  end

  def puts22
    App.logger.info '22'
  end

end
