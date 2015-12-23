require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  context 'GET index' do
    before{ get :index }

    let(:tasks){ FactoryGirl.create(:user, :with_tasks).tasks }

    it{ expect(response).to have_http_status :success }
    it{ expect(response).to render_template :index }
    it{ expect(assigns(:tasks)).to eq tasks }
  end
end
