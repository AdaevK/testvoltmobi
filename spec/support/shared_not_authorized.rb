RSpec.shared_examples 'not_authorized' do
  it{ expect(response).to have_http_status 302 }
  it{ expect(response).to redirect_to new_user_session_path }
end
