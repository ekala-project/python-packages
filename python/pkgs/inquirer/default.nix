{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # native
  poetry-core,

  # propagated
  blessed,
  editor,
  readchar,

  # tests
  pytest-mock,
  pexpect,
}:

buildPythonPackage rec {
  pname = "inquirer";
  version = "3.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "magmax";
    repo = "python-inquirer";
    tag = "v${version}";
    hash = "sha256-xVHmdJGN5yOxbEkZIiOLqeUwcfdj+o7jTTWBD75szII=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    blessed
    editor
    readchar
  ];
  pythonImportsCheck = [ "inquirer" ];

  meta = {
    description = "Collection of common interactive command line user interfaces, based on Inquirer.js";
    homepage = "https://github.com/magmax/python-inquirer";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
