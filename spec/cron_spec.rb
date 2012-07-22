require File.dirname(__FILE__) + '/spec_helper'

describe "Application::Cron" do

  before :each do
    $bla = nil
  end

  before :all do
    require File.join(File.dirname(__FILE__), %w{test_app config environment})
    App::Cron.load_crons
  end
    
  it "should load all crons" do
    crons = App::Cron.send :class_variable_get, '@@crons'
    crons.size.should == 4
    
    crons = crons.sort_by{|k, v| k[1].to_s }
    crons.should == [[[Test1, :puts1], {:method_name=>:puts1, :period=>45.seconds, :options=>{}}], 
      [[Test2, :puts11], {:method_name=>:puts11, :period=>25.seconds, :options=>{}}], 
      [[Test1, :puts2], {:method_name=>:puts2, :period=>35.seconds, :options=>{}}], 
      [[Test2, :puts22], {:method_name=>:puts22, :period=>15.seconds, :options=>{}}]]
  end
  
  it "eval action" do
    $bla.should == nil
    Test1.eval_action(:puts1)
    $bla.should == 1
  end
  
  it "schedule action" do
    $bla.should == nil
    App::Cron.schedule_action Test1, :puts1
    $bla.should == 1                
  end
  
end
