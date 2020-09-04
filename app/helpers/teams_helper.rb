module TeamsHelper
  def display_team_logo(team, expense = nil)
    src = ''
    src << if (expense && expense.teams.length.positive?) && team.image.attached?
             image_tag(url_for(team.image), class: 'custom-card-img')
           else
             image_tag('broken-img.png', class: 'custom-card-img')
           end
    src.html_safe
  end
end
