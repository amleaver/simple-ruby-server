FROM ruby:2.7.3-alpine

# Bundle app source
COPY . .

CMD ["ruby", "server.rb"]
