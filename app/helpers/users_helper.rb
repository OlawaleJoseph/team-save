module UsersHelper

  def display_invitations
    output = ''
    unless current_user.invitations.empty?
      current_user.invitations.each do |invitation|
        output << "<div class='d-flex shadow p-3 px-5 justify-content-between'>
        <h3 class='text-capitalize mr-3'> #{invitation.team.creator.username } has invited you to join #{ invitation.team.name} team </h3>
        <div>
        #{link_to('Accept', "/teams/#{invitation.team.id}/invitations/#{invitation.id}/accept", method: :put, class: 'btn  btn-success mr-2') }
        #{link_to('Reject', "/teams/#{invitation.team.id}/invitations/#{invitation.id}/reject", method: :put, class: 'btn btn-danger') }
        </div>
      </div>"
      end
    end
    output.html_safe
  end
end
