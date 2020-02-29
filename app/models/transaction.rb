# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  date_of_opening  :date
#  date_unwinded    :date
#  quantity         :float
#  transaction_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  portfolio_id     :integer
#  quoted_entity_id :integer
#

class Transaction < ApplicationRecord
end
