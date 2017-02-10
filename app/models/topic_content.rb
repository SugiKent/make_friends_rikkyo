class TopicContent < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :topic_id
end
