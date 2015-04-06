module Adminpanel
  class GallerySectionsController < ApplicationController

    private
      def gallery_section_params
        params.require(:gallery_section).permit(
          {
            sectionfiles_attributes: [
              :id,
              :file,
              :_destroy
            ]
          }
        )
      end
  end
end
