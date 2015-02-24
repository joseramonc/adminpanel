module Adminpanel
  class Page < ActiveRecord::Base
    include Adminpanel::Base

    validates_presence_of :name

    validates_presence_of :key
    validates_uniqueness_of :key

    has_and_belongs_to_many :resources, join_table: :adminpanel_page_resources

    def icon
      ['dashboard', 'truck', 'trash'].sample
    end

    def self.display_name
      'Pagina'
    end

  end
end
