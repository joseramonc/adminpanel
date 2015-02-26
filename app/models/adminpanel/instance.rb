module Adminpanel
  class Instance < Component
    validates_presence_of :resource_id
    validates_presence_of :resource_type
    belongs_to :resource, polymorphic: true

    def content
      resource.name
    end

    def link
      resource
    end
  end
end
