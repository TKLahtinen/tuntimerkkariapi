class TaskSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :start_date, :status

    attribute :marks_count do |task|
        task.marks.count
      end
    
      attribute :total_hours do |task|
        task.marks.sum(:h_amount)
      end
end