#!/usr/bin/env ruby
# frozen_string_literal: true

require 'logger'
require 'socket'

log_device = File.exists?('/proc/1/fd/1') ? '/proc/1/fd/1' : STDOUT
logger = Logger.new(log_device)

port = 3000

server = TCPServer.new(port)

logger.info "Server started on port #{port} at #{Time.now}"

while (session = server.accept)
  request = session.gets
  logger.info "#{Time.now} - #{request}"

  session.puts 'HTTP/1.1 200'
  session.puts 'Content-Type: text/plain'
  session.puts
  session.puts "Hello world! The time is #{Time.now}"

  session.puts "\n\rENVIRONMENT VARIABLES:"
  ENV.each do |env, value|
    session.puts "#{env} -> #{value}"
  end

  session.puts "\n\rREQUEST PARAMETERS:"
  /^[A-Z]+ \/.*\?(.*?) HTTP.*$/.match(request)&.captures&.[](0)&.split('&')&.each do |param_pair|
    session.puts "#{param_pair}"
  end

  session.close
end
