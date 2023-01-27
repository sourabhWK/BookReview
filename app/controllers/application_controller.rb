class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  
  include Pundit
  rescue_from Pundit::NotAuthorizedError || Pundit::NotDefinedError do |exception|
    policy = exception.policy
    policy_name = exception.policy.class.to_s.underscore
    error_key = if policy.respond_to?(:policy_error_key) && policy.policy_error_key
                  policy.policy_error_message
                else
                  exception.query
                end
    flash[:error] = t("#{policy_name}.#{error_key}", scope: 'pundit', default: :default)
    redirect_to(root_path || request.referrer )
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type])
  end


  
end
