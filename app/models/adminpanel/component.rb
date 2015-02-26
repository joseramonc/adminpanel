module Adminpanel
  class Component < ActiveRecord::Base
    belongs_to :page

    default_scope do
      order('position ASC')
    end

    def content
      raise NotImplementedError
    end

    def link
      raise NotImplementedError
    end
  end
end
