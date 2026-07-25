# SPDX-FileCopyrightText: Copyright (c) 2024 Yegor Bugayenko
# SPDX-License-Identifier: MIT
# Build context: repository root

FROM perl:5-slim

LABEL "repository"="https://github.com/yegor256/bibcop-action"
LABEL "maintainer"="Yegor Bugayenko"
LABEL "version"="0.1.0"

WORKDIR /home
COPY tests/fixtures/entry.sh /home/entry.sh
COPY tests/fixtures/bibcop.pl /usr/bin/bibcop.pl
RUN chmod a+x /home/entry.sh /usr/bin/bibcop.pl

ENTRYPOINT ["/home/entry.sh"]
