class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def set_current_customer
	 # @current_customer = Customer.find_by(id: session[:customer_id])
  # end

  # def after_sign_up_path_for(resource)
  #   customers_information_path(current_customer)
  # end

  # def after_sign_in_path_for(resource)
  #   if customer_signed_in?
  #     root_path(current_customer)
  #   else
  #     admin_path
  #   end
  # end

  # def after_sign_out_path_for(resource)
  #   if resource == :admin
  #     admin_session_path
  #   else root_path
  #   end
  # end

  # protected

  # def configure_permitted_parameters
  #   added_attrs = [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :password_confirmation, :postal_code, :address, :telephone_number]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :sign_in, keys: [:login, :email, :encrypted_password] #:remember_me
  # end

end
