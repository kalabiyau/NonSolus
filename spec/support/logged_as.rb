module FeatureHelpers
  def logged_as(user)
    page.set_rack_session('user_id' => user.id)
    visit root_path
    first('.avatar').click
    expect(page).to have_content('Dashboard')
  end
end
