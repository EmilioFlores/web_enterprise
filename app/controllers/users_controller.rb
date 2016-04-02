class UsersController < ApplicationController
  def set_locale
		new_locale = params[:locale]
		if ['es', 'en'].include?(new_locale)
			current_user.update_attributes(locale: new_locale)
			I18n.locale = new_locale.to_sym
			flash[:success] = t('locale_changed')
			redirect_to root_path
		else
			flash[:error] = t('locale_changed_error')
			redirect_to root_path
		end
	end

	def complete_registration
	end
end
