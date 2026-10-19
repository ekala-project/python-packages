{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  python,
}:

buildPythonPackage rec {
  pname = "ibis";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dmulholl";
    repo = "ibis";
    tag = version;
    hash = "sha256-9ELOAQhD6KXyTN2U0lGmNxxSzx9o2QIt+CNa6i8o5xs=";
  };

  build-system = [ setuptools ];

  checkPhase = ''
    ${python.interpreter} test_ibis.py
  '';

  pythonImportsCheck = [ "ibis" ];

  meta = {
    description = "Lightweight template engine";
    homepage = "https://github.com/dmulholland/ibis";
    license = lib.licenses.publicDomain;
  };
}
