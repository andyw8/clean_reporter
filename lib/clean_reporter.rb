# frozen_string_literal: true

require_relative "clean_reporter/version"
require "minitest/reporters"

module CleanReporter
  class Error < StandardError; end
  class Reporter < Minitest::Reporters::DefaultReporter
    def on_report
      status_line = "Finished tests in %.6fs, %.4f tests/s, %.4f assertions/s." %
        [total_time, count / total_time, assertions / total_time]

      puts
      puts
      puts colored_for(suite_result, status_line)
      puts

      unless @fast_fail
        tests.reject(&:passed?).each do |test|
          print_failure(test)
        end
      end

      if @slow_count > 0
        slow_tests = tests.sort_by(&:time).reverse.take(@slow_count)

        puts
        puts "Slowest tests:"
        puts

        slow_tests.each do |test|
          puts "%.6fs %s#%s" % [test.time, test.name, test_class(test)]
        end
      end

      if @slow_suite_count > 0
        slow_suites = @suite_times.sort_by { |x| x[1] }.reverse.take(@slow_suite_count)

        puts
        puts "Slowest test classes:"
        puts

        slow_suites.each do |slow_suite|
          puts "%.6fs %s" % [slow_suite[1], slow_suite[0]]
        end
      end

      puts
      print colored_for(suite_result, result_line)
      puts
    end
  end
end

Minitest::Reporters.use!([CleanReporter::Reporter.new(color: true)])
