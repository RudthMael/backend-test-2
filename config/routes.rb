Rails.application.routes.draw do
  post '/calls/create' => "calls#create"
  post '/calls/update' => "calls#update"
  post '/calls/complete' => "calls#complete"
  post '/calls/complete_voicemail' => "calls#complete_voicemail"
end
