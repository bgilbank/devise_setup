class Page < ApplicationRecord
	extend FriendlyId
  friendly_id :tile, use: :slugged
end
