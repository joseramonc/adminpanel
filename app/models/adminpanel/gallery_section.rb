module Adminpanel
  class GallerySection < Adminpanel::Section

    has_many :sectionfiles, dependent: :destroy, foreign_key: :section_id
    accepts_nested_attributes_for :sectionfiles, allow_destroy: true

    def render
      html = '
      <div class="span-12">
        <div id="myCarousel" class="carousel slide">
          <ol class="carousel-indicators">'
            sectionfiles.each_with_index do |sectionfile, index|
              html << "<li data-target=\"#myCarousel\" data-slide-to=\"#{index}\">a</li>"
            end
          html << '</ol>'
          html << '<div class="carousel-inner">'

          sectionfiles.each_with_index do |sectionfile, index|
            html << "<div class\"item\">
              <img src=\"#{sectionfile.file_url(:thumb)}\"></img>
            </div>"
          end
          html << '</div>'

          html << '
          <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
          <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
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
