# frozen_string_literal: true

steps_for :user_registration_fails do
  step 'no user in the system' do
    expect(User.count).to eq(0)
  end

  step 'the user sends a registration request' do
    signup_params = {
      email: 'invalid',
    }

    post '/api/auth', params: signup_params
  end

  step 'the request is denied' do
    expect(User.count).to eq(0)
    expect(response.headers['access-token']).not_to be_present
    expect(response).to have_http_status(422)
  end

  step 'return the validaiton errors' do
    expect(json_response[:errors][:email]).to be_present
    expect(json_response[:errors][:password]).to be_present
  end
end
