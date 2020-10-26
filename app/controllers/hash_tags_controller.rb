class HashTagsController < ApplicationController
  before_action :load_tag

  def show
  end

  private

  def load_tag
    @hash_tag = HashTag.find_by(name: params[:name])
    @questions =
      if @hash_tag.blank?
        @hash_tag = HashTag.new(name: params[:name])
        nil
      elsif @hash_tag.questions.present?
        @hash_tag.questions
      else
        @hash_tag.destroy
        nil
      end
  end
end
