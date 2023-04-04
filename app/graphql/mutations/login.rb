class Mutations::Login < GraphQL::Schema::Mutation

  null true

  argument :email, String, required: true
  argument :password, String, required: true

  def resolve(email:, password:)
    user = User.find_by(email: email)

    if user.present? && user.authenticate(password)
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{user.id}")
      return { user: user, token: token }
    else
      GraphQL::ExecutionError.new("Invalid credentials")
    end


  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("#{e.record.errors.full_messages.join(', ')}")
  end
  
end
  