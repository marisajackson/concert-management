class Employees::InvitationsController < Devise::InvitationsController
  def create
    resource = Employee.invite!(custom_invite_params, current_promoter)


    if resource.errors.empty?
      yield resource if block_given?
      if is_flashing_format? && self.resource.invitation_sent_at
        set_flash_message :notice, :send_instructions, :email => self.resource.email
      end
      respond_with resource, :location => promoter_invites_path(resource)
    else
      respond_with_navigational(resource) { render :new }
    end
  end

  protected
    def custom_invite_params
      params.require(:employee).permit(:email, :first_name)
    end
end