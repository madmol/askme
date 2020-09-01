class UsersController < ApplicationController

  before_action :load_user, except: [:index, :create, :new]

  def index
    @users = User.all
    # # Создаём массив из двух болванок пользователей. Вызываем метод # User.new, который создает модель, не записывая её в базу.
    # # У каждого юзера мы прописали id, чтобы сымитировать реальную
    # # ситуацию – иначе не будет работать хелпер путей
    # @users = [
    #     User.new(
    #         id: 1,
    #         name: 'Vadim',
    #         username: 'installero',
    #         avatar_url: 'https://secure.gravatar.com/avatar/' \
    #     '71269686e0f757ddb4f73614f43ae445?s=100'
    #     ),
    #     User.new(id: 2, name: 'Misha', username: 'aristofun')
    # ]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit
  end

  def new
    @user = User.new
  end

  def show
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build
    # @user = User.new(
    #     name: 'Vadim',
    #     username: 'installero',
    #     avatar_url: 'https://secure.gravatar.com/avatar/' \
    #   '71269686e0f757ddb4f73614f43ae445?s=100'
    # )
    #
    # @questions = [
    #     Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
    #     Question.new(text: 'В чем смысл жизни? ', created_at: Date.parse('27.03.2016'))
    # ]
    #
    # @new_question = Question.new
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены!'
    else
      render 'edit'
    end
  end

  private

  def load_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
