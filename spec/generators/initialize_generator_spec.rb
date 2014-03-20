require 'spec_helper'

describe "adminpanel:initialize" do
  context "with no arguments or options" do
    it "should generate the initialization migration" do
      subject.should generate("db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S").to_i + 1}_create_adminpanel_tables.rb")
    end

    it "should generate the default category model" do
      subject.should generate("app/models/adminpanel/category.rb")
    end

    it 'should generate the categories migration' do
      subject.should generate("db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_adminpanel_categories_table.rb")
    end
  end

  with_args :'-c', :false do
    it "shouldn't generate the default category model" do
      subject.should_not generate("app/models/adminpanel/category.rb")
    end

    it "shouldn't generate the categories migration" do
      subject.should_not generate("db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_adminpanel_categories_table.rb")
    end

    it "should generate the initialization migration" do
      subject.should generate("db/migrate/#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_adminpanel_tables.rb")
    end

  end

  it 'should generate the configuration initializer' do
    subject.should generate('config/initializers/adminpanel_setup.rb'){ |content|
      content.should =~ /Adminpanel.setup do |config|/
    }
  end
end