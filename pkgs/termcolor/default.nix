{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage rec {
  pname = "termcolor";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NIhxymSOxqmpg6E6tibArM4C9RW54ZgzMrF695eVIcU=";
  };

  postPatch = ''
    # Unknown classifier, likely only once 3.15 is released
    sed -i "/Programming Language :: Python :: 3.15/d" pyproject.toml
  '';

  build-system = [
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [ "termcolor" ];

  meta = {
    description = "ANSI color formatting for output in terminal";
    homepage = "https://github.com/termcolor/termcolor";
    license = lib.licenses.mit;
  };
}
