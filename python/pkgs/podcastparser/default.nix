{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "podcastparser";
  version = "0.6.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gpodder";
    repo = "podcastparser";
    tag = version;
    hash = "sha256-eF/YHKSCMZnavkoX3LcAFHPSPABijn+aPVzaeRYY3WI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "podcastparser" ];

  meta = {
    description = "Module to parse podcasts";
    homepage = "http://gpodder.org/podcastparser/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
