class AnswersController < ApplicationController
  def index
  end

  def create
    Answer.create(answer: params['answer']['answer'],
                  question_id: params['answer']['question_id'])
  end

  def new
    @id = params[:target_id]
    @question = Question.find(@id)
    @answered = Answer.where('question_id = ?', @id).first
    @answered_user = nil
    unless @answered.nil?
      @answered_user = User.find(Question.find(@answered.question_id).user_id)
    end
    @answer = Answer.new(question_id: @id)
    render 'answers/new'
  end
end
