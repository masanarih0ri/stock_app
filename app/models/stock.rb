class Stock < ApplicationRecord
  validates :stock_name, presence: true, length: { maximum: 30 }

  validate :validate_stock_name_not_including_comma
  # Userに従属している
  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  private

  def validate_stock_name_not_including_comma
    # errorsにエラーの内容を格納する
    errors.add(:stock_name, 'にカンマを含めることはできません。') if stock_name&.include?(',')
  end

end
