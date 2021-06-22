# frozen_string_literal: true

require 'socket'
port = 3000

server = TCPServer.new(port)

puts "Server started on port #{port} at #{Time.now}"

while (session = server.accept)
  request = session.gets
  puts "#{Time.now} - #{request}"

  session.puts 'HTTP/1.1 200'
  session.puts 'Content-Type: text/plain'
  session.puts
  session.puts "Hello world! The time is #{Time.now}"

  session.puts 'Environment Variables:'
  ENV.each do |env, value|
    session.puts "#{env} -> #{value}"
  end

  session.close
end
