{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  six,
}:

buildPythonPackage rec {
  pname = "dockerpty";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aanWnVc6DaoxvNHAd07u1cFcKV/nGcYaylUO0TkxVs4=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "dockerpty" ];

  meta = {
    description = "Functionality needed to operate the pseudo-tty (PTY) allocated to a docker container";
    homepage = "https://github.com/d11wtq/dockerpty";
    license = lib.licenses.asl20;
  };
}
