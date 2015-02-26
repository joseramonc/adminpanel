module Adminpanel
  class Collection < Component
    validates_presence_of :model

    def content
      model.classify.constantize.all
    end

    def link
      [model.demodulize.pluralize.downcase]
    end
  end
end
