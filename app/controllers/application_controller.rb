class ApplicationController < ActionController::Base
	# sign_in後はマイページ遷移（あとでadminと場合分けする）
	def after_sign_in_path_for(resource)
		customer_path(resource)
	end

	# sign_out後は会員用TOPページ遷移（現在は仮でsign_in画面になっています）
	def after_sign_out_path_for
		new_customer_session_path
	end
end
