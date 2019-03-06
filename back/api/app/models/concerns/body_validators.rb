module BodyValidators
  extend ActiveSupport::Concern

  included do
    validates :body, presence: true,
                     length: { maximum: 200 }
  end
end