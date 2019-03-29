class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]

  def index
    @questions = Question.where('user_id = ?', current_user.id)
                   .map{|q| {id: q.id, question: q.question, email: User.find(q.user_id).email}}
    render 'questions/index'
  end

  def create
    Question.create(question: params['question']['question'],
                    user_id: params['user_id']['select'])
    render 'questions/create'
  end

  def new
    @user_id_list = User.select(:id).where('id <> ?', current_user.id)
                      .map{|user| [User.find(user.id).email, user.id]}
    @question = Question.new
    render 'questions/new'
  end
end
