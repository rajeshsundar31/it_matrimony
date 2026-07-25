FROM ghcr.io/cirruslabs/flutter:3.44.2

WORKDIR /it_matrimony

COPY . .

RUN flutter pub get

RUN flutter doctor

RUN flutter build apk --release

CMD ["bash"]