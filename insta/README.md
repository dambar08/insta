# Rails Project

[![Ruby](https://img.shields.io/badge/Ruby-3.3.6-red)](https://www.ruby-lang.org/en/)
[![Rails](https://img.shields.io/badge/Rails-7.2.1-blue)](https://rubyonrails.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14-blue)](https://www.postgresql.org/)
[![Redis](https://img.shields.io/badge/Redis-6-orange)](https://redis.io/)
[![Sidekiq](https://img.shields.io/badge/Sidekiq-7.1-purple)](https://sidekiq.org/)
[![RSpec](https://img.shields.io/badge/RSpec-6.0-red)](https://rspec.info/)
[![Build Status](https://github.com/USERNAME/REPO/actions/workflows/ci.yml/badge.svg)](https://github.com/USERNAME/REPO/actions/workflows/ci.yml)
[![Coverage](https://img.shields.io/badge/Coverage-95%25-brightgreen)](coverage/index.html)

## Overview

This is a **Ruby on Rails 7.2 project** using **Ruby 3.3.6**, PostgreSQL, Redis, and modern Rails tooling.
The project includes authentication, authorization, background jobs, file uploads, testing, analytics, and more.

---

## Ruby & Rails

- **Ruby version:** 3.3.6
- **Rails version:** 7.2.1

---

## Key Gems and Their Purpose

### Authentication & Authorization

- `devise` – Authentication
- `devise_invitable` – Inviting users
- `doorkeeper` – OAuth2 provider
- `rolify` – Role management
- `pundit` – Authorization policies

### Database & Models

- `pg` – PostgreSQL adapter
- `active_record_extended` – Additional ActiveRecord utilities
- `acts_as_paranoid` – Soft-delete support
- `acts_as_follower` – Social following relationships
- `counter_culture` – Counter caches for ActiveRecord
- `friendly_id` – Human-friendly slugs
- `rails-settings-cached` – Application settings

### Background Jobs & Processing

- `sidekiq` – Background job processing
- `rpush` – Push notifications
- `image_processing` – Active Storage image variants

### File Uploads & Cloud

- `cloudinary` – Cloud storage for images and media
- `active_storage_validations` – Validations for Active Storage attachments

### Frontend & Assets

- `stimulus-rails` – JavaScript framework
- `turbo-rails` – Turbo for Hotwire
- `cssbundling-rails` – CSS bundling
- `jsbundling-rails` – JS bundling
- `font-awesome-sass` – Icons

### Analytics & Tracking

- `ahoy_matey` – Visits & events
- `ahoy_email` – Email tracking

### Testing

- `rspec-rails` – Testing framework
- `factory_bot_rails` – Test factories
- `capybara` – System testing
- `shoulda-matchers` – Test helpers for Rails
- `database_cleaner-active_record` – Clean test DB
- `simplecov` & `simplecov-lcov` – Test coverage
- `rspec-retry` – Retry flaky tests
- `pundit-matchers` – Policy test helpers

### Development & Debugging

- `pry-rails` – Interactive console
- `better_errors` & `binding_of_caller` – Debugging in dev
- `bullet` – N+1 query detection
- `rack-mini-profiler` – Performance profiling
- `annotate` – Annotate models with schema

### Security

- `bcrypt` – Password hashing
- `rack-attack` – Throttling and security rules
- `vault` – Secrets management
- `brakeman` – Static analysis security scanner
- `bundler-audit` – Vulnerability scanning

### Performance & Utilities

- `bootsnap` – Speeds up boot time
- `propshaft` – Asset management
- `parallel_tests` – Run tests in parallel
- `pagy` – Pagination

### GraphQL & APIs

- `graphql` – GraphQL API support
- `jbuilder` – JSON API responses
- `rswag-ui` & `rswag-api` – Swagger API documentation

### Other Utilities

- `draper` – Decorators
- `fastimage` – Get image dimensions quickly
- `field_test` – Feature testing helpers
- `warning` – Suppress Ruby warnings
- `undercover` – Test coverage metrics

---

## Setup Instructions

1. **Install Ruby and Rails**

```bash
rbenv install 3.3.6
gem install rails -v 7.2.1
```

2. **Install dependencies**

```bash
bundle install
```

3. **Setup database**

```bash
rails db:create
rails db:migrate
```

4. **Run tests**

```bash
bundle exec rspec
```

5. **Start server**

```bash
rails server
```

## Development Tools**

- Hotwire: stimulus-rails + turbo-rails

- Live reload: hotwire-livereload

- CSS & JS bundling: cssbundling-rails, jsbundling-rails

## Testing

- RSpec for unit and integration tests

- Capybara for system tests

- SimpleCov for coverage

- DatabaseCleaner to maintain test DB

## Deployment

- Database: PostgreSQL

- Cache & Pub/Sub: Redis (for Action Cable & Sidekiq)

- Background jobs: Sidekiq

- File storage: Cloudinary

- Secrets management: Vault

## Notes

Ruby constants and namespaces follow Rails 8 / Zeitwerk conventions.

Decorators, services, and models are namespaced for autoloading.

Use :: to reference top-level classes/modules when defining nested classes (e.g., ::Draper::TestCase).
