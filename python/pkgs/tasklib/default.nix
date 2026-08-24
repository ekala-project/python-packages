{
  lib,
  buildPythonPackage,
  six,
  pytz,
  tzlocal,
  fetchPypi,
}:

buildPythonPackage rec {
  pname = "tasklib";
  version = "2.5.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XM1zG1JjbdEEV6i42FjLDQJv+qsePnUbr3kb+APjfXs=";
  };

  propagatedBuildInputs = [
    six
    pytz
    tzlocal
  ];

  meta = {
    homepage = "https://github.com/robgolding/tasklib";
    description = "Library for interacting with taskwarrior databases";
    maintainers = [ ];
    platforms = lib.platforms.all;
    license = lib.licenses.bsd3;
  };
}
