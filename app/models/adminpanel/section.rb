module Adminpanel
  class Section < ActiveRecord::Base
    include Adminpanel::Base

    has_and_belongs_to_many :pages, join_table: 'adminpanel_components'

    def name
      key.capitalize
    end

    def self.icon
      'tasks'
    end

    def self.display_name
      I18n.t('model.Section')
    end

    # def self.form_fields
    #   [
    #     {
    #       'description' => {
    #         'type' => 'text_field'
    #       }
    #     }
    #   ]
    # end

    def render
      raise NotImplementedError
    end

    def self.routes_options
      { path: collection_name.parameterize, except: [:new, :create, :destroy] }
    end
  end
end
