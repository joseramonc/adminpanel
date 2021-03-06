require 'test_helper'

class SharedPagesHelperTest < ActionView::TestCase
  include Adminpanel::SharedPagesHelper
  fixtures :all

  def test_belong_to_object_name
    @model = Adminpanel::Salesman
    #according to fixtures and dummy app relationships
    assert_equal 'Product saved', belong_to_object_name(adminpanel_salesmen(:one), 'product')
    @model = nil
  end

  def test_pluralize_model
    assert_equal 'clients', pluralize_model('Adminpanel::Client')
  end

  def test_relaitionship_ids
    assert_equal 'client_ids', relationship_ids('Adminpanel::Client')
  end

  def test_class_name_downcase
    assert_equal 'category', class_name_downcase(Adminpanel::Category.new)
  end

  def test_demodulize_class
    assert_equal 'product', demodulize_class('Adminpanel::Product')
  end

  def test_active_tab
    assert_equal 'active', active_tab(0)
    assert_equal '', active_tab([*1..15].sample)
  end

  def test_string_in_field_value
    test_object = adminpanel_test_objects(:first)
    attribute = 'name'
    assert_equal(
      'John Doe',
      field_value(
        'text_field',
        attribute,
        test_object
      ),
      'didn\'t matched :('
    )
  end

  def test_boolean_in_field_value
    test_object = adminpanel_test_objects(:first)
    attribute = 'boolean'
    assert_equal(
      I18n.t('action.is_true'),
      field_value(
        'boolean',
        attribute,
        test_object
      ),
      'didn\'t matched boolean :('
    )
  end

  def test_belongs_to_in_field_value
    @model = Adminpanel::Salesman # simulating salesman controller
    test_object = adminpanel_salesmen(:one)
    attribute = 'product_id'
    assert_equal(
      'Product saved',
      field_value(
        'select',
        attribute,
        test_object
      )
    )
  end

  def test_has_many_in_field_value
    test_object = adminpanel_test_objects(:first)
    attribute = 'category_ids'
    assert_equal(
      content_tag(:ul, nil) do
        content_tag(:li, nil, class: 'priority-low') do
          adminpanel_categories(:nice).name
        end +
        content_tag(:li, nil, class: 'priority-low') do
          adminpanel_categories(:pretty).name
        end
      end,
      field_value(
        'checkbox',
        attribute,
        test_object
      ),
      'didn\'t matched has_many fields :('
    )
  end

  def test_enum_in_field_value
    test_object = adminpanel_permissions(:publish)
    attribute = 'action'
    assert_equal(
      'Publicar en Redes Sociales',
      field_value(
        'enum_field',
        attribute,
        test_object
      ),
      'didn\'t matched has_many fields :('
    )
  end

  def test_file_field_in_field_value
    test_object = adminpanel_galleries(:one)
    attribute = 'file'
    assert_equal(
      test_object[attribute],
      field_value(
        'file_field',
        attribute,
        test_object
      )
    )
  end

  def test_image_field_in_field_value
    test_object = adminpanel_galleries(:one)
    attribute = 'file'
    assert_equal(
      content_tag(:ul) {
        image_tag(
          test_object.send(
            "#{attribute}_url",
            :thumb
          )
        )
      },
      field_value(
        'image_field',
        attribute,
        test_object
      )
    )
  end

  def test_is_customized_field?
    assert is_customized_field?('adminpanel_file_field')
    assert is_customized_field?('select')
    assert is_customized_field?('checkbox')
    assert is_customized_field?('file_field')
    assert is_customized_field?('non_image_file_field')
    # some example false values (not everyone)
    assert_not is_customized_field?('text_field')
    assert_not is_customized_field?('number_field')
    assert_not is_customized_field?('text_area')
    assert_not is_customized_field?('wysiwyg_field')
  end

end
