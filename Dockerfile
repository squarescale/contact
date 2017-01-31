FROM scratch
MAINTAINER SquareScale Engineering <engineering@squarescale.com>
LABEL Name=squarescale/contact
LABEL Version=0.1.0
COPY contact /contact
ENTRYPOINT ["/contact"]
