{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  click,
}:

buildPythonPackage rec {
  pname = "click-default-group";
  version = "1.2.4";
  pyproject = true;

  src = fetchPypi {
    pname = "click_default_group";
    inherit version;
    hash = "sha256-6z88mewNRWymzSp/CPfU6RdxvvUbAb3ZWAzGRQ/hJR4=";
  };

  build-system = [ flit-core ];

  dependencies = [ click ];

  pythonImportsCheck = [ "click_default_group" ];

  meta = {
    description = "Group to invoke a command without explicit subcommand name";
    homepage = "https://github.com/click-contrib/click-default-group";
    license = lib.licenses.bsd3;
  };
}
