class Day < ActiveRecord::Base

    validates :user_id, presence: true

    belongs_to :user

end
