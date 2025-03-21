# frozen_string_literal: true

require_relative "clean_reporter/version"
require "minitest/reporters"

module CleanReporter
  class Error < StandardError; end
  # Your code goes here...
end

Minitest::Reporters.use!([CleanReporter::Reporter.new(color: true)])
