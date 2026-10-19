{
  lib,
  buildPythonPackage,
  six,
  pytz,
  tzlocal,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "tasklib";
  version = "2.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XM1zG1JjbdEEV6i42FjLDQJv+qsePnUbr3kb+APjfXs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    pytz
    tzlocal
  ];

  meta = {
    homepage = "https://github.com/robgolding/tasklib";
    description = "Library for interacting with taskwarrior databases";
    platforms = lib.platforms.all;
    license = lib.licenses.bsd3;
  };
}
