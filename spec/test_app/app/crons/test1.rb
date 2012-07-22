class Test1 < Application::Cron

  every 45.seconds, :puts1
  every 35.seconds, :puts2

  def puts1
    $bla = 1
    App.logger.info '1'
  end

  def puts2
    App.logger.info '2'
  end

end
