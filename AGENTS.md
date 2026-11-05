# Repository Guide

This workspace contains two separate applications. Start in the directory that owns the behavior being changed, and follow its nearby tests and conventions.

## Rails application

The Rails server is in `insta/`. It uses Ruby 3.3.6 and Rails 7.2.1. Run Rails and Ruby commands from that directory.

- Run tests with `bundle exec rspec`.
- Run lint with `bin/rubocop`.
- Run the security scan with `bin/brakeman --no-pager`.
- Frontend build and lint scripts are defined in `package.json`; use Yarn from `insta/`.
- Database-backed tests need the configured PostgreSQL and Redis services.

## Flutter application

The mobile client is in `flutter/insta/`. Read its `pubspec.yaml` before changing dependencies or toolchain assumptions; the declared Dart SDK range is `<3.0.0`.

- Run tests with `flutter test` from `flutter/insta/`.
- Run static analysis with `flutter analyze` from `flutter/insta/`.

## Changes and validation

Keep changes within the owning application unless a change genuinely crosses the Rails/mobile boundary. Prefer focused tests for the touched behavior, then run relevant app-level checks when the environment supports them. Treat migrations, generated files, and dependency lockfiles as part of the owning app's conventions.
