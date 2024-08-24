class MarkSerializer
    include JSONAPI::Serializer
    attributes :id, :task_id, :user_id, :h_amount, :date
  
    attribute :user_name do |mark|
      mark.user.name
    end
  end