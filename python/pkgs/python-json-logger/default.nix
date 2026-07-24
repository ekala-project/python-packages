{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-json-logger";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nhairs";
    repo = "python-json-logger";
    tag = "v${version}";
    hash = "sha256-hJ29rDP04apLf1zaP1vQrYF5xm4GtKZlvno97b7g+hg=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Json Formatter for the standard python logger";
    homepage = "https://github.com/madzak/python-json-logger";
    license = lib.licenses.bsdOriginal;
  };
}
