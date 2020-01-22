 class Product < ApplicationRecord
   has_many :line_items
   has_many :orders, through: :line_items
   before_destroy :ensure_not_referenced_by_any_line_item

   validates :title, :description, :image_url, :price, presence: true
   validates :title, uniqueness: true
   validates :price, numericality: {greater_than_or_equal_to: 0.01}
   validates :image_url, allow_blank: true, format: {
     with: %r{\.(gif|jpg|png)\Z}i,
     message: 'must be a URL for GIF, JPG, or PNG image.'
   }

   def price_by_locale(price)
     case I18n.locale.to_s
     when 'es'
       return price/=4.65
     when 'en'
       return price/=4.21
     else
       price
     end
   end

   private

   #ensure that there are no line items referencing this products
   def ensure_not_referenced_by_any_line_item
     unless line_items.empty?
       errors.add(:base, 'Line Items present')
       throw :abort
     end
   end



end
