module CohereAiQuestions
  class WhatNextQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
