class ProjectSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :start_date, :status

    attribute :tasks do |project|
        project.tasks.count
    end

    attribute :total_hours do |project|
        project.tasks.joins(:marks).sum('marks.h_amount')
      end
end