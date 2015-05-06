FROM rails

RUN ["mkdir", "/code"]
WORKDIR /code

COPY Gemfile /code/Gemfile

RUN ["bundle", "install", "-j4"]

EXPOSE 3000

CMD ["rails", "server", "--binding=0.0.0.0"]

