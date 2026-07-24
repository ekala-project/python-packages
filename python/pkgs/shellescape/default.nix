{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "shellescape";
  version = "3.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QLMQswR5vncb86sovY1AdTd4SIvUbqCWm6CzUDjD7CY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "shellescape" ];

  meta = {
    description = "Shell escape a string to safely use it as a token in a shell command";
    homepage = "https://github.com/chrissimpkins/shellescape";
    license = with lib.licenses; [
      mit
      psfl
    ];
  };
}
