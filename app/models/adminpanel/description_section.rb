module Adminpanel
  class DescriptionSection < Adminpanel::Section

    validates_length_of :description,
        minimum: 10,
        maximum: 10,
        on: :update,
        if: :is_a_phone?,
        message: I18n.t('activerecord.errors.messages.not_phone')

    validates_presence_of :description,
        minimum: 9,
        on: :update,
        if: :is_a_phone? # TODO: Restore wysiwyg

    validates :description,
        numericality: { only_integer: true },
        on: :update,
        if: :is_a_phone?

    validates_presence_of :key

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_format_of :description, with: VALID_EMAIL_REGEX, if: :is_email?

    def description
      self.attributes['description'].html_safe
    end

    def self.form_attributes
      [
        {
          'description' => {
            'type' => 'text_field',
            'show' => false
          }
        }
      ]
    end

    def render
      'desc.'
    end

    protected

      def is_email?
        key == 'email' && description != ''
      end

      def is_a_phone?
        key == 'phone' && description != ''
      end
  end
end
