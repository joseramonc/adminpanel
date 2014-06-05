module Adminpanel
  class Salesman < ActiveRecord::Base
    include Adminpanel::Base
    include Adminpanel::Facebook

    belongs_to :product

    def self.form_attributes
      [
			{
				'name' => {
					'type' => 'text_field',
					'label' => 'name',
					'placeholder' => 'name'
				}
			},
			{
				'product_id' => {
					'type' => 'belongs_to',
					'model' => 'Adminpanel::Product',
					'label' => 'product',
					'placeholder' => 'product'
				}
			},
      ]
    end

    def self.display_name
      'Agente' #singular
    end

    # def self.icon
    #     "truck" # fa-{icon}
    # end
  end
end