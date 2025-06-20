class UserSerializer < Blueprinter::Base
  identifier :id

  fields :email, :created_at, :updated_at

  # Exemplo de campo customizado
  field :name do |user, options|
    "#{user.first_name} #{user.last_name}"
  end
end