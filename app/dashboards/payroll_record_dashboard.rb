require "administrate/base_dashboard"

class PayrollRecordDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(searchable: true),
    id: Field::Number.with_options(searchable: false),
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    hours: Field::String.with_options(searchable: false),
    amount: Field::String.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :start_date,
    :end_date,
    :hours,
    :amount,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :start_date,
    :end_date,
    :hours,
    :amount,
    :created_at,
    :updated_at,
  ].freeze

end
