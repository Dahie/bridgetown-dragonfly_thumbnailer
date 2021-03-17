# frozen_string_literal: true

module DragonflyThumbnailer
  class Builder < Bridgetown::Builder
    def build
      liquid_tag :thumb_path do |attributes|
        path, geometry = attributes.split(",").map(&:strip)
        _options, image_options = extract_image_options({})
        url = ThumbnailGenerator.new.thumb(path, geometry, image_options)

        url || "Image #{path} not found"
      end
    end

    def extract_image_options(options)
      image_options = {
        'format' => options.delete(:format),
        'frame'  => options.delete(:frame),
      }.delete_if { |_k, v| v.nil? }

      return options, image_options
    end
  end
end

DragonflyThumbnailer::Builder.register
