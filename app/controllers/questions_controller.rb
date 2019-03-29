class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]

  def index
    @questions = Question.where('user_id = ?', current_user.id)
    render 'questions/index'
  end

  def create
    @qp = params['question']
    Question.create(question: qp['question'], user_id: qp['user_id'])
    render 'questions/create'
  end

  def new
    @user_id_list = @User.select(:id).where('id <> ?', current_user.id)
                      .map{|id| [User.find(id).email, id]}
    @question = Question.new
    render 'questions/new'
  end
end
