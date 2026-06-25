{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  h2,
  multidict,
  setuptools,
}:

buildPythonPackage rec {
  pname = "grpclib";
  version = "0.4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vmagamedov";
    repo = "grpclib";
    tag = "v${version}";
    hash = "sha256-9ElCIL084B+KihV1AXYJejBletj8y6LnoWRGEj4E1tQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    h2
    multidict
  ];

  pythonImportsCheck = [ "grpclib" ];

  meta = {
    description = "Pure-Python gRPC implementation for asyncio";
    homepage = "https://github.com/vmagamedov/grpclib";
    license = lib.licenses.bsd3;
  };
}
