class Product < ApplicationRecord

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence:true
  validates :title, uniqueness:true
  validates :image_url, allow_blank:true, format:{
    with: /\.(png|jpg|gif)\z/i,
    message:'must be a URL for GIF,PNG or JPG image'
  }
  validates :price, numericality:{greater_than_or_equal_to: 0.01}
  validates :title, length:{minimum: 10}

  private
     
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end        
end
