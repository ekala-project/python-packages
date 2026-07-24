{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "retry-decorator";
  version = "1.1.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "pnpnpn";
    repo = "retry-decorator";
    tag = "v${version}";
    hash = "sha256-0dZq4YbPcH4ItyMnpF7B20YYLtzwniJClBK9gRndU1M=";
  };

  pythonImportsCheck = [ "retry_decorator" ];

  meta = {
    description = "Decorator for retrying when exceptions occur";
    homepage = "https://github.com/pnpnpn/retry-decorator";
    license = lib.licenses.asl20;
  };
}
