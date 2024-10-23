module CohereAiQuestions
  class WhatMeanQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
