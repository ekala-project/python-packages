{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cachetools";
  version = "6.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tkem";
    repo = "cachetools";
    tag = "v${version}";
    hash = "sha256-LlDyrjiRYCD9btDl5NA0Seb3jk3hlpNhwu0jAQp9YZE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cachetools" ];

  meta = {
    description = "Extensible memoizing collections and decorators";
    homepage = "https://github.com/tkem/cachetools";
    license = lib.licenses.mit;
  };
}
