module Adminpanel
  class Page < ActiveRecord::Base
    include Adminpanel::Base

    validates_presence_of :name

    validates_presence_of :key
    validates_uniqueness_of :key

    has_and_belongs_to_many :sections, -> { order('position ASC') }, join_table: 'adminpanel_components'

    def icon
      'user-md'
    end

    def self.display_name
      'Pagina'
    end

  end
end
