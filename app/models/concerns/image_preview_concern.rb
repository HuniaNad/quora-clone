module ImagePreviewConcern
    extend ActiveSupport::Concern

    included do
        def preview(dimensions)
            image.variant(resize: dimensions).processed
        end
    end
end