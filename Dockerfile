FROM ruby:2.7.6-alpine

# Bundle app source
COPY . .

ENTRYPOINT ["./server.rb"]
