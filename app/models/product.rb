class Product < ApplicationRecord
  validates :title, :description, :image_url, presence:true
  validates :title, uniqueness:true
  validates :image_url,allow_blank:true,format:{
    with: /\.(png|jpg|gif)\z/i,
    message:'must be a URL for GIF,PNG or JPG image'
  }
  validates :price,numericality:{greater_than_or_equal_to:0.01}
end
