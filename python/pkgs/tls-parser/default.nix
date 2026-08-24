{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tls-parser";
  version = "2.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nabla-c0d3";
    repo = "tls_parser";
    tag = version;
    hash = "sha256-nNQ5XLsZMUXmsTnaqiUeaaHtiVc5r4woRxeYVhO3ICY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tls_parser" ];

  meta = {
    description = "Small library to parse TLS records";
    homepage = "https://github.com/nabla-c0d3/tls_parser";
    platforms = with lib.platforms; linux ++ darwin;
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
