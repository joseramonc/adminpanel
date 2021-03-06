module Adminpanel
  class Category < ActiveRecord::Base
    include Adminpanel::Base
    validates_presence_of :model
    validates_presence_of :name

    has_many :categorizations
    has_many :products, :through => :categorizations, :dependent => :destroy

    has_and_belongs_to_many :test_objects,
        join_table: "adminpanel_test_object_category"

    def self.form_attributes
      [
        {"name" => {"type" => "text_field", "name" => "name", "label" => "name", "placeholder" => "name"}},
        # {'model' => {"type" => "text_field", "name" => "name", "label" => "name", "placeholder" => "name", 'show' => 'false'}},
        {"product_ids" => {"type" => "has_many", "model" => "Adminpanel::Product", "name" => "product_ids"}},
      ]
    end

    def self.display_name
        "Categoria"
    end

    def self.icon
        "icon-truck"
    end
  end
end
