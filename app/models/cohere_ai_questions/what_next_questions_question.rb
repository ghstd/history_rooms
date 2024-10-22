module CohereAiQuestions
  class WhatNextQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
