# Build stage
FROM rust:1.69-buster as builder

WORKDIR /app

ARG DATABSE_URL

ENV DATABSE_URL=$DATABSE_URL

COPY . .

RUN cargo build --release

# Production stage
FROM debian:burster-slim

WORKDIR /user/local/bin

COPY --from=builder /app/target/release/backend .

CMD [ "./backend" ]