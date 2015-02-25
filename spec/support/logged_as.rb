module FeatureHelpers

  def logged_as(user)
    page.set_rack_session('user_id' => user.id)
    visit root_url
    expect(page).to have_content(user.decorate.full_name)
  end
end
