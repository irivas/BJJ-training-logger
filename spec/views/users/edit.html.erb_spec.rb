require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: 'MyString',
      surname: 'MyString',
      email: 'MyString',
      age: 1,
      role: 'MyString'
    ))
  end

  it 'renders the edit user form' do
    render
    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[name]'
      assert_select 'input[name=?]', 'user[surname]'
      assert_select 'input[name=?]', 'user[email]'
      assert_select 'input[name=?]', 'user[age]'
      assert_select 'input[name=?]', 'user[role]'
    end
  end
end
