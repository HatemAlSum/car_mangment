class ModelsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :brand,[:new,:create]
end
