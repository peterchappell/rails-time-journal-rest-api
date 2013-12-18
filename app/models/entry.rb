class Entry < ActiveRecord::Base

    validates :user_id, presence: true

    belongs_to :activity
    belongs_to :user

    attr_accessor :activity_name

    before_save :create_activity_if_missing

    def create_activity_if_missing
        if activity_name.present?
            activity = Activity.find_or_create_by(name: self.activity_name, user_id: self.user_id)
            self.activity_id = activity.id
        end
    end

end
