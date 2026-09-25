{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  forbiddenfruit,
  pytest-asyncio,
  requests,
}:

buildPythonPackage rec {
  pname = "blockbuster";
  version = "1.5.27";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cbornet";
    repo = "blockbuster";
    tag = "v${version}";
    hash = "sha256-r9UcyjBIZjnCxL/8RdMiGb5XiH0s8JnQ8fY9SIC4Hsw=";
  };

  build-system = [ hatchling ];

  dependencies = [ forbiddenfruit ];
  pythonImportsCheck = [ "blockbuster" ];

  meta = {
    description = "Utility to detect blocking calls in the async event loop";
    homepage = "https://github.com/cbornet/blockbuster";
    license = lib.licenses.asl20;
  };
}
