module Adminpanel
  class SectionUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage :file

    def root
      Rails.root.join 'public/'
    end

    def store_dir
      "uploads/image/#{mounted_as}/#{model.id}"
    end

    # Process files as they are uploaded:
    # process :resize_to_fill => [1366, 768]

    # THE THUMB VERSION IS NECESSARY!!!!
    version :thumb do
      process :resize_to_limit => [220, 220]
    end

    # however, you can create your own versions:
    # version :awesome do
    #   process :reside_and_pad => [120, 900]
    # end

    # resize_and_pad(width, height, background=:transparent, gravity=::Magick::CenterGravity)
    #
    # Resize the image to fit within the specified dimensions while retaining
    # the original aspect ratio. If necessary, will pad the remaining area with
    # the given color, which defaults to transparent (for gif and png, white for jpeg).
    #
    # width (Integer)
    # the width to scale the image to
    # height (Integer)
    # the height to scale the image to
    # background (String, :transparent)
    # the color of the background as a hexcode, like “ff45de“
    # gravity (Magick::GravityType)
    # how to position the image

    # resize_to_fill(width, height)
    #
    # Resize the image to fit within the
    # specified dimensions while retaining the aspect ratio of the original image.
    # If necessary, crop the image in the larger dimension.
    #
    # width (Integer)
    # the width to scale the image to
    # height (Integer)
    # the height to scale the image to

    # resize_to_fit(width, height)
    #
    # Resize the image to fit within the
    # specified dimensions while retaining the original aspect ratio. The image
    # may be shorter or narrower than specified in the smaller dimension but
    # will not be larger than the specified values.
    #
    # width (Integer)
    # the width to scale the image to
    # height (Integer)
    # the height to scale the image to

    # resize_to_limit(width, height)
    #
    # Resize the image to fit within the specified dimensions while retaining
    # the original aspect ratio. Will only resize the image if it is larger than
    # the specified dimensions. The resulting image may be shorter or narrower
    # than specified in the smaller dimension but will not be larger than the
    # specified values.
    #
    # width (Integer)
    # the width to scale the image to
    # height (Integer)
    # the height to scale the image to
    def extension_white_list
      %w(jpg jpeg png)
    end
  end
end
