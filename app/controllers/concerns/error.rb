module Error
  extend ActiveSupport::Concern

included do
  rescue_from ActiveRecord::RecordNotFound do
    redirect_to products_path, alert: 'It has not been found'
    end
  end
end
