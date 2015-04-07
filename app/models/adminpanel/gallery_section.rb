module Adminpanel
  class GallerySection < Adminpanel::Section

    has_many :sectionfiles, dependent: :destroy, foreign_key: :section_id
    accepts_nested_attributes_for :sectionfiles, allow_destroy: true

    def render
      html = '
        <div id="myCarousel" class="carousel slide">'

          html << '<div class="carousel-inner">'

          sectionfiles.each_with_index do |sectionfile, index|
            html << "<div class=\"item "
            html << "active" if index == 0
            html << "\">
              <img src=\"#{sectionfile.file_url(:thumb)}\"></img>
            </div>"
          end
          html << '</div>'

          html << '
          <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
          <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>'
    end

    def elements_html
      html = ''
      sectionfiles.each do |sectionfile|
        html << sectionfile.file_url(:thumb)
      end
    end

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
