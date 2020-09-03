module TeamsHelper
  def display_team_logo(team, expense = nil)
    src = ''
    src << if (expense && expense.teams.length > 0) && team.image.attached?
            image_tag(url_for(team.image), class: 'img-fluid custom-card-img')
           else
            image_tag('broken-img.png', class: 'img-fluid custom-card-img')
           end
    src.html_safe
  end
end
