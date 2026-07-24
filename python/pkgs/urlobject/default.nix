{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "urlobject";
  version = "2.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zacharyvoase";
    repo = "urlobject";
    tag = "v${version}";
    hash = "sha256-4UuQZTkVre8jXlchW7/TjeaADYvLnGMpGbJR/sdeKv4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "urlobject" ];

  meta = {
    description = "Python library for manipulating URLs (and some URIs) in a more natural way";
    homepage = "http://zacharyvoase.github.com/urlobject";
    license = lib.licenses.unlicense;
  };
}
