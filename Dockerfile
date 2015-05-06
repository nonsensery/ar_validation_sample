FROM rails

RUN ["mkdir", "/code"]
WORKDIR /code

COPY Gemfile /code/Gemfile

RUN ["bundle", "install", "-j4"]

COPY . /code

CMD ["rake", "test"]
