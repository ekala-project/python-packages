{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  wheel,
}:

let
  self = buildPythonPackage rec {
    pname = "backports-tarfile";
    version = "1.2.0";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "jaraco";
      repo = "backports.tarfile";
      rev = "v${version}";
      hash = "sha256-X3rkL35aDG+DnIOq0fI7CFoWGNtgLkLjtT9y6+23oto=";
    };

    build-system = [
      setuptools
      setuptools-scm
      wheel
    ];

    doCheck = false;
    pythonImportsCheck = [ "backports.tarfile" ];

    passthru.tests.pytest = self.overridePythonAttrs { doCheck = true; };

    meta = {
      description = "Backport of CPython tarfile module";
      homepage = "https://github.com/jaraco/backports.tarfile";
      license = lib.licenses.mit;
      maintainers = [ ];
    };
  };
in
self
