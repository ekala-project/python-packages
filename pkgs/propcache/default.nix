{
  lib,
  buildPythonPackage,
  cython,
  expandvars,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "propcache";
  version = "0.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "propcache";
    tag = "v${version}";
    hash = "sha256-7HQUOggbFC7kWcXqatLeCTNJqo0fW9FRCy8UkYL6wvM=";
  };

  postPatch = ''
    substituteInPlace packaging/pep517_backend/_backend.py \
      --replace "Cython ~=" "Cython >="
  '';

  build-system = [
    cython
    expandvars
    setuptools
  ];

  pythonImportsCheck = [ "propcache" ];

  meta = {
    description = "Fast property caching";
    homepage = "https://github.com/aio-libs/propcache";
    license = lib.licenses.asl20;
  };
}
