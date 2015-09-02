FROM cloudgear/ruby:2.2

ENV CODE_HOME /code
RUN mkdir -p $CODE_HOME
WORKDIR $CODE_HOME

# Copy Gemfile and Gemfile.lock ahead of the rest of the code
COPY Gemfile* $CODE_HOME/

# Install gems
RUN bundle install

# Copy the rest of the code
COPY . $CODE_HOME

RUN echo testing

CMD ["sleep","infinity"]
