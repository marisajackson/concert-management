class Employees::InvitationsController < Devise::InvitationsController
    def create
    self.resource = invite_resource

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

end