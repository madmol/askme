class HashTagsController < ApplicationController
  def show
    @hash_tag = HashTag.with_questions.find_by!(name: params[:name])
    @questions = @hash_tag.questions
  end
end
