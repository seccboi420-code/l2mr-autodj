FROM savonet/liquidsoap:v2.2.5

WORKDIR /app
COPY radio.liq /app/radio.liq
RUN mkdir -p /app/media
CMD ["liquidsoap", "/app/radio.liq"]
