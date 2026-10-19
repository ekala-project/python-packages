{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  python-dateutil,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "kiwiki-client";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "c7h";
    repo = "kiwiki_client";
    tag = finalAttrs.version;
    hash = "sha256-CIBed8HzbUqUIzNy1lHxIgjneA6R8uKtmd43LU92M0Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    requests
  ];

  # Module has no tests

  pythonImportsCheck = [ "kiwiki" ];

  meta = {
    description = "Module to interact with the KIWI.KI API";
    homepage = "https://github.com/c7h/kiwiki_client";
    license = lib.licenses.gpl3Only;
  };
})
