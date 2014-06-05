require 'test_helper'
include Rake
Rake.application.rake_require 'tasks/adminpanel/adminpanel'
Rake::Task.define_task(:environment)

class AdminpanelRakeTest < ActiveSupport::TestCase

  def test_populate_task
    products_count = Adminpanel::Product.count
    Rake.application.invoke_task "adminpanel:populate[10, product, name:name description:lorem price:number]"
    assert_equal products_count + 10, Adminpanel::Product.count
  end

  def test_section_task
    Rake.application.invoke_task "adminpanel:section[Mission Mars, about us]"
    last_section = Adminpanel::Section.last
    assert_equal 'Mission Mars', last_section.name
    assert_equal 'About us', last_section.page
    assert_equal 'mission_mars', last_section.key
    assert_equal false, last_section.has_description
    assert_equal false, last_section.has_image
  end

  def test_user_task
    Rake.application.invoke_task 'adminpanel:user'
    generated_user = Adminpanel::User.last
    assert_equal 'webmaster@codn.com', generated_user.email
    assert_equal 'Webmaster', generated_user.name
    assert_equal 'Admin', generated_user.group.name
  end

end