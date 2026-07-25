{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  hpack,
  hyperframe,
}:

buildPythonPackage rec {
  pname = "h2";
  version = "4.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-hyper";
    repo = "h2";
    tag = "v${version}";
    hash = "sha256-04we2xeh5LtLA4La9WPfXQVczDIz7NpL/6y9TmIELgM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    hpack
    hyperframe
  ];
  pythonImportsCheck = [
    "h2.connection"
    "h2.config"
  ];

  meta = {
    description = "HTTP/2 State-Machine based protocol implementation";
    homepage = "https://github.com/python-hyper/h2";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
