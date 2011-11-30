require 'spec_helper'

describe Adhearsion::ActiveRecord do

  subject { Adhearsion::ActiveRecord }

  it "should be a module" do
    subject.should be_kind_of Module
  end

end
