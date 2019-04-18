require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: 'Name',
        surname: 'Surname',
        email: 'Email',
        age: 2,
        role: 'Role'
      ),
      User.create!(
        name: 'Name',
        surname: 'Surname',
        email: 'Email',
        age: 2,
        role: 'Role'
      )
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Surname'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    # assert_select 'tr>td', text: 'Role'.to_s, count: 2
  end
end
