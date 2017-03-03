class TopicController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @new_post = Post.new(user_id: current_user.id, topic_id: params[:id])
  end

  def new
    @topic = Topic.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_path(@topic), notice: '新たなスレッドを作成しました。' }
        format.json { render :show, status: :created, location: @topic }
      else
        flash[:notice] = '入力にミスがあります。タイトルと説明文は必須です。'
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topic_path, notice: 'スレッド情報を更新しました。' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topic_path, notice: 'スレッドを削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
