{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ansi";
  version = "0.3.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tehmaze";
    repo = "ansi";
    tag = "ansi-${version}";
    hash = "sha256-PmgB1glksu4roQeZ1o7uilMJNm9xaYqw680N2z+tUUM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "ansi.colour"
    "ansi.color"
  ];

  meta = {
    description = "ANSI cursor movement and graphics";
    homepage = "https://github.com/tehmaze/ansi/";
    license = lib.licenses.mit;
  };
}
