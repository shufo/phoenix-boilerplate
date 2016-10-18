FROM shufo/phoenix:1.3.4
MAINTAINER shufo

ENV MIX_ENV=prod

WORKDIR /app
ADD . /app
RUN MIX_ENV=prod mix compile

EXPOSE 4000
CMD ["sh" "-c", "mix deps.get && mix phoenix.server"]
