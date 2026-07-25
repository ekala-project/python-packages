{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,

  # important downstream dependencies
  flit,
}:

buildPythonPackage rec {
  pname = "tomli";
  version = "2.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hukkin";
    repo = "tomli";
    rev = version;
    hash = "sha256-MBcmp0SeK/wum3c2c/eu8VEofXDguolHI30QwKahAGE=";
  };

  nativeBuildInputs = [ flit-core ];
  pythonImportsCheck = [ "tomli" ];
  meta = {
    description = "Python library for parsing TOML, fully compatible with TOML v1.0.0";
    homepage = "https://github.com/hukkin/tomli";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
