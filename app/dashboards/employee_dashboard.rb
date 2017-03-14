require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    requests: Field::HasMany.with_options(searchable: false),
    id: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    sign_in_count: Field::Number.with_options(searchable: false),
    current_sign_in_at: Field::DateTime.with_options(searchable: false),
    last_sign_in_at: Field::DateTime.with_options(searchable: false),
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: true),
    last_name: Field::String.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    type: Field::String.with_options(searchable: false),
    phone: Field::String.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :requests,
    :first_name,
    :last_name,
    :email,
    :phone,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :requests,
    :email,
    :phone,
    :first_name,
    :last_name,
    :type,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :email,
    :password,
    :phone,
    :type,
  ].freeze
end
