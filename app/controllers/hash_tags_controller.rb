class HashTagsController < ApplicationController
  before_action :load_tag

  def show
    @questions = @hash_tag.questions
  end

  private
  def load_tag
    @hash_tag = HashTag.find_by(name: "##{params[:name]}")
  end
end
