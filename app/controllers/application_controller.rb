class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。

	add_flash_types :success, :danger, :info

	# sign_in後はマイページ遷移（あとでadminと場合分けする）
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	  	admins_top_path
	  when Customer
	    customer_path(resource)
	  end
	end

	# sign_out後は会員用TOPページ遷移
	def after_sign_out_path_for(resource)
		root_path
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:is_active, :first_name, :first_name_kana, :family_name, :family_name_kana, :post_code, :address, :email, :tel])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end

end
