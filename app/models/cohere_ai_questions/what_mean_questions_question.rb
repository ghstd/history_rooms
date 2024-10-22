module CohereAiQuestions
  class WhatMeanQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
