require 'rails_helper'

RSpec.describe Account::TasksController, type: :controller do
  let(:user){ create(:user, :with_tasks) }

  context 'GET index' do
    context 'authorized' do
      login_user

      let(:tasks){ create(:user, :with_tasks).tasks }
      before{ get :index }

      it{ expect(response).to have_http_status :success }
      it{ expect(response).to render_template :index }
      it{ expect(assigns(:tasks)).to eq user.tasks }
      it{ expect(assigns(:tasks)).to_not eq tasks }
    end

    context 'not authorized' do
      before{ get :index }

      it_behaves_like 'not_authorized'
    end
  end

  context 'GET new' do

    context 'authorized' do
      login_user

      before{ get :new }

      it{ expect(response).to have_http_status :success }
      it{ expect(response).to render_template :new }
    end

    context 'not authorized' do
      before{ get :new }

      it_behaves_like 'not_authorized'
    end
  end

  context 'POST create' do

    context 'authorized' do
      login_user

      context 'with valid attribute' do
        let(:task){ attributes_for(:task) }

        it{ expect{ post :create, task: task }.to change(Task, :count).by(1) }
        it 'redirects to the new task' do
          post :create, task: task
          expect(response).to redirect_to [:account, Task.first]
        end
      end

      context 'with invalid attribute' do
        let(:task){ attributes_for(:task, name: nil) }

        it{ expect{ post :create, task: task }.to_not change(Task, :count) }
        it 're-renders the new method' do
          post :create, task: task
          expect(response).to render_template :new
        end
      end
    end

    context 'not authorized' do
      before{ post :create, task: attributes_for(:task) }

      it_behaves_like 'not_authorized'
    end
  end

  context 'GET show' do
    let(:task){ create(:task, user: user) }

    context 'authorized' do
      login_user

      context 'access success' do
        before{ get :show, id: task.id }

        it{ expect(response).to have_http_status :success }
        it{ expect(response).to render_template :show }
        it{ expect(assigns(:task)).to eq task }
      end

      context 'access failure' do
        let(:task){ create(:task) }
        before{ get :show, id: task.id }

        it{ expect(response).to have_http_status 302 }
        it{ expect(response).to redirect_to account_tasks_path }
      end
    end

    context 'not authorized' do
      before{ get :show, id: task.id }

      it_behaves_like 'not_authorized'
    end
  end

  context 'GET edit' do
    let(:task){ create(:task, user: user) }

    context 'authorized' do
      login_user

      context 'access success' do
        before{ get :edit, id: task.id }

        it{ expect(response).to have_http_status :success }
        it{ expect(response).to render_template :edit }
        it{ expect(assigns(:task)).to eq task }
      end

      context 'access failure' do
        let(:task){ create(:task) }
        before{ get :edit, id: task.id }

        it{ expect(response).to have_http_status 302 }
        it{ expect(response).to redirect_to account_tasks_path }
      end
    end

    context 'not authorized' do
      before{ get :edit, id: task.id }

      it_behaves_like 'not_authorized'
    end
  end

  context 'PATCH update' do
    let(:task){ create(:task, user: user) }

    context 'authorized' do
      login_user

      context 'with valid attributes' do
        let(:new_name) { 'New name' }

        before{ patch :update, id: task.id, task: { name: new_name }}

        it{ expect(assigns(:task)).to eq task }
        it{ expect(response).to redirect_to [:account, task] }
        it{ expect(task.reload.name).to eq new_name }
      end

      context 'with invalid attribute' do
        before{ patch :update, id: task.id, task: { name: nil }}

        it{ expect(assigns(:task)).to eq task }
        it{ expect(response).to render_template :edit }
        it{ expect(task.reload.name).to_not eq nil }
      end

      context 'access failure' do
        let(:task){ create :task }

        before{ patch :update, id: task.id, task: { name: 'New name' }}

        it{ expect(response).to have_http_status 302 }
        it{ expect(response).to redirect_to account_tasks_path }
      end
    end

    context 'not authorized' do
      before{ patch :update, id: task.id, task: { name: 'New name' }}

      it_behaves_like 'not_authorized'
    end
  end

  context 'DELETE destroy' do
    let(:task){ create(:task, user: user) }

    context 'authorized' do
      login_user

      context 'access success' do
        it{ expect{ delete :destroy, id: task.id }.to change(Task, :count).by(0) }
        it 'redirect to tasks' do
          delete :destroy, id: task.id
          expect(response).to redirect_to account_tasks_path
        end
      end

      context 'access failure' do
        let(:task){ create :task }

        before{ delete :destroy, id: task.id }

        it{ expect(response).to have_http_status 302 }
        it{ expect(response).to redirect_to account_tasks_path }
      end
    end

    context 'not authorized' do
      before{ delete :destroy, id: task.id }

      it_behaves_like 'not_authorized'
    end
  end
end
