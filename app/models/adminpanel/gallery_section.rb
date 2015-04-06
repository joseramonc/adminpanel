module Adminpanel
  class GallerySection < Adminpanel::Section

    mount_images :sectionfiles

    def self.form_attributes
      [
        {
          'sectionfiles' => {
            'type' => 'adminpanel_file_field',
            'show' => false
          }
        }
      ]
    end
  end
end
