class AnswersController < ApplicationController
  def index
  end

  def create
    p params
    # Answer.create(answer: params[:])
  end

  def new
    @id = params[:target_id]
    @question = Question.find(@id)
    @answer = Answer.new(question_id: @id)
    render 'answers/new'
  end
end
