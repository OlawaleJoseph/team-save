module TeamsHelper
  def display_team_logo(team, expense = nil)
    src = ''
    src << if (expense && expense.teams.length > 1) && team.image.attached?
             image_tag(team.image, class: 'mx-auto img-fluid card-img-top custom-card-img')
           else
             image_tag('broken-img.png', class: 'mx-auto card-img-top')
           end
    src.html_safe
  end
end
