class AnswersController < ApplicationController
  def index
  end

  def create
    p params
    Answer.create(answer: params['answer']['answer'],
                  question_id: params['answer']['question_id'])
  end

  def new
    @id = params[:target_id]
    @question = Question.find(@id)
    @answer = Answer.new(question_id: @id)
    render 'answers/new'
  end
end
