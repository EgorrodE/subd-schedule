Rails.application.routes.draw do
  root to: 'application#index'

  resources :schedule_places, :classroom_types, :classrooms, :cases, :pairs,
            :subjects, :teachers

  post 'subjects/add_classroom_type', to: 'subjects#add_classroom_type', as: 'add_classroom_type_to_subject'
  delete 'remove_classroom_type', to: 'subjects#remove_classroom_type', as: 'remove_classroom_type_from_subject'

  get 'custom_request1', to: 'teachers#find_by_weekday_and_classroom', as: 'custom_request1'
  get 'custom_request2', to: 'teachers#not_work_on_monday_and_thursday', as: 'custom_request2'
  get 'custom_request3', to: 'weekdays#most_avaliable', as: 'custom_request3'
end
