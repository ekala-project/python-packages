{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-asyncio,
}:

buildPythonPackage rec {
  pname = "sanic-routing";
  version = "23.12.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "sanic-org";
    repo = "sanic-routing";
    tag = "v${version}";
    hash = "sha256-IUubPd6mqtCfY4ruI/8wkFcAcS0xXHWbe9RzDac5kRc=";
  };
  pythonImportsCheck = [ "sanic_routing" ];

  meta = {
    description = "Core routing component for the Sanic web framework";
    homepage = "https://github.com/sanic-org/sanic-routing";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
