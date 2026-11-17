FROM ruby:4.0.9
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /toy_chat_dk
WORKDIR /toy_chat_dk
ADD Gemfile /toy_chat_dk/Gemfile
ADD Gemfile.lock /toy_chat_dk/Gemfile.lock
RUN bundle install
ADD . /toy_chat_dk
RUN echo '#!/bin/sh' > /usr/bin/entrypoint.sh \
 && echo 'ruby -e '"'"'Dir.glob("/toy_chat_dk/bin/*").each{|f|next unless File.file?(f);c=File.binread(f);c=c.byteslice(3..-1) if c.byteslice(0,3)=="\xEF\xBB\xBF".b;c.gsub!("\r\n","\n");c.gsub!("\r","\n");File.binwrite(f,c)}'"'" >> /usr/bin/entrypoint.sh \
 && echo 'exec "$@"' >> /usr/bin/entrypoint.sh \
 && chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
