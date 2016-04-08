# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  event_id          :integer
#  notification_type :string
#  read              :boolean          default(FALSE)
#  description       :text
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Notification < ActiveRecord::Base
	belongs_to :event, inverse_of: :notifications
end
