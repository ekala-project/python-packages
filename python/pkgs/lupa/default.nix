{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  runCommand,

  # build-system
  cython,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lupa";
  version = "2.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scoder";
    repo = "lupa";
    tag = "lupa-${finalAttrs.version}";
    # we fetch the vendored lua sources for gracefull de-vendor degredation when a new lua is added
    fetchSubmodules = true;
    hash = "sha256-XLBUQ1TrzWWST9RJdMTnpsceldDNzidnL82bixLhSRA=";
  };

  patches = [
    # The updated lua52 src has a radically changed makefile, matching lua53
    ./remove-lua52-special-case.patch
  ];

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "lupa" ];

  # this helps us discover new lua versions when bumping, without blocking mass python-updates
  passthru.tests.expected-third-party = runCommand "lupa-expected-third-party" { } ''
    declare -a expected=( lua51 lua52 lua53 lua54 lua55 luajit20 luajit21 )

    declare -a found_paths=( ${finalAttrs.src}/third-party/* )
    declare -a found=("''${found_paths[@]##*/}")
    if [[ "''${found[*]}" != "''${expected[*]}" ]]; then
      echo >&2 "./third-party/ contains unexpected paths!"
      echo >&2 "expected: ''${expected[*]}"
      echo >&2 "found:    ''${found[*]}"
      exit 1
    else
      touch $out
    fi
  '';

  meta = {
    description = "Lua in Python";
    homepage = "https://github.com/scoder/lupa";
    license = lib.licenses.mit;
  };
})
