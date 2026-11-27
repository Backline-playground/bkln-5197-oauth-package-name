# bkln-5197-oauth-package-name

Test fixture for BKLN-5197. Its vulnerable dependency, `org.springframework.security.oauth:spring-security-oauth2`, and `io.jsonwebtoken:jjwt-api` have group names that end in a login word, which the log masker must keep. Like bkln-5197-gradle-cred-print, `gradlew` prints the registry settings Backline wrote and the project's own `gradle.properties` on every run, so the masker must still hide those. Every login involved is fake.
