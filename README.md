## RPM packaging using Gradle

Since the [nebula.rpm Gradle plugin](https://plugins.gradle.org/plugin/nebula.rpm) uses [redline RPM](https://github.com/craigwblake/redline) packaging library
that is fully implemented in Java and doesn't require RPM packaging binaries,
there are some limitations like you can't use macroses in your build.

List of RPM macroses could be found [here](http://fedoraproject.org/wiki/Packaging:RPMMacros).

Another option will be to use maven-rpm-plugin to build RPM packages using system RPM binaries.

So the workaround is to use just Gradle's files filtering feature with ReplaceTokens to
replace placeholders in script files to dynamically configure the build
