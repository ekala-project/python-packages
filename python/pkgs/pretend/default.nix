{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pretend";
  version = "1.0.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alex";
    repo = "pretend";
    tag = "v${version}";
    hash = "sha256-OqMfeIMFNBBLq6ejR3uOCIHZ9aA4zew7iefVlAsy1JQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pretend" ];

  meta = {
    description = "Module for stubbing";
    homepage = "https://github.com/alex/pretend";
    license = lib.licenses.bsd3;
  };
}
