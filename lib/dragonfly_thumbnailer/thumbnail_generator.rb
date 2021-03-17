module DragonflyThumbnailer
  class ThumbnailGenerator
    def initialize(options_hash = {})
      configure_dragonfly
    end

    def absolute_source_path(path)
      File.join(Bridgetown.configuration['source'], path)
    end

    def destination_path(image)
      dir = File.dirname(image.meta['original_path'])
      subdir = image.meta['geometry'].gsub(/[^a-zA-Z0-9\-]/, '')
      File.join(dir, subdir, image.name)
    end

    def absolute_destination_path(image)
      File.join(Bridgetown.configuration['destination'],
                destination_path(image))
    end

    def thumb(path, geometry, image_options = {})
      absolute_path = absolute_source_path(path)
      return unless File.exist?(absolute_path)

      image = ::Dragonfly.app.fetch_file(absolute_path)
      image.meta['original_path'] = path
      image.meta['geometry'] = geometry
      image = image.thumb(geometry, image_options)

      if Bridgetown.environment == "production"
        persist_file(image)
        destination_path(image)
      else
        image.b64_data
      end
    end

    def persist_file(image)
      path = absolute_destination_path(image)
      image.to_file(path).close
    end

    private

    def configure_dragonfly
      ::Dragonfly.app.configure do
        datastore :memory
        plugin :imagemagick
      end
    end
  end
end
