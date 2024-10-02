class Api::Podwords::BaseController < Api::BaseController
  prepend_before_action :authenticate_internal_api_token!

  private

  # This API is for internal use only. "Normal" users should not have access to API endpoints in the "podwords" namespace.
  # We secure it by creating custom "internal_api" role in the AccountUser model and then checking for it in the controller.
  def authenticate_internal_api_token!
    if (user = user_from_token)
      if user.account_users.first.active_roles.include?(:internal_api)
        sign_in user, store: false
      else
        head :unauthorized
      end
    else
      head :unauthorized
    end
  end
end
