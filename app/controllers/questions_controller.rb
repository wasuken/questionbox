class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]

  def index
    @questions = Question.where('user_id = ?', current_user.id)
    render 'questions/index'
  end

  def create
    render 'questions/create'
  end

  def new
    render 'questions/new'
  end
end
