{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "fqdn";
  version = "1.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ypcrts";
    repo = "fqdn";
    tag = "v${version}";
    hash = "sha256-T0CdWWr8p3JVhp3nol5hyxsrD3951JE2EDpFt+m+3bE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "fqdn" ];

  meta = {
    description = "RFC-compliant FQDN validation and manipulation";
    homepage = "https://github.com/ypcrts/fqdn";
    license = lib.licenses.mpl20;
  };
}
