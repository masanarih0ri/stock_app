class Stock < ApplicationRecord
  validates :stock_name, presence: true, length: { maximum: 30 }

  validate :validate_stock_name_not_including_comma

  private

  def validate_stock_name_not_including_comma
    # errorsにエラーの内容を格納する
    errors.add(:stock_name, 'にカンマを含めることはできません。') if stock_name&.include?(',')
  end
end
