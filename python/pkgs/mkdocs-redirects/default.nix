{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  mkdocs,
}:

buildPythonPackage rec {
  pname = "mkdocs-redirects";
  version = "1.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocs";
    repo = "mkdocs-redirects";
    tag = "v${version}";
    hash = "sha256-YsMA00yajeGSqSB6CdKxGqyClC9Cgc3ImRBTucHEHhs=";
  };

  build-system = [ hatchling ];

  propagatedBuildInputs = [ mkdocs ];
  pythonImportsCheck = [ "mkdocs_redirects" ];

  meta = {
    description = "Open source plugin for Mkdocs page redirects";
    homepage = "https://github.com/mkdocs/mkdocs-redirects";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
