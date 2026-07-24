{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "typing-inspection";
  version = "0.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "typing-inspection";
    tag = "v${version}";
    hash = "sha256-aGScO+FLEJ5IyI6hBqdsiKJRN7vEG36V5131nhVZEbc=";
  };

  build-system = [ hatchling ];

  dependencies = [
    typing-extensions
  ];

  pythonImportsCheck = [ "typing_inspection" ];

  meta = {
    description = "Runtime typing introspection tools";
    homepage = "https://github.com/pydantic/typing-inspection";
    license = lib.licenses.mit;
  };
}
