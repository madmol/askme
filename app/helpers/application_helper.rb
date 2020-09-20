module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def word_declension(number, enot, enota, enotov)
    number_to_string = number.to_s
    if number_to_string[-2] == '1' ||
        [*'5'..'9', '0'].include?(number_to_string[-1])
      enotov
    elsif number_to_string[-1] == '1'
      enot
    else
      enota
    end
  end

  def questions_stat
    total = @questions.size
    answered = @questions.select { |q| q.answer.present? }.size
    unanswered = total - answered
    { unanswered: unanswered, answered: answered, total: total }
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def question_author(question)
    User.find(question.author_id)
  end
end
