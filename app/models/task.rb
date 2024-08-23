class Task < ApplicationRecord
    belongs_to :project

    enum status: { active: 0, archived: 1 }

    validates :name, presence: true
    validates :status, presence: true

    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :active
    end
end
