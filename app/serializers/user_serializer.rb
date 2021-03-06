# frozen_string_literal: true

class UserSerializer < Blueprinter::Base
  identifier :id

  fields :name, :email, :created_at, :updated_at
end
