class HashTagsController < ApplicationController
  before_action :load_tag

  def show
    if @hash_tag.blank?
      render_404
    else
      @questions = @hash_tag.questions
    end
  end

  private

  def load_tag
    @hash_tag = HashTag.with_questions.find_by(name: params[:name])
  end
end
