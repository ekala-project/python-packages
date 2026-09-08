{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  termcolor,
}:

buildPythonPackage rec {
  pname = "sparklines";
  version = "1.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "deeplook";
    repo = "sparklines";
    tag = "v${version}";
    sha256 = "sha256-HXOt3xqXfd9GwHQZifHcveE1v48nKRaCKGAJI8xeLdM=";
  };

  build-system = [ hatchling ];

  dependencies = [ termcolor ];

  pythonImportsCheck = [ "sparklines" ];

  meta = {
    description = "This Python package implements Edward Tufte's concept of sparklines, but limited to text only";
    mainProgram = "sparklines";
    homepage = "https://github.com/deeplook/sparklines";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
