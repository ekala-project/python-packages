{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  argcomplete,
  colorama,
  jmespath,
  pygments,
  pyyaml,
  six,
  tabulate,
}:

buildPythonPackage rec {
  pname = "knack";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ld0y/WND7Jtu0NpymyEjYtDmsSCMAWJjPJDLb5SgWHc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    argcomplete
    colorama
    jmespath
    pygments
    pyyaml
    six
    tabulate
  ];

  pythonImportsCheck = [ "knack" ];

  meta = {
    description = "Command-Line Interface framework";
    homepage = "https://github.com/microsoft/knack";
    license = lib.licenses.mit;
  };
}
