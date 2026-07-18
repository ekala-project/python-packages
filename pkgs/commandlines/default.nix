{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "commandlines";
  version = "0.4.1";
  pyproject = true;

  # PyPI source tarballs omit tests, fetch from Github instead
  src = fetchFromGitHub {
    owner = "chrissimpkins";
    repo = "commandlines";
    rev = "v${version}";
    hash = "sha256-x3iUeOTAaTKNW5Y5foMPMJcWVxu52uYZoY3Hhe3UvQ4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "commandlines" ];

  meta = {
    description = "Python library for command line argument parsing";
    homepage = "https://github.com/chrissimpkins/commandlines";
    license = lib.licenses.mit;
  };
}
