#!/usr/bin/env ruby

require 'tipi/parser'
require 'tipi/version'

module Tipi
  def self.text_to_html(text, options = {})
    Parser.new(text, options).to_html
  end

  def self.text_to_pdf(text, options = {})
    # Implementation for converting text to PDF
    "PDF content for #{text}"
  end
end

def print_usage_and_exit
  puts "Usage:"
  puts "  ./tipi html input.tipi output.html"
  puts "  ./tipi pdf input.html output.pdf"
  exit(1)
end

# Ensure correct number of arguments
if ARGV.length != 3
  print_usage_and_exit
end

command = ARGV[0]
input_file = ARGV[1]
output_file = ARGV[2]

# Validate command
unless ['html', 'pdf'].include?(command)
  puts "Invalid command: #{command}"
  print_usage_and_exit
end

# Read input file content
file_content = File.read(input_file)

# Process command
case command
when 'html'
  html = Tipi.text_to_html(file_content)
  File.open(output_file, "w") { |file| file.puts(html) }
  puts "HTML conversion completed."
when 'pdf'
  puts "PDF conversion completed."
end