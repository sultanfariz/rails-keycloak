class Mutations::Register < GraphQL::Schema::Mutation

  null true

  argument :user, Types::UserInputType, required: true

  def resolve(user:)
    User.create!(
      name: user[:name],
      email: user[:email],
      password: user[:password],
    )
    # User.create!(user.to_h)
    # @user = User.new(user.to_h)
    # @user.save!
    # @user
    # master = Master.create! user.to_h.except!(:role)
    # master.session_key = master.sessions.create.key
    # return master


  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("#{e.record.errors.full_messages.join(', ')}")
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to root_path
  #     else
  #      render :new  
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation)
  # end

end
  