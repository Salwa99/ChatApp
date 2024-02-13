class Room < ApplicationRecord
    validates_uniqueness_of :name
    scope :public_rooms, -> {where(is_private: false)}
    after_create_commit { proadcast_if_public}
    has_many :messages
    has_many :participants, dependent: :destroy
    has_many :joinables, dependent: :destroy
    has_many :joined_users, through: :joinables, source: :user
    

    def proadcast_if_public 
        broadcast_append_to "rooms" unless self.is_private
    end

    def self.create_private_room(users, room_name)
        single_room = Room.create(name: room_name, is_private: true)
        users.each do |user|
            Participant.create(user_id: user.id, room_id: single_room.id)
        end
        single_room
    end

    def participant?(room, user)
        room.participants.where(user: user).exists?
    end
end
