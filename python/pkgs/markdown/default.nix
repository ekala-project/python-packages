{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "markdown";
  version = "3.10.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Python-Markdown";
    repo = "markdown";
    tag = version;
    hash = "sha256-iZ+52xXtpn59HIcG2LTHHV0AMAz5N72np6s8+EOy8MQ=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "markdown" ];

  meta = {
    description = "Python implementation of John Gruber's Markdown";
    mainProgram = "markdown_py";
    homepage = "https://github.com/Python-Markdown/markdown";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
