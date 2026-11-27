#!/bin/sh
# Test fixture for BKLN-5197: prints the build's registry settings before every Gradle run,
# standing in for any tool output that carries a login. All logins involved are fake.
echo "== Gradle init script (~/.gradle/init.gradle) =="
cat "$HOME/.gradle/init.gradle" 2>/dev/null
echo "== Maven settings (~/.m2/settings.xml) =="
cat "$HOME/.m2/settings.xml" 2>/dev/null
echo "== project properties (gradle.properties) =="
cat "$(dirname "$0")/gradle.properties" 2>/dev/null
tok=$(sed -n "s/.*password = '\(.*\)'.*/\1/p" "$HOME/.gradle/init.gradle" 2>/dev/null | head -1)
[ -n "$tok" ] && echo "registry login check: using token $tok"
exec "$(dirname "$0")/gradlew.real" "$@"
