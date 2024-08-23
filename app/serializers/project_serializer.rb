class ProjectSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :start_date, :status

    attribute :tasks do |project|
        project.tasks.count
    end
end