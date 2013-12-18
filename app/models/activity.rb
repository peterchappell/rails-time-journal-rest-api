class Activity < ActiveRecord::Base

    validates :name, uniqueness: { scope: :user_id }, presence: true
    validates :user_id, presence: true

    has_many :entries

    belongs_to :user

    before_save :downcase_name

    def downcase_name
        name = name.to_s.downcase
    end

end
