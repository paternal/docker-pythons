#!/usr/bin/env python3

# Copyright 2019-2021 Louis Paternault
#
# This file is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero Public License for more details.
#
# You should have received a copy of the GNU Affero Public License
# along with this file.  If not, see <http://www.gnu.org/licenses/>.

"""Generate docker files and README."""

import collections
import json
import os
import pathlib
import sys
import time
import urllib.request

import jinja2

ROOT = pathlib.Path(__file__).parent.parent
TEMPLATEDIR = ROOT / "utils" / "templates"

RELEASES = {
    9: "stretch",
    10: "buster",
    11: "bullseye",
    12: "bookworm",
    #13: "trixie",
}
RELEASES[max(RELEASES)+1] = "sid"
RELEASES[max(RELEASES)+2] = "experimental"

PACKAGES = [
    "cython3",
    "jython",
    "pypy",
    "pypy-tk",
    "pypy3",
    "pypy3-tk",
    "python3",
    "python3-dev",
    "python3-pip",
    "python3-tk",
    "python3-distutils",
    "python3.4",
    "python3.4-dev",
    "python3.5",
    "python3.5-dev",
    "python3.6",
    "python3.6-dev",
    "python3.7",
    "python3.7-distutils",
    "python3.7-dev",
    "python3.8",
    "python3.8-distutils",
    "python3.8-dev",
    "python3.9",
    "python3.9-distutils",
    "python3.9-dev",
    "python3.10",
    "python3.10-distutils",
    "python3.10-dev",
]

PYPI3 = [
        "black",
        "coverage",
        "pycodestyle",
        "pylint",
        "tox",
        ]

BIN = (
    [
        package
        for package in PACKAGES
        if not (package.endswith("-dev") or package.endswith("-pip") or package.endswith("-tk") or package.endswith("-distutils"))
    ]
    + PYPI3
    + ["pip3"]
)


def wait():
    """Wait half a second, and display a progress on standard error."""
    sys.stderr.write(".")
    sys.stderr.flush()
    time.sleep(0.5)


def get_suites():
    """Return a dictionary of debian versions.

    - keys: name (stable, unstable, etc.)
    - values: codename (stretch, bullseye, etc.)
    """
    suite2codename = {}
    for codename in RELEASES.values():
        with urllib.request.urlopen(
            "https://api.ftp-master.debian.org/suite/{}".format(codename)
        ) as url:
            wait()
            data = json.loads(url.read().decode())
            suite2codename[data["name"]] = data["codename"]
    return suite2codename


def get_packages(suite2codename):
    """Return a dictionary of available packages.

    - keys: packages
    - values: list of debian versions this package can be installed for.
    """
    packages = {}
    for package in PACKAGES:
        packages[package] = []
        with urllib.request.urlopen(
            "https://api.ftp-master.debian.org/madison?package={}&f=json".format(
                package
            )
        ) as url:
            wait()
            data = json.loads(url.read().decode())
            if not data:
                continue
            for suite in data[0][package]:
                if suite in suite2codename:
                    packages[package].append(suite2codename[suite])
    return packages


def get_target(candidates, codename):
    """Given a codename and candidates, return the preferred target.

    That is:
    - if codename is a candidate, return it;
    - if there is a candidate version *newer* than codename, return the first one;
    - if there is a candidate version *older* than codename, return the last one;
    - else, return None.
    """
    if codename in candidates:
        return codename

    # Sort releases
    releases = [RELEASES[number] for number in sorted(RELEASES)]
    newer = [
        name for name in releases[releases.index(codename) + 1 :] if name in candidates
    ]
    older = [
        name for name in releases[: releases.index(codename)] if name in candidates
    ]

    # Try newer releases, then older
    if newer:
        return newer[0]
    if older:
        return older[-1]

    # No release found
    return None


def get_installable(suite2codename):
    """Return dictionary of installable packages (for every debian version).

    Return a dictionary:
    - keys: debian version
    - values: dictionary
        - keys: target version
        - values: list of installable package in this version
    """
    installable = {}
    packages = get_packages(suite2codename)
    for codename in RELEASES.values():
        if codename in ("sid", "experimental"):
            continue
        installable[codename] = collections.defaultdict(list)
        for package in packages:
            target = get_target(packages[package], codename)
            if target is None:
                continue
            installable[codename][target].append(package)
    return installable


def suite_package_target(installable):
    """Convert a suite/target/packages dictionary into a suite/package/target one."""
    suites = collections.defaultdict(dict)
    for suite in installable:
        for target in installable[suite]:
            for package in installable[suite][target]:
                suites[suite][package] = target
    return suites


def main():
    """Main function"""
    # Get information about debian releases and python packages
    suite2codename = get_suites()
    installable = get_installable(suite2codename)

    # Generate Dockerfiles
    templates = {
            path.relative_to(TEMPLATEDIR): jinja2.Environment(
                loader=jinja2.FileSystemLoader(TEMPLATEDIR)
                ).get_template(str(path.relative_to(TEMPLATEDIR)))
            for path in TEMPLATEDIR.glob("**/*")
            if (
                path.is_file()
                and not path.match(".*")
                and not path.match("*~")
                and not path.name == "README.md"
                )
            }
    for filename, template in templates.items():
        for codename in installable:
            dest = ROOT / codename / filename
            dest.parent.mkdir(exist_ok=True)
            with open(dest, "w") as destfileobject:
                destfileobject.write(
                    template.render(
                        codename=codename,
                        suites=installable[codename],
                        pypi3=PYPI3,
                        bin=BIN,
                        number2codenames=RELEASES,
                    )
                )

    # Generate README
    template = jinja2.Environment(
        loader=jinja2.FileSystemLoader(TEMPLATEDIR)
    ).get_template("README.md")
    with open(os.path.join(ROOT, "README.md"), "w") as readme:
        readme.write(
            template.render(
                suites=suite_package_target(installable),
                pypi3=PYPI3,
                stable=suite2codename["stable"],
            )
        )


if __name__ == "__main__":
    main()
