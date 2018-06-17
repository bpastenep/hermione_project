Rails.application.routes.draw do
  resources :evaluations
  devise_for :users
  resources :questions
  resources :purposes
  resources :rda_especifics
  resources :rda_generals
  resources :programs
  resources :users
  root to: 'home#index'
  
  get 'active' => 'evaluations#active', as: :active
  post 'quiz'	=> 'questions#quiz', as: :quiz
  post 'activequestion' => 'evaluations#activequestion', as: :activequestion
  post 'activarpregunta' => 'evaluations#activarpregunta', as: :activarpregunta
  post 'desactivarpregunta' => 'evaluations#desactivarpregunta', as: :desactivarpregunta
  get 'searchQuestionActive' => 'questions#searchQuestionsActive', as: :searchQuestionsActive
  post 'saveanswer' => 'answers#saveanswer', as: :saveanswer
  post 'viewresult' => 'evaluations#viewresult', as: :viewresult
  post 'creargrupo' => 'evaluations#crearGrupo', as: :creargrupo
  post 'cargarprograma' => 'home#cargarprograma', as: :cargarprograma
  get 'createcourse' => 'courses#createcourse', as: :createcourse
  post 'guardarcurso' => 'courses#guardarcurso', as: :guardarcurso
  get 'cursoShow' => 'courses#show', as: :cursoShow
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 