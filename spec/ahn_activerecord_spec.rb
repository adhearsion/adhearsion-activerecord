require 'spec_helper'

describe AhnActiveRecord do
  
  subject { AhnActiveRecord }
  
  it "should be a module" do
    subject.should be_kind_of Module
  end

end