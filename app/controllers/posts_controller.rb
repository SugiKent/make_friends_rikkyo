class PostsController < ApplicationController
    def create
      Post.create(
        user_id: current_user.id, topic_id: params[:post][:topic_id], content: params[:post][:content]
      )
      @topic = Topic.find( params[:post][:topic_id] )
    end
end
