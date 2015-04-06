module Adminpanel
  class DescriptionSectionsController < Adminpanel::ApplicationController

    def update
      super do
        redirect_to @resource_instance.page
      end
    end

    private

      def description_section_params
        params.require(:description_section).permit(
          :description
        )
      end
  end
end
