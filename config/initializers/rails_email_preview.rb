configure_email_preview if Rails.env.development?

def configure_email_preview
  require 'rails_email_preview'

  Rails.application.config.to_prepare do
    # Auto-load preview classes from:
    RailsEmailPreview.preview_classes = Dir[Rails.root.join 'app/mailer_previews/*_preview.rb'].map { |p|
      File.basename(p, '.rb').camelize
    }
  end
end

