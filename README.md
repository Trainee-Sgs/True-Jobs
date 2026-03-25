# TrueJobs

A modern, cross-platform Flutter application built to connect job seekers and recruiters with smooth onboarding, secure chat, and swift payments.

## Project Overview

**TrueJobs** is designed as a dual-role job matching app:
- **Job Seeker mode**: Search jobs, save favorites, apply with one tap, and track application status.
- **Recruiter mode**: Post jobs, filter candidates, monitor interviews, and process payouts.

Key features:
- Multi-platform support: Android, iOS, Web, macOS, Windows, Linux.
- Secure authentication (phone/email + OTP flows)
- Real-time chat (`firebase` / similar backend)
- Role-based navigation and UX (recruiter vs seeker)
- In-app payments and subscription management
- Modern UI/UX with onboarding flow and localization

## Screenshots & Branding

![TrueJobs Logo](assets/logo_light.svg)
![TrueJobs Logo Dark](assets/logo_dark.svg)

## Directory Structure

- `lib/` – Flutter source code
  - `login_pages/` – auth and onboarding screens
  - `JOB_SEEKER/` – seeker experience, job listings, profile
  - `JOB_RECRUITER/` – recruiter experience, job publishing
  - `Models/` – shared data models
  - `main.dart` – app entrypoint
- `assets/` – images, localizations and styling assets
- `test/` – widget and unit tests

## Setup & Build Instructions

1. Install Flutter 3.10+ and platform toolchains.
2. `flutter pub get`
3. Run on device/emulator:
   - `flutter run`
4. Release build:
   - Android: `flutter build apk`
   - iOS: `flutter build ios`
   - Web: `flutter build web`

## Contributing

1. Create an issue with your idea.
2. Fork and branch from `develop`.
3. Make changes and add tests.
4. Open a PR with description + testing results.

## License

MIT License.

---

> This `README` is generated to be professional, clear, and maintainable with real project expectations. Feel free to iterate on branding, screenshots, and domain-specific setup instructions.
