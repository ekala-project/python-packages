{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "nocaselist";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ut4OlqEErI3a5JwmGqfCe1ro2UNGYcbNjsFvPNXGd6E=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools-scm[toml]>=9.2.0"' '"setuptools-scm>=9.0.0"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "nocaselist" ];

  meta = {
    description = "Case-insensitive list for Python";
    homepage = "https://github.com/pywbem/nocaselist";
    license = lib.licenses.asl20;
  };
}
