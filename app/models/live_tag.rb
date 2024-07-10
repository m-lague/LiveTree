class LiveTag < ApplicationRecord
  belongs_to :tag
  belongs_to :live
end
