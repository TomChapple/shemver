# Shemver

Shemver (from Shell and SemVer) is a command-line application to
inspect and manipulate version numbers in the [Semantic Versioning
(SemVer) format][SemVer]. It is written for POSIX shell, making it
compatible with nearly all modern Unix operating systems without the
need for compilation.

## Building

This application—although it isn't compiled—uses [`bash-tpl`][bash-tpl]
to template the script files with dynamic information including the
current version number (stored in `VERSION`), pre-release identifiers
and license.

As `bash-tpl` is a separate script kept in a Git repository, it must be
cloned before build can begin. A simple build process is as follows:

```bash
git clone https://github.com/TomChapple/shemver.git
git clone --filter=tree:0 --branch=v0.7.1 https://github.com/TekWizely/bash-tpl.git
cd shemver
mkdir bin
VERSION=$(<VERSION)-dev LICENSE=$(<LICENSE) \
  source <( ../bash-tpl/bash-tpl src/shemver.tpl ) > bin/shemver
chmod 755 bin/shemver
```

This will use the contents in `VERSION` and `LICENSE` to template the
source file `src/shemver.tpl` and store the result in `bin/shemver`,
ready for execution. In this example, the version has `-dev` appended.
During the build pipeline, this will instead be appended with a
timestamp for non-release versions.

[bash-tpl]: <https://github.com/TekWizely/bash-tpl>
[SemVer]: <https://semver.org/>
