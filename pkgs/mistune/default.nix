{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mistune";
  version = "3.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lepture";
    repo = "mistune";
    tag = "v${version}";
    hash = "sha256-rUEZNVuMT5+GsMakrkK6rshKSKtTTN72kK92AmQ8bl8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mistune" ];

  meta = {
    description = "Sane Markdown parser with useful plugins and renderers";
    homepage = "https://github.com/lepture/mistune";
    license = lib.licenses.bsd3;
  };
}
