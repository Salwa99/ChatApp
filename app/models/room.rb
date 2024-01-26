class Room < ApplicationRecord
    validate_uniqueness_of :name
    scope :public_rooms, -> {where(is_private: false)}
end
