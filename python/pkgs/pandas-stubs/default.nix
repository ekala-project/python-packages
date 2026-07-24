{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  numpy,
  types-pytz,
}:

buildPythonPackage rec {
  pname = "pandas-stubs";
  version = "2.3.3.260113";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pandas-dev";
    repo = "pandas-stubs";
    tag = "v${version}";
    hash = "sha256-DJS3aG79IZowiTqHeOEgDdlH9Z1SXrbZ7yplCrFTtzw=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    numpy
    types-pytz
  ];

  # Stubs package - doesn't provide importable modules on its own
  pythonImportsCheck = [ ];

  meta = {
    description = "Type annotations for Pandas";
    homepage = "https://github.com/pandas-dev/pandas-stubs";
    license = lib.licenses.mit;
  };
}
