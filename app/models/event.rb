# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  client_id    :integer
#  first_name   :string
#  last_name    :string
#  relationship :integer          default(0)
#  event_date   :datetime
#  notes        :text
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Event < ActiveRecord::Base
	has_many :notifications, inverse_of: :event
end
