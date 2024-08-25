class ProjectSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :start_date, :status

    attribute :tasks do |project|
        project.tasks.count
    end

    attribute :total_hours do |project|
        project.tasks.joins(:marks).sum('marks.h_amount')
    end

    attribute :marks_count do |project|
        project.tasks.joins(:marks).count('marks.id')
    end
end